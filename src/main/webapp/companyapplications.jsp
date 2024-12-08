<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job Applications</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <!-- Add your CSS here -->
    <style>
   /* Modern CSS Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Document Styling */
body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    line-height: 1.6;
    color: #333;
    background: url('/images/app.png') no-repeat center center fixed; /* Add your image path */
    background-size: cover; /* Ensures the image covers the entire background */
    background-color: #f5f7fa; /* Fallback background color */
    /* Add padding for fixed navbar */
    padding-top: 80px; /* Adjust this value based on your navbar height */
}


/* Main Content Container */
.container {
    max-width: 1200px;
    margin: 4rem auto; /* Increased from 2rem to 4rem */
    padding: 2rem 1.5rem; /* Added padding top and bottom */
    background: white;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

/* Content Wrapper */
.content-wrapper {
    margin-top: 2rem; /* Additional spacing after header */
}

/* Header Styling */
h2 {
    color: #1a237e;
    font-size: 2rem;
    font-weight: 600;
    margin: 1rem 0 2.5rem 0; /* Increased bottom margin */
    position: relative;
    padding-bottom: 0.5rem;
}

h2::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 60px;
    background: linear-gradient(to right, #1a237e, #3949ab);
    border-radius: 2px;
}

/* Table Styling */
.table {
    width: 100%;
    background: white;
    border-radius: 8px;
    border-collapse: collapse;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    margin: 1.5rem 0 2rem 0; /* Added top margin */
    overflow: hidden;
}

/* Table Header */
.table thead {
    background: linear-gradient(to right, #1a237e, #3949ab);
    color: white;
}

.table th {
    padding: 1rem;
    text-align: left;
    font-weight: 600;
    font-size: 0.95rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Table Body */
.table td {
    padding: 1rem;
    border-bottom: 1px solid #eee;
    font-size: 0.95rem;
    vertical-align: middle;
}

.table tbody tr {
    transition: all 0.2s ease;
}

.table tbody tr:hover {
    background-color: #f8f9ff;
    transform: translateX(4px);
}

.table tbody tr:last-child td {
    border-bottom: none;
}

/* Status Styling */
.table td:nth-child(4) {
    font-weight: 600;
}

/* Button Styling */
.btn {
    display: inline-block;
    padding: 0.5rem 1rem;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 500;
    font-size: 0.9rem;
    transition: all 0.2s ease;
}

.btn-primary {
    background-color: #1a237e;
    color: white;
    border: 2px solid #1a237e;
}

.btn-primary:hover {
    background-color: #3949ab;
    border-color: #3949ab;
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(26, 35, 126, 0.15);
}

/* Section Spacing */
.section {
    margin-top: 3rem;
    padding-top: 2rem;
}

/* Responsive Design */
@media (max-width: 768px) {
    body {
        padding-top: 60px; /* Adjusted for smaller navbar on mobile */
    }

    .container {
        margin: 2rem auto;
        padding: 1rem;
    }
    
    .table {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
        margin-top: 1rem;
    }
    
    .table th,
    .table td {
        padding: 0.75rem;
    }
    
    h2 {
        font-size: 1.75rem;
        margin: 0.5rem 0 2rem 0;
    }
}

/* Loading State Animation */
@keyframes shimmer {
    0% {
        background-position: -1000px 0;
    }
    100% {
        background-position: 1000px 0;
    }
}

.table tr.loading td {
    background: linear-gradient(90deg, #f0f0f0 25%, #f8f8f8 50%, #f0f0f0 75%);
    background-size: 1000px 100%;
    animation: shimmer 2s infinite linear;
}

/* Empty State Styling */
.table-empty {
    text-align: center;
    padding: 3rem;
    color: #666;
}

.table-empty::before {
    content: '📋';
    display: block;
    font-size: 2rem;
    margin-bottom: 1rem;
}
    </style>
</head>
<body>
<jsp:include page="companynavbar.jsp" />

    <div class="container">
        <h2>Job Applications</h2>
        
        <table class="table">
            <thead>
                <tr>
                    <th>Application ID</th>
                    <th>Student Name</th>
                    <th>Job Position</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="application" items="${applications}">
                    <tr>
                        <td>${application.id}</td>
                        <td>${application.studentName}</td>
                        <td>${application.jobName}</td>
                        <td>${application.status}</td>
                        <td>
                            <a href="/company/application/${application.id}" class="btn btn-primary">View Details</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
