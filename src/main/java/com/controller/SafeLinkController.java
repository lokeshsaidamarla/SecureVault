package com.controller;

import com.service.SafeLinkCheckerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SafeLinkController {

    @Autowired
    private SafeLinkCheckerService safeLinkCheckerService;

    @GetMapping("/check-link")
    public String showLinkChecker() {
        return "check-link"; // JSP/Thymeleaf page
    }

    @PostMapping("/check-link")
    public String checkLink(@RequestParam("url") String url, Model model) {
        String result = safeLinkCheckerService.checkUrlSafety(url);
        model.addAttribute("url", url);
        model.addAttribute("result", result);
        return "check-link";
    }
}
