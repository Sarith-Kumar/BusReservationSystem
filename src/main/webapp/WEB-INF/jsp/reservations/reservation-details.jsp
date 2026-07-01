<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reservation Details</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!--  Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!--  Custom Styles -->
  <style>
    body {
      background-image: url('https://source.unsplash.com/1600x900/?bus,travel,journey'); /* realistic background */
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      font-family: 'Segoe UI', sans-serif;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    main {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .details-card {
      background: rgba(255, 255, 255, 0.95);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 6px 15px rgba(0,0,0,0.3);
      width: 100%;
      max-width: 600px;
    }
    footer {
      background: rgba(0,0,0,0.8);
      color: #fff;
      text-align: center;
      padding: 12px;
    }
  </style>
</head>
<body>
  <!--  Include header -->
  <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

  <!--  Centered Reservation Details -->
  <main>
    <div class="details-card">
      <h2 class="text-center text-success mb-4">Reservation Success</h2>

      <ul class="list-group mb-4">
        <li class="list-group-item"><strong>Status:</strong> ${reservation.reservationStatus}</li>
        <li class="list-group-item"><strong>User:</strong> ${user.firstName} ${user.lastName}</li>
        <li class="list-group-item"><strong>Bus:</strong> ${reservation.bus.busName} (${reservation.bus.busType})</li>
        <li class="list-group-item"><strong>Driver:</strong> ${reservation.bus.driverName}</li>
        <li class="list-group-item"><strong>Route:</strong> ${reservation.source} → ${reservation.destination}</li>
        <li class="list-group-item"><strong>Date:</strong> ${reservation.reservationDate} <strong>Time:</strong> ${reservation.reservationTime}</li>
      </ul>

      <div class="text-center">
        <a href="/" class="btn btn-primary">Go to Home</a>
      </div>
    </div>
  </main>

  <!--  Include footer -->
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
