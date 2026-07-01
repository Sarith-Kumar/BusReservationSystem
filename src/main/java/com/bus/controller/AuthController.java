package com.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bus.model.User;
import com.bus.service.AuthService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class AuthController {
	private final AuthService authService;

	public AuthController(AuthService authService) {
		this.authService = authService;
	}

	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("user", new User());
		return "users/register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute User user) {
		authService.register(user);
		return "redirect:/auth/login-user?registered=true";
	}

	@GetMapping("/login-admin")
	public String loginAdminPage() {
		return "users/login-admin";
	}

	@GetMapping("/login-user")
	public String loginUserPage() {
		return "users/login-user";
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, @RequestParam String role,
			HttpSession session) {
		if ("admin".equalsIgnoreCase(role)) {
			if ("admin".equals(username) && "admin123".equals(password)) {
				session.setAttribute("admin", username);
				return "redirect:/admin";
			}
			return "redirect:/auth/login-admin?error=true";
		} else {
			User u = authService.loginUser(username, password);
			if (u != null) {
				session.setAttribute("user", u);
				return "redirect:/";
			}
			return "redirect:/auth/login-user?error=true";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
