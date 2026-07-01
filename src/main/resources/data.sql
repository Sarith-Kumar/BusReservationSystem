-- src/main/resources/data.sql
INSERT INTO admin (admin_username, admin_password) VALUES ('admin','admin123');

INSERT INTO route (route_from, route_to, distance) VALUES ('Hyderabad','Bengaluru',500);
INSERT INTO route (route_from, route_to, distance) VALUES ('Hyderabad','Chennai',630);
INSERT INTO route (route_from, route_to, distance) VALUES ('Hyderabad','Mumbai',710);

INSERT INTO bus (bus_name, driver_name, bus_type, arrival_time, departure_time, seats, available_seats, price, route_id)
VALUES ('Volvo Express','Ramesh','AC Sleeper','08:00:00','20:00:00',40,40,1200,1);

INSERT INTO user (username, password, first_name, last_name, contact, email)
VALUES ('sathya','pass123','Sathya','Kumar','9876543210','sathya@example.com');
