package com.bus.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bus.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
Optional<User> findByUsername(String username);
}


