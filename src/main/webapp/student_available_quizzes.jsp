<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Quizzes</title>
        <link rel="icon" href="/images/SUPERSET.png">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       :root {
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --text-dark: #2c3e50;
}

body, html {
    height: 100%;
    margin: 0;
    font-family: 'Inter', 'Arial', sans-serif;
    line-height: 1.6;
}

.quiz-background {
    background: linear-gradient(
        135deg, 
        #6a11cb 0%, 
        #2575fc 100%
    );
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-attachment: fixed;
}

.quiz-background::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    backdrop-filter: blur(10px);
    z-index: 0;
}

.quiz-container {
    position: relative;
    z-index: 10;
    background: linear-gradient(to bottom right, 
        rgba(255, 255, 255, 0.9), 
        rgba(255, 255, 255, 0.95));
    border-radius: 20px;
    box-shadow: var(--card-shadow);
    padding: 90px;
    margin-top: 80px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    backdrop-filter: blur(15px);
    transition: all 0.4s ease;
}

.quiz-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 20px 40px rgba(50, 50, 93, 0.15);
}

.quiz-header {
    background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-align: center;
    margin-bottom: 40px;
    font-weight: 800;
    font-size: 2.5rem;
    letter-spacing: -1px;
}

.card {
    position: relative;
    overflow: hidden;
    border-radius: 15px;
    transition: all 0.4s ease;
    transform-style: preserve-3d;
    perspective: 1000px;
}

.card::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(
        45deg, 
        transparent, 
        rgba(52, 152, 219, 0.1), 
        transparent
    );
    transform: rotate(-45deg);
    transition: all 0.6s ease;
    opacity: 0;
}

.card:hover::before {
    opacity: 1;
}

.card:hover {
    transform: scale(1.05) rotateX(5deg);
    box-shadow: 0 25px 50px rgba(50, 50, 93, 0.15);
}

.card-body {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 100%;
    padding: 25px;
    transition: all 0.3s ease;
}

.btn-start-quiz {
    position: relative;
    background: linear-gradient(135deg, var(--primary-color), #2980b9);
    border: none;
    overflow: hidden;
    transition: all 0.4s ease;
}

.btn-start-quiz::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        120deg, 
        transparent, 
        rgba(255,255,255,0.3), 
        transparent
    );
    transition: all 0.4s ease;
}

.btn-start-quiz:hover::before {
    left: 100%;
}

.btn-start-quiz:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.difficulty-badge {
    position: relative;
    display: inline-block;
    padding: 6px 12px;
    border-radius: 30px;
    font-size: 0.8em;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: uppercase;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.difficulty-easy {
    background: linear-gradient(to right, #2ecc71, #27ae60);
    color: white;
}

.difficulty-medium {
    background: linear-gradient(to right, #f39c12, #d35400);
    color: white;
}

.difficulty-hard {
    background: linear-gradient(to right, #e74c3c, #c0392b);
    color: white;
}

.no-quizzes {
    background: linear-gradient(
        to bottom right, 
        rgba(255, 255, 255, 0.9), 
        rgba(255, 255, 255, 0.95)
    );
    border-radius: 20px;
    text-align: center;
    padding: 60px;
    box-shadow: var(--card-shadow);
    border: 1px solid rgba(255, 255, 255, 0.18);
}

@media (max-width: 768px) {
    .quiz-container {
        margin-top: 20px;
        padding: 20px;
    }

    .quiz-header {
        font-size: 2rem;
    }

    .card:hover {
        transform: none;
    }
}
    </style>
</head>
<jsp:include page="studentnavbar.jsp" />
<body class="quiz-background">
    <div class="container quiz-container">
        <h2 class="quiz-header">Available Quizzes</h2>
        <c:choose>
            <c:when test="${not empty quizzes}">
                <div class="row">
                    <c:forEach var="quiz" items="${quizzes}">
                        <div class="col-md-4 mb-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div>
                                        <h5 class="card-title mb-3">${quiz.title}</h5>
                                        <p class="card-text text-muted mb-3">${quiz.description}</p>
                                        
                                        <span class="difficulty-badge 
                                            ${quiz.difficulty eq 'Easy' ? 'difficulty-easy' : 
                                              quiz.difficulty eq 'Medium' ? 'difficulty-medium' : 
                                              'difficulty-hard'}">
                                            ${quiz.difficulty} Difficulty
                                        </span>
                                        
                                        <ul class="list-unstyled mt-3">
                                            <li><strong>Duration:</strong> ${quiz.duration} minutes</li>
                                        </ul>
                                    </div>
                                    <a href="/student/start-quiz/${quiz.id}" class="btn btn-start-quiz btn-primary w-100 mt-3">Start Quiz</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-quizzes">
                    <h4>No Quizzes Available</h4>
                    <p>Check back later for new quiz opportunities!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>