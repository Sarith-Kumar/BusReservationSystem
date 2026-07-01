<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Buses</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!--  Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!--  Custom Styles -->
  <style>
    body {
      background-image: url('https://source.unsplash.com/1600x900/?bus,travel,road'); /* realistic background */
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
    }
    .content-box {
      background: rgba(255, 255, 255, 0.95);
      padding: 30px;
      border-radius: 12px;
      margin-top: 40px;
      box-shadow: 0 6px 15px rgba(0,0,0,0.3);
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
  <main class="container content-box">
    <h2 class="text-center mb-4">Manage Buses</h2>

    <!--  Action Links -->
    <div class="d-flex justify-content-between mb-3">
      <a href="/admin/buses/new" class="btn btn-success">Add New Bus</a>
      <a href="/admin" class="btn btn-secondary">Dashboard</a>
    </div>

    <!--  Styled Table -->
    <table class="table table-striped table-hover">
      <thead class="table-dark">
        <tr>
          <th>ID</th><th>Name</th><th>Driver</th><th>Type</th>
          <th>Seats</th><th>Available</th><th>Price</th><th>Route</th><th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="b" items="${buses}">
          <tr>
            <td>${b.busId}</td>
            <td>${b.busName}</td>
            <td>${b.driverName}</td>
            <td>${b.busType}</td>
            <td>${b.availableSeats}/${b.seats}</td>
            <td>${b.availableSeats}</td>
            <td>${b.price}</td>
            <td>${b.route.routeFrom} → ${b.route.routeTo}</td>
            <td>
              <a href="/admin/buses/edit/${b.busId}" class="btn btn-primary btn-sm">Edit</a>
              <form method="post" action="/admin/buses/delete/${b.busId}" style="display:inline">
                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </main>

  <!--  Footer -->
  <footer>
    © 2026 Bus Reservation System | Manage Buses
  </footer>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
