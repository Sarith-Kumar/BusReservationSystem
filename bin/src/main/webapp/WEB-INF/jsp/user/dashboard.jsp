<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="container mt-5">
  <h2>Search Buses</h2>
  <form method="post" action="/user/search" class="row g-3 mb-4">
    <div class="col-md-5">
      <input type="text" name="from" class="form-control" placeholder="Source" required>
    </div>
    <div class="col-md-5">
      <input type="text" name="to" class="form-control" placeholder="Destination" required>
    </div>
    <div class="col-md-2">
      <button type="submit" class="btn btn-primary w-100">Search</button>
    </div>
  </form>

  <h3 class="mt-4">My Past Bookings</h3>
  <c:if test="${not empty reservations}">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>ID</th>
          <th>Bus</th>
          <th>Source</th>
          <th>Destination</th>
          <th>Date</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="r" items="${reservations}">
          <tr>
            <td>${r.reservationId}</td>
            <td>${r.bus.busName}</td>
            <td>${r.source}</td>
            <td>${r.destination}</td>
            <td>${r.reservationDate}</td>
            <td>${r.reservationStatus}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>

  <c:if test="${empty reservations}">
    <p>You have no past bookings yet.</p>
  </c:if>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

</body>
</html>