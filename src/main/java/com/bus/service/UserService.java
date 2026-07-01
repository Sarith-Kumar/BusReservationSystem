package com.bus.service;

import org.springframework.stereotype.Service;

import com.bus.model.User;
import com.bus.repository.UserRepository;

@Service
public class UserService {
	private final UserRepository repo;

	public UserService(UserRepository repo) {
		this.repo = repo;
	}

	public User register(User u) {
		return repo.save(u);
	}

	public User findByUsername(String username) {
		return repo.findByUsername(username).orElse(null);
	}
}

