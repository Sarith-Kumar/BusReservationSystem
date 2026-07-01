package com.bus.controller;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bus.model.Feedback;
import com.bus.model.Reservation;
import com.bus.service.FeedbackService;
import com.bus.service.ReservationService;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {

    private final FeedbackService feedbackService;
    private final ReservationService reservationService;

    public FeedbackController(FeedbackService feedbackService, ReservationService reservationService) {
        this.feedbackService = feedbackService;
        this.reservationService = reservationService;
    }

    @GetMapping("/new/{reservationId}")
    public String feedbackForm(@PathVariable Long reservationId, Model model) {
        Reservation res = reservationService.get(reservationId);
        model.addAttribute("reservation", res);
        model.addAttribute("feedback", new Feedback());
        return "feedback/feedback-form";
    }

    @PostMapping("/submit/{reservationId}")
    public String submitFeedback(@PathVariable Long reservationId,
                                 @ModelAttribute Feedback feedback,
                                 RedirectAttributes redirectAttributes) {
        Reservation res = reservationService.get(reservationId);
        feedback.setReservation(res);
        feedback.setSubmittedAt(LocalDateTime.now());
        feedbackService.save(feedback);
     //  flash message
        redirectAttributes.addFlashAttribute("message", "Feedback submitted successfully!");
        return "redirect:/reservations"; // back to user reservations page
    }

    @GetMapping("/admin")
    public String adminFeedback(Model model) {
        model.addAttribute("feedbacks", feedbackService.listAll());
        return "admin/feedback/feedback-list";
    }
    
    @PostMapping("/delete/{id}")
    public String deleteFeedback(@PathVariable Long id) {
        feedbackService.delete(id);
        return "redirect:/feedback/admin"; // back to admin list after delete
    }

}

