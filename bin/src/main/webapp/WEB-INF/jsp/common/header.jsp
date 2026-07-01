<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <!-- Brand -->
    <a class="navbar-brand" href="/">BusReserve</a>

    <!-- Toggler for mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="/buses">Buses</a></li>
        <li class="nav-item"><a class="nav-link" href="/routes">Routes</a></li>
        <li class="nav-item"><a class="nav-link" href="/reservations">Reservations</a></li>
      </ul>

      <!-- Right side links -->
      <ul class="navbar-nav">
        <c:choose>
          <c:when test="${not empty sessionScope.admin}">
            <li class="nav-item"><a class="nav-link" href="/admin">Admin Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="/auth/logout">Logout</a></li>
          </c:when>
          <c:when test="${not empty sessionScope.user}">
            <li class="nav-item"><span class="navbar-text">Welcome, ${sessionScope.user.firstName}</span></li>
            <li class="nav-item"><a class="nav-link" href="/auth/logout">Logout</a></li>
          </c:when>
          <c:otherwise>
            <li class="nav-item"><a class="nav-link" href="/auth/login-admin">Admin Login</a></li>
            <li class="nav-item"><a class="nav-link" href="/auth/login-user">User Login</a></li>
            <li class="nav-item"><a class="nav-link" href="/auth/register">Register</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>
