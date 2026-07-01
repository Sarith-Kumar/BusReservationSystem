package com.bus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bus.model.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
List<Feedback> findByBusBusId(Long busId);
}

