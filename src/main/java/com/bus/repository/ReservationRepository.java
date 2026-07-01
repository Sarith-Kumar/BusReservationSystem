package com.bus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bus.model.Reservation;
import com.bus.model.User;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
List<Reservation> findByBusBusId(Long busId);
List<Reservation> findByUser(User user);

}
