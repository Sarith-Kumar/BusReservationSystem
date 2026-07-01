<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Bus</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!--  Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!--  Custom Styles -->
  <style>
    body {
      background-image: url('https://source.unsplash.com/1600x900/?bus,road,travel'); /* realistic background */
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
  <main>
    <div class="form-card">
      <h2 class="text-center mb-4">Edit Bus</h2>

      <!--  Bootstrap Form -->
      <form method="post" action="/admin/buses/update/${bus.busId}">
        <div class="mb-3">
          <label class="form-label">Bus Name</label>
          <input name="busName" value="${bus.busName}" required class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Driver Name</label>
          <input name="driverName" value="${bus.driverName}" required class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Bus Type</label>
          <input name="busType" value="${bus.busType}" required class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Seats</label>
          <input name="seats" type="number" value="${bus.seats}" required class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Available Seats</label>
          <input name="availableSeats" type="number" value="${bus.availableSeats}" required class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Price</label>
          <input name="price" type="number" step="0.01" value="${bus.price}" required class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Route</label>
          <select name="routeId" required class="form-select">
            <c:forEach var="r" items="${routes}">
              <option value="${r.routeId}" <c:if test="${bus.route.routeId == r.routeId}">selected</c:if>>
                ${r.routeFrom} → ${r.routeTo}
              </option>
            </c:forEach>
          </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Update</button>
      </form>
    </div>
  </main>

  <!-- Footer -->
  <footer>
    © 2026 Bus Reservation System | Edit Bus
  </footer>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
