package com.bus.service;

import org.springframework.stereotype.Service;

import com.bus.model.Admin;
import com.bus.repository.AdminRepository;

@Service
public class AdminService {
	private final AdminRepository repo;

	public AdminService(AdminRepository repo) {
		this.repo = repo;
	}

	public Admin findByUsername(String username) {
		return repo.findByAdminUsername(username).orElse(null);
	}
}
