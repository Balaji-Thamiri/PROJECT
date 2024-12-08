<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz: ${quiz.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="/images/SUPERSET.png">
    
    <style>
        body {
            background-color: #f4f6f9;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .quiz-container {
            max-width: 800px;
            width: 100%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="quiz-container p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="text-primary">${quiz.title}</h2>
            </div>

            <form id="quizForm" action="/student/submit-quiz" method="post">
                <input type="hidden" name="quizId" value="${quiz.id}">
                
                <c:forEach var="question" items="${quiz.questions}" varStatus="status">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Question ${status.index + 1}</h5>
                            <p class="card-text">${question.questionText}</p>
                            
                            <div class="form-check">
                                <input class="form-check-input" type="radio" 
                                       name="question_${question.id}" 
                                       id="question_${question.id}_option1" 
                                       value="1">
                                <label class="form-check-label" for="question_${question.id}_option1">
                                    ${question.option1}
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" 
                                       name="question_${question.id}" 
                                       id="question_${question.id}_option2" 
                                       value="2">
                                <label class="form-check-label" for="question_${question.id}_option2">
                                    ${question.option2}
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" 
                                       name="question_${question.id}" 
                                       id="question_${question.id}_option3" 
                                       value="3">
                                <label class="form-check-label" for="question_${question.id}_option3">
                                    ${question.option3}
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" 
                                       name="question_${question.id}" 
                                       id="question_${question.id}_option4" 
                                       value="4">
                                <label class="form-check-label" for="question_${question.id}_option4">
                                    ${question.option4}
                                </label>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-lg">Submit Quiz</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Timer functionality
        let duration = ${quiz.duration} * 60; // Convert minutes to seconds
        const timerDisplay = document.getElementById('timer');
        const quizForm = document.getElementById('quizForm');

        function updateTimer() {
            const minutes = Math.floor(duration / 60);
            const seconds = duration % 60;
            timerDisplay.textContent = `Time Left: ${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;

            if (duration <= 0) {
                quizForm.submit();
            } else {
                duration--;
                setTimeout(updateTimer, 1000);
            }
        }

        updateTimer();
    </script>
</body>
</html>