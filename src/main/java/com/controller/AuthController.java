package com.controller;

import com.model.User;
import com.model.PasswordHistory;
import com.service.UserService;
import com.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService; // ✅ For sending OTP emails

    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    
 // ---------- WELCOME PAGE ----------
    @GetMapping({"/", "/welcome"})
    public String welcomePage() {
        return "welcome"; // ✅ JSP or HTML page named 'welcome.jsp' or 'welcome.html'
    }

    // ---------- LOGIN ----------
    @GetMapping({"/login"})
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        Model model,
                        HttpSession session) {
        User user = userService.findByUsername(username);
        if (user == null || user.getPassword() == null || !passwordEncoder.matches(password, user.getPassword())) {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }

        if (user.getPasswordLastChanged() == null) {
            user.setPasswordLastChanged(LocalDateTime.now());
            userService.saveUser(user);
        }

        LocalDateTime changed = user.getPasswordLastChanged();
        if (changed.plusDays(30).isBefore(LocalDateTime.now())) {
            model.addAttribute("username", username);
            model.addAttribute("error", "Password expired. Please reset your password.");
            return "change-password";
        }

        session.setAttribute("loggedInUser", user);
        model.addAttribute("msg", "Welcome " + username);
        return "home";
    }

    // ---------- REGISTRATION ----------
    @GetMapping("/register")
    public String registerForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String fullName,
                           @RequestParam String email,
                           @RequestParam String phone,
                           Model model) {

        boolean hasError = false;

        if (fullName.length() > 50) {
            model.addAttribute("fullNameError", "Full name cannot exceed 50 characters");
            hasError = true;
        }

        if (username.length() > 20) {
            model.addAttribute("usernameError", "Username cannot exceed 20 characters");
            hasError = true;
        } else if (userService.findByUsername(username) != null) {
            model.addAttribute("usernameError", "Username already exists");
            hasError = true;
        }

        if (email.length() > 50 || !email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            model.addAttribute("emailError", "Invalid email address");
            hasError = true;
        }

        if (!phone.matches("\\d{10}")) {
            model.addAttribute("phoneError", "Phone number must be exactly 10 digits");
            hasError = true;
        }


        if (password.length() < 8 || !password.matches(".*[0-9].*")
            || !password.matches(".*[A-Z].*") || !password.matches(".*[@#$%^&+=!].*")) {
            model.addAttribute("passwordError", "Password must be 8+ chars, include uppercase, number & special char");
            hasError = true;
        }

        if (hasError) {
            model.addAttribute("fullName", fullName);
            model.addAttribute("username", username);
            model.addAttribute("email", email);
            model.addAttribute("phone", phone);
            return "register";
        }

        User user = new User();
        user.setUsername(username);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);

        String hashed = passwordEncoder.encode(password);
        user.setPassword(hashed);
        user.setPasswordLastChanged(LocalDateTime.now());

        userService.saveUser(user);
        userService.addPasswordHistory(user, hashed);

        model.addAttribute("msg", "Registration successful, please login");
        return "login";
    }


    // ---------- HOME ----------
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("msg", "Welcome " + user.getUsername());
        return "home";
    }

    // ---------- CHANGE PASSWORD ----------
    @GetMapping("/change-password")
    public String changePasswordForm(@RequestParam(required = false) String username,
                                     @RequestParam(required = false) String expired,
                                     Model model) {
        model.addAttribute("username", username);
        if ("true".equals(expired)) {
            model.addAttribute("error", "Password expired. Please reset your password.");
        }
        return "change-password";
    }

    @PostMapping("/change-password")
    public String changePassword(@RequestParam String username, @RequestParam String newPassword, Model model) {
        User user = userService.findByUsername(username);
        if (user == null) {
            model.addAttribute("error", "User not found");
            return "change-password";
        }

        if (newPassword.length() < 8 || !newPassword.matches(".*[0-9].*")
                || !newPassword.matches(".*[A-Z].*") || !newPassword.matches(".*[@#$%^&+=!].*")) {
            model.addAttribute("error", "Password must be 8+ chars, include uppercase, number & special char");
            return "change-password";
        }

        List<PasswordHistory> last3 = userService.last3Histories(user);
        for (PasswordHistory ph : last3) {
            if (passwordEncoder.matches(newPassword, ph.getOldPassword())) {
                model.addAttribute("error", "You cannot reuse any of last 3 passwords.");
                return "change-password";
            }
        }

        String hashed = passwordEncoder.encode(newPassword);
        user.setPassword(hashed);
        user.setPasswordLastChanged(LocalDateTime.now());
        userService.saveUser(user);
        userService.addPasswordHistory(user, hashed);

        return "redirect:/login?resetSuccess=true";
    }

    // ---------- LOGOUT ----------
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("msg", "You have been logged out successfully.");
        return "login";
    }

    // ---------- FORGOT PASSWORD ----------
    @GetMapping("/forgotPassword")
    public String forgotPasswordPage() {
        return "forgotPassword";
    }

    @PostMapping("/sendOtp")
    public String sendOtp(@RequestParam String email, HttpSession session, Model model) {
        User user = userService.findByEmail(email);
        if (user == null) {
            model.addAttribute("error", "No user found with this email.");
            return "forgotPassword";
        }

        int otp = (int) (Math.random() * 900000) + 100000;
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);

        emailService.sendEmail(email, "Your OTP for Password Reset", "Your OTP is: " + otp);
        model.addAttribute("msg", "OTP sent to your registered email.");
        return "verifyOtp";
    }

    @PostMapping("/verifyOtp")
    public String verifyOtp(@RequestParam String otp, HttpSession session, Model model) {
        Object sessionOtpObj = session.getAttribute("otp");
        if (sessionOtpObj == null) {
            model.addAttribute("error", "Session expired! Please try again.");
            return "forgotPassword";
        }

        int sessionOtp = (int) sessionOtpObj;
        if (String.valueOf(sessionOtp).equals(otp)) {
            return "resetPassword";
        } else {
            model.addAttribute("error", "Invalid OTP! Please check again.");
            return "verifyOtp";
        }
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam String newPassword, HttpSession session, Model model) {
        String email = (String) session.getAttribute("email");
        if (email == null) {
            model.addAttribute("error", "Session expired! Try again.");
            return "forgotPassword";
        }

        User user = userService.findByEmail(email);
        if (user == null) {
            model.addAttribute("error", "User not found.");
            return "forgotPassword";
        }

        if (newPassword.length() < 8 || !newPassword.matches(".*[0-9].*")
                || !newPassword.matches(".*[A-Z].*") || !newPassword.matches(".*[@#$%^&+=!].*")) {
            model.addAttribute("error", "Password must be 8+ chars, include uppercase, number & special char");
            return "resetPassword";
        }

        String hashed = passwordEncoder.encode(newPassword);
        user.setPassword(hashed);
        user.setPasswordLastChanged(LocalDateTime.now());
        userService.saveUser(user);
        userService.addPasswordHistory(user, hashed);

        model.addAttribute("msg", "Password updated successfully. Please login now.");
        session.invalidate(); // clear OTP
        return "login";
    }
    
    @GetMapping("/camera")
    public String cameraPage() {
        return "camera";
    }

    @PostMapping("/verify-camera")
    public String verifyCamera(@RequestParam String imageData,
                               HttpSession session,
                               Model model) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        // Remove base64 header
        String base64Image = imageData.split(",")[1];

        user.setFaceImage(base64Image);
        userService.saveUser(user);

        model.addAttribute("msg", "Camera verification successful!");
        return "home";
    }

}
