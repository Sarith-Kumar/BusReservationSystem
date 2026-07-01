<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bus Reservation System</title>

    <!--  Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--  Custom Styles -->
    <style>
        body {
            background-image: url('https://source.unsplash.com/1600x900/?bus,travel,journey'); /* realistic background */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', sans-serif;
        }
        .hero-box {
            background: rgba(255, 255, 255, 0.9); /* semi-transparent white */
            padding: 40px;
            border-radius: 12px;
            margin-top: 80px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
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
    <!--  Include header -->
    <jsp:include page="common/header.jsp"/>

    <!--  Hero Section -->
    <div class="container hero-box text-center">
        <h1 class="display-4 fw-bold">Bus Reservation System</h1>
        <p class="lead mb-4">Find your bus. Book your seat. Travel made easy.</p>

        <!--  Search Form -->
        <form method="get" action="/buses" class="row g-3 justify-content-center">
            <div class="col-md-4">
                <input type="text" name="from" class="form-control" placeholder="From">
            </div>
            <div class="col-md-4">
                <input type="text" name="to" class="form-control" placeholder="To">
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary w-100">Search</button>
            </div>
        </form>
    </div>

    <!--  Include footer -->
    <jsp:include page="common/footer.jsp"/>

    <!--  Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
