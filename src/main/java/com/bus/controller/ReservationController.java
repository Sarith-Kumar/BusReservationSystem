package com.bus.controller;

import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bus.dto.ReservationRequest;
import com.bus.model.Bus;
import com.bus.model.Reservation;
import com.bus.model.User;
import com.bus.service.BusService;
import com.bus.service.ReservationService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/reservations")
public class ReservationController {
	private final ReservationService reservationService;
	private final BusService busService;

	public ReservationController(ReservationService reservationService, BusService busService) {
		this.reservationService = reservationService;
		this.busService = busService;
	}


@GetMapping
public String listReservations(Model model, HttpSession session) {
    User user = (User) session.getAttribute("user");
    if (user == null) {
        return "redirect:/auth/login-user"; //  protect if not logged in
    }
    model.addAttribute("reservations", reservationService.findByUser(user));
    return "reservations/reservation-list";
}

	@GetMapping("/new")
	public String form(@RequestParam Long busId, Model model) {
		Bus bus = busService.get(busId);
		model.addAttribute("bus", bus);
		model.addAttribute("request", new ReservationRequest());
		return "reservations/reservation-form";
	}

	@PostMapping
	public String create(@ModelAttribute ReservationRequest req) {
		Bus bus = busService.get(req.getBusId());
		Reservation r = new Reservation();
		r.setBus(bus);
		r.setReservationStatus("CONFIRMED");
		r.setReservationType(req.getReservationType());
		r.setReservationDate(LocalDate.now());
		r.setReservationTime(LocalTime.now().toString());
		r.setSource(req.getSource());
		r.setDestination(req.getDestination());
		reservationService.create(r);
		return "redirect:/reservations";
	}

	@GetMapping("/{id}/cancel")
	public String cancel(@PathVariable Long id) {
		reservationService.cancel(id);
		return "redirect:/reservations";
	}

	@PostMapping("/payment")
	public String payment(@RequestParam Long busId, @RequestParam String date, @RequestParam String time,
			@RequestParam String source, @RequestParam String destination,
			@RequestParam(required = false) String seatsRequested, Model model) {
		Bus bus = busService.get(busId);
		model.addAttribute("bus", bus);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("source", source);
		model.addAttribute("destination", destination);
		model.addAttribute("seatsRequested", seatsRequested);
		model.addAttribute("priceTotal", bus != null ? bus.getPrice() : 500);
		return "reservations/payment";
	}

	@PostMapping("/pay")
	public String pay(@RequestParam Long busId, @RequestParam String date, @RequestParam String time,
			@RequestParam String source, @RequestParam String destination,
			@RequestParam(required = false) String seatsRequested, @RequestParam String paymentMethod,
			@RequestParam String paymentIdentity, HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/auth/login-user";

		Bus bus = busService.get(busId);
		boolean success = paymentMethod != null && !paymentMethod.isBlank();
		if (!success) {
			model.addAttribute("error", "Payment failed. Try again.");
			model.addAttribute("bus", bus);
			model.addAttribute("date", date);
			model.addAttribute("time", time);
			model.addAttribute("source", source);
			model.addAttribute("destination", destination);
			model.addAttribute("seatsRequested", seatsRequested);
			model.addAttribute("priceTotal", bus.getPrice());
			return "reservations/payment";
		}

		Reservation r = reservationService.book(user, bus, LocalDate.parse(date), time, source, destination, 1);
		if (r == null) {
			model.addAttribute("error", "No seats available");
			return "reservations/payment";
		}
		r.setReservationStatus("CONFIRMED");
		model.addAttribute("reservation", r);
		model.addAttribute("user", user);
		return "reservations/reservation-details";
	}
	
	
    @PostMapping("/start/{id}")
    public String startJourney(@PathVariable Long id) {
        Reservation res = reservationService.get(id);
        res.setJourneyStarted(true);
        reservationService.save(res);
        return "redirect:/reservations";
    }

    @PostMapping("/end/{id}")
    public String endJourney(@PathVariable Long id) {
        Reservation res = reservationService.get(id);
        res.setJourneyEnded(true);
        reservationService.save(res);
        return "redirect:/feedback/new/" + id;
    }
}
