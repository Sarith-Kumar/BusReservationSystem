package com.bus.model;

import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class Feedback {
@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
private Long feedbackId;
private int driverRating;
private int serviceRating;
private int overallRating;
private String comments;
private Date feedbackDate;

@ManyToOne @JoinColumn(name = "user_id")
private User user;

@ManyToOne @JoinColumn(name = "bus_id")
private Bus bus;

@ManyToOne @JoinColumn(name = "reservation_id") 
private Reservation reservation;

private LocalDateTime submittedAt;

private int rating; 
}

