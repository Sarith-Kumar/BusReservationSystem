<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Feedback</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!--  Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!--  Custom Styles -->
  <style>
    body {
      background-image: url('https://source.unsplash.com/1600x900/?feedback,travel,bus'); /* realistic background */
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
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .form-card {
      background: rgba(255, 255, 255, 0.95);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 6px 15px rgba(0,0,0,0.3);
      width: 100%;
      max-width: 600px;
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

  <!--  Centered Feedback Form -->
  <main>
    <div class="form-card">
      <h2 class="text-center mb-4">Feedback for Reservation ${reservation.reservationId}</h2>

      <form method="post" action="/feedback/submit/${reservation.reservationId}">
        <div class="mb-3">
          <label class="form-label">Driver Rating</label>
          <input name="driverRating" type="number" min="1" max="5" class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Service Rating</label>
          <input name="serviceRating" type="number" min="1" max="5" class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Overall Rating</label>
          <input name="overallRating" type="number" min="1" max="5" class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Rating</label>
          <input type="number" name="rating" min="1" max="5" class="form-control"/>
        </div>

        <div class="mb-3">
          <label class="form-label">Comments</label>
          <textarea name="comments" rows="4" class="form-control"></textarea>
        </div>

        <button class="btn btn-primary w-100">Submit</button>
      </form>
    </div>
  </main>

  <!--  Include footer -->
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

  <!--  Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
