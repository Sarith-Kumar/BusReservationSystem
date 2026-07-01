<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Payment</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!--  Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!--  Custom Styles -->
  <style>
    body {
      background-image: url('https://source.unsplash.com/1600x900/?payment,travel,bus'); /* realistic background */
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
    .form-card {
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

  <!--  Centered Payment Form -->
  <main>
    <div class="form-card">
      <h2 class="text-center mb-4">Payment</h2>

      <!--  Error Message -->
      <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
      </c:if>

      <!--  Reservation Summary -->
      <ul class="list-group mb-4">
        <li class="list-group-item"><strong>Bus:</strong> ${bus.busName}</li>
        <li class="list-group-item"><strong>Route:</strong> ${source} → ${destination}</li>
        <li class="list-group-item"><strong>Date:</strong> ${date} <strong>Time:</strong> ${time}</li>
        <li class="list-group-item"><strong>Total Price:</strong> ₹${priceTotal}</li>
      </ul>

      <!--  Payment Form -->
      <form method="post" action="/reservations/pay">
        <input type="hidden" name="busId" value="${bus.busId}"/>
        <input type="hidden" name="date" value="${date}"/>
        <input type="hidden" name="time" value="${time}"/>
        <input type="hidden" name="source" value="${source}"/>
        <input type="hidden" name="destination" value="${destination}"/>
        <input type="hidden" name="seatsRequested" value="${seatsRequested}"/>

        <div class="mb-3">
          <label class="form-label">Payment Method</label>
          <select name="paymentMethod" class="form-select" required>
            <option value="UPI">UPI</option>
            <option value="CARD">Card</option>
            <option value="NETBANKING">NetBanking</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label">Payment Identity</label>
          <input name="paymentIdentity" required class="form-control"/>
        </div>

        <button class="btn btn-success w-100">Pay</button>
      </form>
    </div>
  </main>

  <!--  Include footer -->
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
