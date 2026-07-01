# 🚌 Bus Reservation System

A full-stack Bus Reservation System developed using Spring Boot, Spring MVC, JSP, MySQL and Bootstrap.

## Features

- User Registration & Login
- Admin Login
- Search Buses
- Book Tickets
- Payment Simulation
- Reservation Management
- Feedback Module
- Bus Management
- Route Management
- Admin Dashboard

## Tech Stack

- Java
- Spring Boot
- Spring MVC
- Spring Data JPA
- JSP
- MySQL
- Bootstrap
- Maven

## Project Architecture

User
↓
Controller
↓
Service
↓
Repository (JPA)
↓
MySQL

## Screenshots

### Home Page

![Home](home.png)

### 🔐 Admin Login
![Admin Login](admin-login.png)

### 📊 Admin Dashboard
![Admin Dashboard](admin-dashboard.png)

### 🚌 Manage Buses
![Manage Buses](manage-buses.png)

### ➕ Add Bus
![Add Bus](add-bus.png)

### 🛣️ Manage Routes
![Manage Routes](manage-routes.png)

### ➕ Add Route
![Add Route](add-route.png)

### 💬 Feedback Management
![Feedback](feedback.png)

### 👤 User Registration
![User Registration](user-register.png)

### 🔍 Available Buses
![Available Buses](available-buses.png)

### 🎫 Reservation Form
![Reservation Form](reservation-form.png)

### 💳 Payment Page
![Payment](payment.png)

### ✅ Reservation Success
![Reservation Success](reservation-success.png)

### 📋 My Reservations
![My Reservations](my-reservations.png)


## Installation

```bash
git clone https://github.com/Sarith-Kumar/BusReservationSystem.git
```

Create MySQL database

```
busreservation
```

Update

```
application.properties
```

Run

```
mvn spring-boot:run
```

## Future Improvements

- Online Payment Gateway
- Email Notifications
- QR Ticket
- Seat Selection
- JWT Authentication
- REST APIs
