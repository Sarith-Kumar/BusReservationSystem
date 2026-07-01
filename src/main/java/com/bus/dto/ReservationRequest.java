package com.bus.dto;



import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class ReservationRequest {
@NotNull private Long busId;
@NotBlank private String source;
@NotBlank private String destination;
@NotBlank private String reservationType;
}




