<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Buses</title>
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
  <!--  Include header -->
  <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

  <!--  Main Content -->
  <main class="container content-box">
    <h2 class="text-center mb-4">Available Buses</h2>

    <!--  Search Form -->
    <form method="get" action="/buses" class="row g-3 mb-4 justify-content-center">
      <div class="col-md-4">
        <input name="from" placeholder="From" class="form-control"/>
      </div>
      <div class="col-md-4">
        <input name="to" placeholder="To" class="form-control"/>
      </div>
      <div class="col-md-2">
        <button class="btn btn-primary w-100">Search</button>
      </div>
    </form>

    <!--  Bus List -->
    <c:choose>
      <c:when test="${empty buses}">
        <div class="alert alert-warning text-center">
          No buses available. Please contact admin.
        </div>
      </c:when>
      <c:otherwise>
        <table class="table table-striped table-hover">
          <thead class="table-dark">
            <tr>
              <th>Name</th><th>Type</th><th>Route</th><th>Price</th><th>Seats</th><th>Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="b" items="${buses}">
              <tr>
                <td>${b.busName}</td>
                <td>${b.busType}</td>
                <td>${b.route.routeFrom} → ${b.route.routeTo}</td>
                <td>${b.price}</td>
                <td>${b.availableSeats}/${b.seats}</td>
                <td>
                  <a href="/reservations/new?busId=${b.busId}" class="btn btn-success btn-sm">Book</a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:otherwise>
    </c:choose>
  </main>

  <!--  Include footer -->
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
