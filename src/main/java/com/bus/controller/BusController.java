package com.bus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bus.model.Bus;
import com.bus.model.Route;
import com.bus.service.BusService;
import com.bus.service.RouteService;

@Controller
@RequestMapping("/buses")
public class BusController {
	private final BusService busService;
	private final RouteService routeService;

	public BusController(BusService busService, RouteService routeService) {
		this.busService = busService;
		this.routeService = routeService;
	}

	@GetMapping
	public String list(Model model, @RequestParam(required = false) String from,
			@RequestParam(required = false) String to) {
		List<Bus> buses = (from != null && to != null) ? busService.searchByRoute(from, to) : busService.listAll();
		model.addAttribute("buses", buses);
		return "buses/bus-list";
	}

	@GetMapping("/new")
	public String createForm(Model model) {
		model.addAttribute("bus", new Bus());
		model.addAttribute("routes", routeService.listAll());
		return "buses/bus-form";
	}

	@PostMapping
	public String create(@ModelAttribute Bus bus, @RequestParam Long routeId) {
		Route route = routeService.get(routeId);
		bus.setRoute(route);
		busService.save(bus);
		return "redirect:/buses";
	}

	@GetMapping("/{id}/delete")
	public String delete(@PathVariable Long id) {
		busService.delete(id);
		return "redirect:/buses";
	}
}
