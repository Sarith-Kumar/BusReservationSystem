package com.bus.controller;

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
import com.bus.service.FeedbackService;
import com.bus.service.RouteService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final BusService busService;
	private final RouteService routeService;
	private final FeedbackService feedbackService;
	
	public AdminController(BusService busService,FeedbackService feedbackService, RouteService routeService) {
		this.busService = busService;
		this.routeService = routeService;
		this.feedbackService=feedbackService;
	}

	@GetMapping
	public String dashboard(HttpSession session, Model model) {
		if (session.getAttribute("admin") == null)
			return "redirect:/auth/login-admin";
		model.addAttribute("busCount", busService.listAll().size());
		model.addAttribute("routeCount", routeService.listAll().size());
		model.addAttribute("buses", busService.listAll());
		model.addAttribute("routes", routeService.listAll());
		model.addAttribute("feedbackCount", feedbackService.listAll().size());
		return "admin/admin-dashboard";
	}

	@GetMapping("/buses")
    public String adminBuses(Model model) {
        model.addAttribute("buses", busService.listAll());
        return "admin/buses/bus-list";
    }

    @GetMapping("/buses/new")
    public String adminBusForm(Model model) {
        model.addAttribute("bus", new Bus());
        model.addAttribute("routes", routeService.listAll());
        return "admin/buses/bus-form";
    }

    @PostMapping("/buses")
    public String adminBusCreate(@ModelAttribute Bus bus, @RequestParam Long routeId) {
        Route route = routeService.get(routeId);
        bus.setRoute(route);
        busService.save(bus);
        return "redirect:/admin/buses";
    }

    @GetMapping("/buses/edit/{id}")
    public String editBusForm(@PathVariable Long id, Model model) {
        Bus bus = busService.get(id);
        model.addAttribute("bus", bus);
        model.addAttribute("routes", routeService.listAll());
        return "admin/buses/bus-edit-form";
    }

    @PostMapping("/buses/update/{id}")
    public String updateBus(@PathVariable Long id, @ModelAttribute Bus bus, @RequestParam Long routeId) {
        Route route = routeService.get(routeId);
        bus.setRoute(route);
        bus.setBusId(id);
        busService.save(bus);
        return "redirect:/admin/buses";
    }

    @PostMapping("/buses/delete/{id}")
    public String deleteBus(@PathVariable Long id) {
        busService.delete(id);
        return "redirect:/admin/buses";
    }


	@GetMapping("/routes")
	public String adminRoutes(Model model) {
	    model.addAttribute("routes", routeService.listAll());
	    return "admin/routes/route-list";
	}

	@GetMapping("/routes/new")
	public String adminRouteForm(Model model) {
	    model.addAttribute("route", new Route());
	    return "admin/routes/route-form";
	}

	@PostMapping("/routes")
	public String adminRouteCreate(@ModelAttribute Route route) {
	    routeService.save(route);
	    return "redirect:/admin/routes";  // ✅ redirect back to list
	}


	
	// Show edit form
	@GetMapping("/routes/edit/{id}")
	public String editRouteForm(@PathVariable Long id, Model model) {
	    Route route = routeService.get(id);
	    model.addAttribute("route", route);
	    return "admin/routes/route-edit-form";
	}

	// Handle update
	@PostMapping("/routes/update/{id}")
	public String updateRoute(@PathVariable Long id, @ModelAttribute Route route) {
	    route.setRouteId(id); // ensure ID is set
	    routeService.save(route);
	    return "redirect:/admin/routes";
	}
	// Delete route
	@PostMapping("/routes/delete/{id}")
	public String deleteRoute(@PathVariable Long id) {
	    routeService.delete(id);
	    return "redirect:/admin/routes";
	}

}
