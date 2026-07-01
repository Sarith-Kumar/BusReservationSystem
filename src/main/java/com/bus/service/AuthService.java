package com.bus.service;

import org.springframework.stereotype.Service;

import com.bus.model.User;
import com.bus.repository.UserRepository;

@Service
public class AuthService {
	private final UserRepository userRepo;

	public AuthService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}

	public User register(User user) {
		return userRepo.save(user);
	}

	public User loginUser(String username, String password) {
		return userRepo.findByUsername(username).filter(u -> u.getPassword().equals(password)).orElse(null);
	}
}
