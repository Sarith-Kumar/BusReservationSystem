<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title><c:out value="${title != null ? title : 'Bus Reservation'}"/></title>
  <link rel="stylesheet" href="/css/style.css">
  <script defer src="/js/app.js"></script>
</head>
<body>
  <header>
    <nav>
      <a href="/">Home</a>
      <a href="/buses">Buses</a>
      <a href="/routes">Routes</a>
      <a href="/reservations">Reservations</a>
      <a href="/feedback/new?busId=1">Feedback</a>
      <c:choose>
        <c:when test="${not empty sessionScope.user}">
          <span>Welcome, ${sessionScope.user.firstName}</span>
          <a href="/logout">Logout</a>
        </c:when>
        <c:when test="${not empty sessionScope.admin}">
          <a href="/admin">Admin</a>
          <a href="/logout">Logout</a>
        </c:when>
        <c:otherwise>
          <a href="/login">Login</a>
          <a href="/register">Register</a>
        </c:otherwise>
      </c:choose>
    </nav>
  </header>
  <main>
    <jsp:include page="${pageContent}"/>
  </main>
  <footer>© Bus Reservation System</footer>
</body>
</html>
