package com.controller;

import com.model.StoredPassword;
import com.model.User;
import com.service.StoredPasswordService;
import com.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
public class PasswordController {

    @Autowired
    private StoredPasswordService passwordService;

    @Autowired
    private UserService userService;

    @GetMapping("/add-password")
    public String showAddPasswordPage(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }
        List<StoredPassword> list = passwordService.getPasswords(user);
        model.addAttribute("passwords", list);
        return "add-password";
    }

    @PostMapping("/add-password")
    public String addPassword(@RequestParam String siteName,
                              @RequestParam String siteUrl,
                              @RequestParam String siteUsername,
                              @RequestParam String sitePassword,
                              HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }
        passwordService.addPassword(user, siteName, siteUrl, siteUsername, sitePassword);
        return "redirect:/add-password";
    }

    @GetMapping("/delete-password/{id}")
    public String deletePassword(@PathVariable Long id) {
        passwordService.deletePassword(id);
        return "redirect:/add-password";
    }

    @GetMapping("/edit-password/{id}")
    public String editPasswordForm(@PathVariable Long id, Model model) {
        StoredPassword sp = passwordService.getById(id);
        model.addAttribute("sp", sp);
        return "edit-password"; // JSP page
    }
    
    

    @PostMapping("/update-password")
    public String updatePassword(@RequestParam Long id,
                                 @RequestParam String siteName,
                                 @RequestParam String siteUrl,
                                 @RequestParam String siteUsername,
                                 @RequestParam String sitePassword) {
        StoredPassword sp = passwordService.getById(id);
        sp.setSiteName(siteName);
        sp.setSiteUrl(siteUrl);
        sp.setSiteUsername(siteUsername);
        sp.setSitePassword(sitePassword);
        passwordService.updatePassword(sp);
        return "redirect:/add-password";
    }

}
