<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Your Quiz History</h2>
        
        <c:choose>
            <c:when test="${not empty quizHistory}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Quiz Title</th>
                            <th>Company</th>
                            <th>Date</th>
                            <th>Score</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="attempt" items="${quizHistory}">
                            <tr>
                                <td>${attempt.quiz.title}</td>
                                <td>${attempt.quiz.company.name}</td>
                                <td>
                                    <fmt:formatDate value="${attempt.endTime}" 
                                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>
                                    <span class="${attempt.score >= 50 ? 'text-success' : 'text-danger'}">
                                        ${attempt.score}%
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${attempt.score >= 70}">
                                            <span class="badge bg-success">Excellent</span>
                                        </c:when>
                                        <c:when test="${attempt.score >= 50}">
                                            <span class="badge bg-warning">Passed</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">Failed</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">
                    You haven't taken any quizzes yet.
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>