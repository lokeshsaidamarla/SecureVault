package com.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

@Controller
public class AppErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Integer status = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
        Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception");
        String message = (throwable != null) ? throwable.getMessage() : (String) request.getAttribute("jakarta.servlet.error.message");
        model.addAttribute("status", status);
        model.addAttribute("message", message);
        return "error"; // error.jsp
    }
}
