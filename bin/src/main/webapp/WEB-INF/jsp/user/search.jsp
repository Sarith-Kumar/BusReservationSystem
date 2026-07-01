
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
<h2>Find your bus. Book your seat.</h2>

<form method="post" action="/user/search">
  <label>From</label>
  <input type="text" name="from" required>
  <label>To</label>
  <input type="text" name="to" required>
  <button type="submit">Search</button>
</form>

<c:if test="${not empty results}">
  <h3>Available buses from ${from} to ${to}:</h3>
  <ul>
    <c:forEach items="${results}" var="bus">
      <li>${bus.busName} – ${bus.busType} – Seats: ${bus.availableSeats} – Price: ₹${bus.price}</li>
    </c:forEach>
  </ul>
</c:if>


</body>
</html>

