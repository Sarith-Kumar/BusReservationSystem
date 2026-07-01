	package com.bus.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class Reservation {
@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
private Long reservationId;
private String reservationStatus;
private String reservationType;
private LocalDate reservationDate;
private String reservationTime;
private String source;
private String destination;

@ManyToOne @JoinColumn(name = "bus_id")
private Bus bus;

@ManyToOne @JoinColumn(name = "user_id")
private User user;
private boolean journeyStarted; 
private boolean journeyEnded;
//derived status
@Transient
public String getStatus() {
    if (journeyEnded) return "Ended";
    if (journeyStarted) return "Started";
    return "Not started";
}

private LocalDateTime journeyDate;
private Integer seatsRequested;
}

