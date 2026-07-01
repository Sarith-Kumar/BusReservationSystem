package com.bus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bus.exception.ResourceNotFoundException;
import com.bus.model.Bus;
import com.bus.repository.BusRepository;

@Service
public class BusService {
	private final BusRepository repo;

	public BusService(BusRepository repo) {
		this.repo = repo;
	}

	public List<Bus> listAll() {
		return repo.findAll();
	}

	public Bus get(Long id) {
		return repo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Bus not found"));
	}

	public Bus save(Bus bus) {
		return repo.save(bus);
	}

	public void delete(Long id) {
		repo.deleteById(id);
	}

	public List<Bus> searchByRoute(String from, String to) {
		return repo.findByRouteRouteFromAndRouteRouteTo(from, to);
	}
}
