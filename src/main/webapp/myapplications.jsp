<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Applications</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <style>
 :root {
    --primary-color: #2563eb;
    --danger-color: #dc2626;
    --success-color: #16a34a;
    --warning-color: #ca8a04;
    --info-color: #0891b2;
    --background-color: #f8fafc;
    --card-background: #ffffff;
    --border-radius: 0.5rem;
    --transition-speed: 0.2s;
    --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.12);
    --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
    --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
}

body {
    background-image: url('/images/jre.jpg'); /* Replace with your image URL */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed; /* Keeps the image fixed when scrolling */
    background-position: center;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    line-height: 1.6;
    color: #1a1a1a;
    margin: 0;
    padding: 0;
}


.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem;
    padding-top: 10rem;
    animation: fadeIn 0.3s ease-in;
}

/* Improved Page Title */
.container h2 {
    font-size: 2.5rem;
    color: #2563eb;
    font-weight: 700;
    text-align: center;
    margin-bottom: 2.5rem;
    position: relative;
    padding-bottom: 0.5rem;
}

.container h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 4px;
    background: linear-gradient(to right, #2563eb, #60a5fa);
    border-radius: 2px;
}

/* Search Jobs Button Container */
.search-jobs-container {
    display: flex;
    justify-content: center;
    margin-bottom: 3rem;
}

/* Improved Search Jobs Button */
.search-jobs-button {
    background: linear-gradient(to right, #2563eb, #60a5fa);
    color: white;
    padding: 0.75rem 2rem;
    border-radius: 9999px;
    font-weight: 600;
    font-size: 1rem;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(37, 99, 235, 0.2);
}

.search-jobs-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(37, 99, 235, 0.3);
}

/* Enhanced Table Styles */
.table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    background: var(--card-background);
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: var(--shadow-md);
    margin: 2rem 0;
}

.table th {
    background: #f8fafc;
    color: #1e293b;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 0.875rem;
    letter-spacing: 0.05em;
    padding: 1.25rem 1rem;
    border-bottom: 2px solid #e2e8f0;
}

.table td {
    padding: 1.25rem 1rem;
    border-bottom: 1px solid #e2e8f0;
    color: #334155;
    font-size: 0.95rem;
}

.table tr:last-child td {
    border-bottom: none;
}

.table tr:hover {
    background-color: #f8fafc;
}

/* Improved Status Badges */
.status-pending,
.status-accepted,
.status-rejected {
    padding: 0.5rem 1rem;
    border-radius: 9999px;
    font-weight: 500;
    font-size: 0.875rem;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.status-pending {
    background-color: #fef9c3;
    color: #854d0e;
}

.status-accepted {
    background-color: #dcfce7;
    color: #166534;
}

.status-rejected {
    background-color: #fee2e2;
    color: #991b1b;
}

/* Action Buttons */
.btn {
    padding: 0.6rem 1.2rem;
    border-radius: 0.5rem;
    font-weight: 500;
    font-size: 0.875rem;
    text-decoration: none;
    transition: all 0.2s ease;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    margin: 0 0.25rem;
}

.btn-primary {
    background-color: #2563eb;
    color: white;
}

.btn-danger {
    background-color: #dc2626;
    color: white;
}

.btn:hover {
    transform: translateY(-1px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Enhanced Alerts */
.alert {
    padding: 1rem 1.5rem;
    border-radius: 0.75rem;
    margin-bottom: 2rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    animation: slideIn 0.3s ease-out;
    box-shadow: var(--shadow-sm);
}

.alert-success {
    background-color: #dcfce7;
    color: #166534;
    border-left: 4px solid #16a34a;
}

.alert-info {
    background-color: #e0f2fe;
    color: #075985;
    border-left: 4px solid #0891b2;
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 3rem;
    background: var(--card-background);
    border-radius: var(--border-radius);
    box-shadow: var(--shadow-md);
    margin: 2rem 0;
}

.empty-state p {
    color: #64748b;
    font-size: 1.1rem;
    margin: 1rem 0;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        padding: 1rem;
    }

    .container h2 {
        font-size: 2rem;
    }

    .table {
        display: block;
        overflow-x: auto;
    }

    .table th,
    .table td {
        padding: 1rem 0.75rem;
        font-size: 0.875rem;
    }

    .btn {
        padding: 0.5rem 1rem;
        font-size: 0.875rem;
    }

    .status-pending,
    .status-accepted,
    .status-rejected {
        padding: 0.4rem 0.8rem;
        font-size: 0.75rem;
    }
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

@keyframes slideIn {
    from {
        transform: translateY(-1rem);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}
.parent-container {
    display: flex;
    justify-content: center;
}

    </style>
</head>
<body>
      <jsp:include page="studentnavbar.jsp" />
    <div class="container">
      
        
        <c:if test="${param.success}">
            <div class="alert alert-success">Application submitted successfully!</div>
        </c:if>
        
        <c:if test="${param.withdrawn}">
            <div class="alert alert-info">Application withdrawn successfully.</div>
        </c:if>
         <h2 align="center">My Applications</h2>
     <div class="parent-container">
    <a href="/student/viewalljobs" class="btn btn-primary search-jobs-button">Search New Jobs</a>
</div>
             
        <c:if test="${empty applications}">
            <p>You haven't applied to any jobs yet.</p>
        </c:if>
        
        <c:if test="${not empty applications}">
            <table class="table">
                <thead>
                    <tr>
                        <th>Application ID</th>
                        <th>Company</th>
                        <th>Job</th>
                        <th>Application Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${applications}" var="app">
                        <tr>
                            <td>${app.applicationId}</td>
                            <td>${app.companyName}</td>
                            <td>${app.jobName}</td>
                            <td>${app.applicationDate}</td>
                            <td>
                                <span class="status-${app.status.toLowerCase()}">
                                    ${app.status}
                                </span>
                            </td>
                            <td>
    <form action="/student/withdraw/${app.id}" method="post" style="display: inline;">
        <button type="submit" class="btn btn-danger" 
                onclick="return confirm('Are you sure you want to withdraw this application?')">
            Withdraw
        </button>
    </form>
</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <script>
        // Auto-hide alerts after 5 seconds
        window.addEventListener('load', function() {
            setTimeout(function() {
                var alerts = document.getElementsByClassName('alert');
                for(var i = 0; i < alerts.length; i++) {
                    alerts[i].style.display = 'none';
                }
            }, 5000);
        });
    </script>
</body>
</html>