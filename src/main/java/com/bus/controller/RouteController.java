package com.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bus.model.Route;
import com.bus.service.RouteService;

@Controller
@RequestMapping("/routes")
public class RouteController {
	private final RouteService service;

	public RouteController(RouteService service) {
		this.service = service;
	}

	@GetMapping
	public String list(Model model) {
		model.addAttribute("routes", service.listAll());
		return "routes/route-list";
	}

	@GetMapping("/new")
	public String form(Model model) {
		model.addAttribute("route", new Route());
		return "routes/route-form";
	}

	@PostMapping
	public String create(@ModelAttribute Route route) {
		service.save(route);
		return "redirect:/routes";
	}

	@GetMapping("/{id}/delete")
	public String delete(@PathVariable Long id) {
		service.delete(id);
		return "redirect:/routes";
	}
}
