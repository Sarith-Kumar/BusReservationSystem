package com.bus.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter @AllArgsConstructor @NoArgsConstructor
@Table(name = "route")
public class Route {
@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
private Long routeId;

@Column(name = "route_from", nullable = false)
private String routeFrom;

@Column(name = "route_to", nullable = false)
private String routeTo;

@Column(name = "distance", nullable = false)
private int distance;

@OneToMany(mappedBy = "route")
private List<Bus> buses;
}
