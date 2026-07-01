package com.bus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bus.model.Bus;

public interface BusRepository extends JpaRepository<Bus, Long> {
List<Bus> findByRouteRouteFromAndRouteRouteTo(String routeFrom, String routeTo);
}



