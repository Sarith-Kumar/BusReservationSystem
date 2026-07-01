package com.bus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bus.dto.LoginRequest;
import com.bus.model.Admin;
import com.bus.model.Bus;
import com.bus.model.User;
import com.bus.service.AdminService;
import com.bus.service.BusService;
import com.bus.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
    private final UserService userService;
    private final AdminService adminService;
    private final BusService busService;

    public UserController(UserService userService, AdminService adminService, BusService busService) {
        this.userService = userService;
        this.adminService = adminService;
        this.busService = busService;
    }

    // ---------------- LOGIN ----------------
    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("login", new LoginRequest());
        return "users/login";
    }

    @PostMapping("/login")
    public String login(@Valid LoginRequest login, HttpSession session) {
        User u = userService.findByUsername(login.getUsername());
        if (u != null && u.getPassword().equals(login.getPassword())) {
            session.setAttribute("user", u);
            return "redirect:/";
        }
        Admin a = adminService.findByUsername(login.getUsername());
        if (a != null && a.getAdminPassword().equals(login.getPassword())) {
            session.setAttribute("admin", a);
            return "redirect:/admin";
        }
        return "redirect:/login?error=true";
    }

    // ---------------- REGISTER ----------------
    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User());
        return "users/register";
    }

    @PostMapping("/register")
    public String register(@Valid User user) {
        userService.register(user);
        return "redirect:/login?registered=true";
    }

    // ---------------- LOGOUT ----------------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // ---------------- SEARCH ----------------
    @GetMapping("/user/search")
    public String searchForm() {
        return "user/search"; // matches /WEB-INF/jsp/users/search.jsp
    }

    @PostMapping("/user/search")
    public String searchResults(@RequestParam String from,
                                @RequestParam String to,
                                Model model) {
        List<Bus> results = busService.searchByRoute(from, to);
        model.addAttribute("results", results);
        model.addAttribute("from", from);
        model.addAttribute("to", to);
        return "user/search";
    }

}

