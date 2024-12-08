<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.klef.jfsd.springboot.model.Company"%>
<%
Company company = (Company) session.getAttribute("company");
if(company==null)
{
	response.sendRedirect("companysessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Company Jobs</title>
    <link rel="icon" href="images/SUPERSET.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
   <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
            --card-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

       body {
    background: var(--background-color) url('/images/jlc.jpg') no-repeat center center;
    background-size: cover;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}


        .container {
            margin-top: 120px;
            padding: 10px;
        }

        .page-title {
            color: var(--primary-color);
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-align: center;
        }

        .search-container {
            margin-top: 20px;
            margin-bottom: 30px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 15px 20px;
            border: none;
            border-radius: 50px;
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            font-size: 1.1rem;
        }

        .search-input:focus {
            outline: none;
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.2);
            transform: translateY(-2px);
        }

        .search-icon {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--secondary-color);
        }

       .post-job-btn {
    background: #4CAF50;  /* Clean green color */
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 8px;    /* Less rounded corners */
    font-weight: 600;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 1px;
    display: block;
    width: fit-content;    /* Allow button to size to content */
    margin: 20px auto;     /* Center the button */
    cursor: pointer;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.post-job-btn:hover {
    background: #45a049;   /* Slightly darker green on hover */
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

        .job-card {
            background: white;
            border: none;
            border-radius: 15px;
            margin-bottom: 25px;
            transition: all 0.3s ease;
            box-shadow: var(--card-shadow);
            position: relative;
            overflow: hidden;
        }

        .job-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: var(--secondary-color);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .job-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .job-card:hover::before {
            opacity: 1;
        }

        .card-body {
            padding: 25px;
        }

        .card-title {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.4rem;
            margin-bottom: 20px;
        }

        .card-text {
            color: #555;
            line-height: 1.6;
        }

        .card-text strong {
            color: var(--primary-color);
            font-weight: 600;
        }

        .badge {
            padding: 8px 15px;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .badge.bg-success {
            background: #27ae60 !important;
        }

        .badge.bg-danger {
            background: #e74c3c !important;
        }

        .job-actions {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            gap: 10px;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .job-card:hover .job-actions {
            opacity: 1;
        }

        .action-icon {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .edit-icon {
            background: #f39c12;
            color: white;
        }

        .delete-icon {
            background: #e74c3c;
            color: white;
        }

        .action-icon:hover {
            transform: scale(1.1);
        }

        .custom-h2 {
            color: var(--primary-color);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            padding-bottom: 15px;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        .custom-h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--secondary-color);
        }

        @media (max-width: 768px) {
            .container {
                margin-top: 220px;
            }
            
            .job-card {
                margin-bottom: 20px;
            }
            
            .job-actions {
                opacity: 1;
                position: relative;
                top: 0;
                right: 0;
                justify-content: flex-end;
                margin-top: 15px;
            }
        }
        .page-title {
        color: var(--primary-color);
        font-weight: 700;
        font-size: 2.5rem;
        margin-bottom: 30px;
        text-align: center;
        position: relative;
        padding-bottom: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 15px;
    }

    .page-title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 180px;
        height: 4px;
        background: linear-gradient(90deg, var(--secondary-color) 0%, var(--primary-color) 100%);
        border-radius: 2px;
    }

    .page-title::before {
        content: '';
        position: absolute;
        bottom: -3px;
        left: 50%;
        transform: translateX(-50%);
        width: 40px;
        height: 10px;
        background: var(--secondary-color);
        border-radius: 5px;
    }

    .title-icon {
        font-size: 2.2rem;
        color: var(--secondary-color);
        animation: float 3s ease-in-out infinite;
    }

    .toastify {
            font-family: 'Poppins', sans-serif;
            padding: 12px 20px;
            color: #ffffff;
            border-radius: 5px;
            font-size: 1rem;
            overflow: hidden;
        }
        .toastify.success {
            background: linear-gradient(to right, #00b09b, #96c93d);
        }
        .toastify.error {
            background: linear-gradient(to right, #ff5f6d, #ffc371);
        }
        .toastify.deleted {
            background: linear-gradient(to right, #00b09b, #96c93d);
        }
         .toastify.updated {
            background: linear-gradient(to right, #00b09b, #96c93d);
        }
        .toast-timer {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 4px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.7);
            animation: toast-timer 5s linear forwards;
        }
        @keyframes toast-timer {
            0% {
                width: 100%;
            }
            100% {
                width: 0%;
            }
        }
 
    </style>
</head>
<body>
    <jsp:include page="companynavbar.jsp" />

    <div class="container">
        <!-- Main Heading -->
     <h1 class="page-title">
    <i class="fas fa-building title-icon"></i>
    Manage Jobs
</h1>


        <!-- Search Bar -->
        <div class="search-container">
            <input type="text" class="search-input" id="jobSearch" placeholder="Search jobs by title, location, or skills...">
            <i class="fas fa-search search-icon"></i>
        </div>

        <!-- Post Job Button -->
        <a href="/company/postjob" class="post-job-btn">Post New Job</a>

        <h2 class="text-center mb-4 custom-h2">Posted Jobs</h2>
        
        <c:if test="${empty jobs}">
            <div class="alert alert-info text-center">
                No jobs posted yet.
            </div>
        </c:if>
        
        <div class="row" id="jobsContainer">
            <c:forEach items="${jobs}" var="job">
                <div class="col-md-6 mb-4 job-item">
                    <div class="job-card card">
                        <div class="job-actions">
                            <div class="action-icon edit-icon">
                                <a href="/company/job/edit/${job.jobId}" class="btn btn-sm btn-primary">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                            </div>
                            <div class="action-icon delete-icon">
                                 <button type="button" class="btn btn-sm btn-danger" 
                                        onclick="confirmDelete(${job.jobId})">
                                    <i class="fas fa-trash"></i> Delete
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${job.jobTitle}</h5>
                            <p class="card-text">
                                <strong>Job Type:</strong> ${job.jobType}<br>
                                <strong>Location:</strong> ${job.jobLocation}<br>
                                <strong>Experience Required:</strong> ${job.experienceRequired} years<br>
                                <strong>Salary Range:</strong> ${job.salaryRange}<br>
                                <strong>Education:</strong> ${job.educationLevel}<br>
                                <strong>Skills Required:</strong> ${job.skillsRequired}<br>
                            </p>
                            
                            <div class="text-muted">
                                <small>
                                    Posted: <fmt:formatDate value="${job.jobPostingDate}" pattern="dd MMM yyyy"/><br>
                                    Last Date: <fmt:formatDate value="${job.lastDateToApply}" pattern="dd MMM yyyy"/>
                                </small>
                            </div>
                            
                            <c:set var="now" value="<%= new java.util.Date() %>" />
                            <div class="mt-3">
                                <c:choose>
                                    <c:when test="${job.lastDateToApply ge now}">
                                        <span class="badge bg-success">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Expired</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Delete</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this job posting?
                </div>
                <div class="modal-footer">
                    <form id="deleteForm" method="post">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Search functionality
        document.getElementById('jobSearch').addEventListener('input', function(e) {
            const searchText = e.target.value.toLowerCase();
            const jobCards = document.getElementsByClassName('job-item');
            
            Array.from(jobCards).forEach(card => {
                const jobContent = card.textContent.toLowerCase();
                if(jobContent.includes(searchText)) {
                    card.style.display = '';
                } else {
                    card.style.display = 'none';
                }
            });
        });
        
        
        function showToast(message, type) {
            Toastify({
                text: message,
                duration: 3000,
                close: true,
                gravity: "top",
                position: "right",
                className: type,
                stopOnFocus: true,
                onClick: function(){},
                callback: function(){
                    this.remove();
                },
                escapeMarkup: false,
            }).showToast();

            // Create and append the timer element
            const toasts = document.getElementsByClassName('toastify');
            const latestToast = toasts[toasts.length - 1];
            const timer = document.createElement('div');
            timer.className = 'toast-timer';
            latestToast.appendChild(timer);
        }

        // Check for success or error messages
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const success = urlParams.get('success');
            const error = urlParams.get('error');
            const deleted = urlParams.get('deleted');
            const updated = urlParams.get('updated');
            if (success) {
                showToast("Job Posted Sucessfully", "success");
            } 
            else if(deleted)
            	{
            	showToast("Job Deleted Sucessfully", "deleted");
            	}
            else if(updated)
        	{
        	showToast("Job Updated Sucessfully", "updated");
        	}
            else if (error) {
                showToast("Student Registration failed. Please try again.", "error");
            }
        }
    </script>
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
     <script>
    function confirmDelete(jobId) {
        $('#deleteForm').attr('action', '/company/job/delete/' + jobId);
        $('#deleteModal').modal('show');
    }
    </script>
</body>
</html>