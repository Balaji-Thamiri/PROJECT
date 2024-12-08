<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Start Quiz: ${quiz.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" href="/images/SUPERSET.png">
    
</head>
<style>
/* Advanced Quiz Start Page CSS */

:root {
    /* Color Palette */
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --background-color: #f4f6f7;
    --text-color: #2c3e50;
    --border-radius: 12px;
    --box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

/* Global Background and Body Styling */
html, body {
    height: 100%;
    margin: 0;
    background-color: var(--background-color);
}

body {
    font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
    background-image:url('/images/quiz.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    backdrop-filter: blur(5px);
}

/* Overlay Effect */


/* Container Styles */
.container {
    max-width: 800px;
    padding: 6rem;
    perspective: 1000px;
    position: relative;
    z-index: 2;
}

/* Card Enhancements */
.card {
    border: none;
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
    overflow: hidden;
    transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
    background-color: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
}

.card:hover {
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
}

/* Remaining CSS from previous example stays the same */
/* ... (previous styles) ... */

/* Responsive Background Adjustments */
@media (max-width: 768px) {
    body {
        background-image: linear-gradient(
            rgba(255, 255, 255, 0.9), 
            rgba(255, 255, 255, 0.9)
        ), url('/api/placeholder/768/1024');
        background-size: cover;
        background-position: center;
    }

    .container {
        padding: 1rem;
    }
}



/* Accessibility Enhancements */
@media (prefers-reduced-motion: reduce) {
    * {
        transition: none !important;
        animation: none !important;
    }
}
</style>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h3 align="center">${quiz.title}</h3>
            </div>
            <div class="card-body">
                <h5 align="center"><u>Quiz  Details</u></h5>
                <p><strong>Description:</strong> ${quiz.description}</p>
                <p><strong>Difficulty:</strong> ${quiz.difficulty}</p>
                <p><strong>Duration:</strong> ${quiz.duration} minutes</p>

                <form action="/student/take-quiz/${quiz.id}" method="post">
                    <div class="mb-3">
                        <label for="studentName" class="form-label">Student Name</label>
                        <input type="text" class="form-control" id="studentName" 
                               value="${student.firstName} ${student.lastName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="studentEmail" class="form-label">Student Email</label>
                        <input type="email" class="form-control" id="studentEmail" 
                               value="${student.email}" readonly>
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="agreeTerms" required>
                        <label class="form-check-label" for="agreeTerms">
                            I agree to complete the quiz honestly and within the time limit
                        </label>
                    </div>
                    <button type="submit" class="btn btn-success">Start Quiz</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>