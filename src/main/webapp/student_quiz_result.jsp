<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/images/SUPERSET.png">

<title>Quiz Result</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
  background-image: url('/images/quiz.jpg');
  background-size: cover; /* Ensures the image covers the entire background */
  background-position: center; /* Centers the image */
  background-repeat: no-repeat; /* Prevents tiling */
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Arial', sans-serif;
  margin: 0; /* Removes default body margin */
}

.result-container {
max-width: 600px;
width: 100%;
background: rgba(255, 255, 255, 0.9);
border-radius: 15px;
box-shadow: 0 15px 35px rgba(0,0,0,0.1);
padding: 30px;
text-align: center;
backdrop-filter: blur(10px);
}
.card-header {
background: linear-gradient(to right, #4a90e2, #50c878);
color: white;
border-top-left-radius: 15px;
border-top-right-radius: 15px;
padding: 15px;
margin: -30px -30px 30px;
}
.btn-container {
display: flex;
justify-content: center;
gap: 15px;
margin-top: 20px;
}
.btn-custom {
transition: all 0.3s ease;
text-transform: uppercase;
font-weight: 600;
letter-spacing: 1px;
}
.btn-custom:hover {
transform: translateY(-3px);
box-shadow: 0 7px 14px rgba(50,50,93,.1), 0 3px 6px rgba(0,0,0,.08);
}
</style>
</head>
<body>
<div class="result-container">
  <div class="card-header">
    <h3>Quiz Completed</h3>
  </div>
  <div class="result-details">
    <c:if test="${not empty quizResult}">
      <h4>Your Score: ${quizResult.score}/${quizResult.totalQuestions}</h4>
      <p>Performance: ${quizResult.percentage}%</p>
    </c:if>
  </div>
  <div class="btn-container">
    <a href="/student/available-quizzes" class="btn btn-primary btn-custom">Take Another Quiz</a>
    <a href="/student/studenthome" class="btn btn-secondary btn-custom">Back to Dashboard</a>
  </div>
</div>
</body>
</html>