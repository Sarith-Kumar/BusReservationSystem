package com.bus.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bus.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
Optional<Admin> findByAdminUsername(String adminUsername);
}



