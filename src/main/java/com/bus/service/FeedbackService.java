package com.bus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bus.exception.ResourceNotFoundException;
import com.bus.model.Feedback;
import com.bus.repository.BusRepository;
import com.bus.repository.FeedbackRepository;

@Service
public class FeedbackService {
	private final FeedbackRepository repo;
	private final BusRepository busRepo;

	public FeedbackService(FeedbackRepository repo, BusRepository busRepo) {
		this.repo = repo;
		this.busRepo = busRepo;
	}

	public List<Feedback> listAll() {
		return repo.findAll();
	}

	public Feedback submit(Feedback f) {
		busRepo.findById(f.getBus().getBusId()).orElseThrow(() -> new ResourceNotFoundException("Bus not found"));
		return repo.save(f);
	}
	
	 // save feedback
    public void save(Feedback feedback) {
        repo.save(feedback);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }

}
