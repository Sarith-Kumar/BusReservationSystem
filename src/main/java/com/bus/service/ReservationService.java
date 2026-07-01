package com.bus.service;

import java.time.LocalDate;
import java.util.List;

import org.jspecify.annotations.Nullable;
import org.springframework.stereotype.Service;

import com.bus.exception.ResourceNotFoundException;
import com.bus.model.Bus;
import com.bus.model.Reservation;
import com.bus.model.User;
import com.bus.repository.BusRepository;
import com.bus.repository.ReservationRepository;

import jakarta.transaction.Transactional;

@Service
public class ReservationService {
	private final ReservationRepository reservationRepo;
	private final BusRepository busRepo;

	public ReservationService(ReservationRepository reservationRepo, BusRepository busRepo) {
		this.reservationRepo = reservationRepo;
		this.busRepo = busRepo;
	}

	public List<Reservation> listAll() {
		return reservationRepo.findAll();
	}

	public Reservation create(Reservation r) {
		return reservationRepo.save(r);
	}

	@Transactional
	public Reservation book(User user, Bus bus, LocalDate date, String time,
	                        String source, String destination, int seatsRequested) {
	    Bus b = busRepo.findById(bus.getBusId())
	                   .orElseThrow(() -> new ResourceNotFoundException("Bus not found"));

	    if (b.getAvailableSeats() == null || b.getAvailableSeats() < seatsRequested) {
	        throw new RuntimeException("Not enough seats available");
	    }

	    b.setAvailableSeats(b.getAvailableSeats() - seatsRequested);
	    busRepo.save(b);

	    Reservation r = new Reservation();
	    r.setBus(b);
	    r.setUser(user);
	    r.setReservationStatus("CONFIRMED");
	    r.setReservationType("ONLINE");
	    r.setReservationDate(date);
	    r.setReservationTime(time);
	    r.setSource(source);
	    r.setDestination(destination);
	    r.setSeatsRequested(seatsRequested); //store how many seats were booked
	    return reservationRepo.save(r);
	}


	public void cancel(Long id) {
		Reservation r = reservationRepo.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("Reservation not found"));
		r.setReservationStatus("CANCELLED");
		reservationRepo.save(r);

		Bus b = r.getBus();
		if (b != null && b.getAvailableSeats() != null) {
			b.setAvailableSeats(b.getAvailableSeats() + 1);
			busRepo.save(b);
		}
	}

	public List<Reservation> findByUser(User user) { 
		return reservationRepo.findByUser(user); 
		}
	
	// get reservation by id 
	public Reservation get(Long id) { 
		return reservationRepo.findById(id) 
				.orElseThrow(() -> new RuntimeException("Reservation not found: " + id)); 
		}

    public void save(Reservation reservation) {
        reservationRepo.save(reservation);
    }


    public List<Reservation> findByBus(Long busId) {
        return reservationRepo.findByBusBusId(busId);
    }
}
