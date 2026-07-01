<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Feedback List</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!--  Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!--  Custom Styles -->
  <style>
    body {
      background-image: url('https://source.unsplash.com/1600x900/?feedback,meeting,bus'); /* realistic background */
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
    <h2 class="text-center mb-4">Feedback List</h2>

    <!--  Dashboard Link -->
    <div class="mb-3 text-end">
      <a href="/admin" class="btn btn-secondary">Go to Dashboard</a>
    </div>

    <!--  Styled Table -->
    <table class="table table-striped table-hover">
      <thead class="table-dark">
        <tr>
          <th>ID</th><th>User</th><th>Driver</th><th>Bus</th><th>Date</th><th>Comments</th><th>Rating</th><th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="f" items="${feedbacks}">
          <tr>
            <td>${f.feedbackId}</td>
            <td>${f.reservation.user.username}</td>
            <td>${f.reservation.bus.driverName}</td>
            <td>${f.reservation.bus.busName}</td>
            <td>${f.reservation.journeyDate}</td>
            <td>${f.comments}</td>
            <td>${f.rating}</td>
            <td>
              <form action="${pageContext.request.contextPath}/feedback/delete/${f.feedbackId}" method="post" style="display:inline">
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
    © 2026 Bus Reservation System | Feedback Management
  </footer>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
