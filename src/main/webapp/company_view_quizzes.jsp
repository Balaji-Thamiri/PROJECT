<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Quizzes</title>
         <link rel="icon" href="/images/SUPERSET.png">
    
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #2ecc71;
            --accent-color: #e74c3c;
            --performance-color: #6a5acd;
            --add-quiz-color: #2ecc71;
            --background-color: #f4f6f9;
            --card-background: white;
            --text-color: #2c3e50;
            --border-radius: 16px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', -apple-system, BlinkMacSystemFont, 'Roboto', sans-serif;
            background: 
                url('/images/quizzy.jpg') no-repeat center center fixed,
                linear-gradient(
                    135deg, 
                    var(--background-color), 
                    color-mix(in srgb, var(--background-color) 90%, white)
                );
            background-size: cover;
            min-height: 100vh;
            line-height: 1.6;
            color: var(--text-color);
            padding: 150px 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            gap: 15px; /* Added to create space between buttons */
        }

      .page-header-buttons {
    display: flex;
    justify-content: center; /* Centers buttons horizontally */
    gap: 15px; /* Space between buttons */
    align-items: center; /* Aligns buttons vertically if they have different heights */
    margin: 0 auto; /* Centers the container if it's not full-width */
}

        .performance-btn, .add-quiz-btn {
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .performance-btn {
            background-color: var(--performance-color);
        }

        .add-quiz-btn {
            background-color: var(--add-quiz-color);
        }

        .performance-btn:hover, .add-quiz-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(106, 90, 205, 0.3);
        }

        .performance-btn:hover {
            background-color: color-mix(in srgb, var(--performance-color) 80%, black);
        }

        .add-quiz-btn:hover {
            background-color: color-mix(in srgb, var(--add-quiz-color) 80%, black);
        }

        /* Rest of the existing CSS remains the same... */
        .quiz-card {
            background: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: 
                0 10px 25px rgba(0, 0, 0, 0.1), 
                0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid rgba(74, 144, 226, 0.1);
        }

        .quiz-card:hover {
            transform: translateY(-5px);
            box-shadow: 
                0 15px 30px rgba(0, 0, 0, 0.15), 
                0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .quiz-card h3 {
            color: var(--primary-color);
            margin-bottom: 15px;
            font-size: 1.5rem;
        }

        .quiz-card p {
            margin-bottom: 10px;
            color: var(--text-color);
            opacity: 0.8;
        }

        .quiz-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
        }

        .quiz-difficulty {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .difficulty-easy {
            background-color: rgba(46, 204, 113, 0.1);
            color: #2ecc71;
        }

        .difficulty-medium {
            background-color: rgba(241, 196, 15, 0.1);
            color: #f1c40f;
        }

        .difficulty-hard {
            background-color: rgba(231, 76, 60, 0.1);
            color: #e74c3c;
        }

        .delete-btn {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background-color: color-mix(in srgb, var(--accent-color) 80%, black);
            transform: scale(1.05);
        }

        @media screen and (max-width: 600px) {
            .page-header {
                flex-direction: column;
                gap: 15px;
            }

            .page-header-buttons {
                flex-direction: column;
                width: 100%;
            }

            .quiz-card {
                padding: 15px;
            }

           

            .performance-btn, .add-quiz-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="companynavbar.jsp" />
<h2 style="font-weight: bold; font-family: 'Arial, sans-serif'; font-size: 36px; text-align: center; color: #4CAF50;">Manage Quiz</h2>

    <div class="container">
        <div class="page-header">
            <div class="page-header-buttons">
                <form action="/company/create-quiz" method="get">
                    <button type="submit" class="add-quiz-btn">
                        Add New Quiz
                    </button>
                </form>
                <form action="/company/performance-list" method="get">
                    <button type="submit" class="performance-btn">
                        View Performance
                    </button>
                </form>
            </div>
        </div>
        
        <c:choose>
            <c:when test="${not empty quizzes}">
                <c:forEach var="quiz" items="${quizzes}">
                    <div class="quiz-card">
                        <h3>${quiz.title}</h3>
                        <div class="quiz-actions">
                            <div>
                                <span class="quiz-difficulty difficulty-${quiz.difficulty.toLowerCase()}">
                                    ${quiz.difficulty}
                                </span>
                                <p><b>Duration: ${quiz.duration} minutes</b></p>
                                <p><b>Questions: ${quiz.questions.size()}</b></p>
                            </div>
                            <form action="/company/quiz/delete/${quiz.id}" method="post">
                                <button type="submit" class="delete-btn" 
                                    onclick="return confirm('Are you sure you want to delete this quiz?')">
                                    Delete Quiz
                                </button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p style="text-align: center; color: var(--text-color); opacity: 0.7; font-weight: bold; font-size: 24px;">
    You haven't created any quizzes yet🫡
</p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>