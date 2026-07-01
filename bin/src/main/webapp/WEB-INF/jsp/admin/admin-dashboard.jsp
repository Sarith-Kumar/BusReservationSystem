<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!--  Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--  Custom Styles -->
    <style>
        body {
            background-image: url('https://source.unsplash.com/1600x900/?bus,city,travel'); /* realistic background */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', sans-serif;
        }
        .dashboard-box {
            background: rgba(255, 255, 255, 0.9); /* semi-transparent white */
            padding: 30px;
            border-radius: 12px;
            margin-top: 40px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }
        .card {
            margin: 15px 0;
        }
        footer {
            background: rgba(0,0,0,0.7);
            color: #fff;
            text-align: center;
            padding: 10px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/common/header.jsp" />

    <div class="container dashboard-box">
        <h2 class="text-center mb-4">Admin Dashboard</h2>

        <!-- Stats cards -->
        <div class="row text-center">
            <div class="col-md-4">
                <div class="card bg-primary text-white">
                    <div class="card-body">
                        <h5 class="card-title">Buses</h5>
                        <p class="card-text display-6">${busCount}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-success text-white">
                    <div class="card-body">
                        <h5 class="card-title">Routes</h5>
                        <p class="card-text display-6">${routeCount}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-warning text-dark">
                    <div class="card-body">
                        <h5 class="card-title">Feedbacks</h5>
                        <p class="card-text display-6">${feedbackCount}</p>
                    </div>
                </div>
            </div>
        </div>

        <hr class="my-4"/>

        <!--  Quick links -->
        <h3 class="text-center mb-3">Quick Links</h3>
        <div class="d-flex justify-content-center gap-3">
            <a href="/admin/buses" class="btn btn-outline-primary btn-lg">Manage Buses</a>
            <a href="/admin/routes" class="btn btn-outline-success btn-lg">Manage Routes</a>
            <a href="/feedback/admin" class="btn btn-outline-warning btn-lg">View Feedback</a>
        </div>
    </div>

  <footer class="footer mt-auto py-3 bg-dark text-white fixed-bottom">
  <div class="container text-center">
    <span> 2026 Bus Reservation System | Designed with  using Bootstrap</span>
  </div>
</footer>


    <!--  Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
