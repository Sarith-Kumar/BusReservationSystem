<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Reservations</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!-- Bootstrap CSS -->
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
  <!--  Include header -->
  <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

  <!--  Main Content -->
  <main class="container content-box">
    <h2 class="text-center mb-4">My Reservations</h2>

    <!--  Success Message -->
    <c:if test="${not empty message}">
      <div class="alert alert-success text-center">
        ${message}
      </div>
    </c:if>

    <!--  Styled Table -->
    <table class="table table-striped table-hover">
      <thead class="table-dark">
        <tr>
          <th>ID</th><th>Status</th><th>User</th><th>Bus</th><th>Route</th><th>Date</th><th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="r" items="${reservations}">
          <tr>
            <td>${r.reservationId}</td>
            <td>
              <c:choose>
                <c:when test="${r.journeyEnded}">Ended</c:when>
                <c:when test="${r.journeyStarted}">Started</c:when>
                <c:otherwise>${r.status}</c:otherwise>
              </c:choose>
            </td>
            <td>${r.user.username}</td>
            <td>${r.bus.busName}</td>
            <td>${r.bus.route.routeFrom} → ${r.bus.route.routeTo}</td>
  <td>${r.journeyDate}</td>

            <td>
              <c:if test="${!r.journeyStarted}">
                <form method="post" action="/reservations/start/${r.reservationId}" style="display:inline">
                  <button type="submit" class="btn btn-primary btn-sm">Start Journey</button>
                </form>
              </c:if>
              <c:if test="${r.journeyStarted && !r.journeyEnded}">
                <form method="post" action="/reservations/end/${r.reservationId}" style="display:inline">
                  <button type="submit" class="btn btn-danger btn-sm">End Journey</button>
                </form>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </main>

  <!--  Include footer -->
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
