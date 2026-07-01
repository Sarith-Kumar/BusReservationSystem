package com.bus.model;

import java.sql.Time;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter @AllArgsConstructor @NoArgsConstructor
@Table(name = "bus")
public class Bus {
@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
private Long busId;
private String busName;
private String driverName;
private String busType;
private Time arrivalTime;
private Time departureTime;
private Integer seats;
private Integer availableSeats;
private Double price;

@ManyToOne
@JoinColumn(name = "route_id", nullable = false)
private Route route;
}
