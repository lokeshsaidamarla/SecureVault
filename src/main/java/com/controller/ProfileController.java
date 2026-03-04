package com.controller;

import com.model.User;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProfileController {

    // SHOW PROFILE
    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user);

        return "profile";
    }

    // OPEN EDIT PROFILE PAGE
    @GetMapping("/profile/edit")
    public String editProfile(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user);

        return "profile_edit";
    }

    // UPDATE PROFILE
    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam Long id,
                                @RequestParam String fullName,
                                @RequestParam String email,
                                @RequestParam String phone,
                                HttpSession session) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);

        // update session user
        session.setAttribute("loggedInUser", user);

        return "redirect:/profile";
    }
}