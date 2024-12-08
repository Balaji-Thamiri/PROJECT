<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Student student = (Student) session.getAttribute("student");
if(student==null)
{
	response.sendRedirect("studentsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Job Openings</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
    body{
       background-image: url('/images/stf.avif'); /* Replace with your image URL */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed; /* Keeps the image fixed when scrolling */
    background-position: center;
    }
    /* Responsive Grid */
.job-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  grid-gap: 2rem;
}

/* Job Card Styles */
.job-card {
  background-color: #fff;
  border-radius: 1rem;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  padding: 2rem;
  transition: all 0.3s ease-in-out;
}

.job-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

.job-card .company-logo {
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
  overflow: hidden;
  margin-right: 1rem;
}

.job-card .company-logo img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.job-card .job-title {
  font-size: 1.25rem;
  font-weight: bold;
  color: #4a5568;
  margin-bottom: 0.5rem;
}

.job-card .company-name {
  font-size: 0.875rem;
  color: #718096;
  margin-bottom: 1rem;
}

.job-card .job-detail {
  display: flex;
  align-items: center;
  color: #4a5568;
  margin-bottom: 0.5rem;
}

.job-card .job-detail i {
  width: 1.25rem;
  margin-right: 0.5rem;
}

.job-card .skill-tag {
  display: inline-block;
  background-color: #e2e8f0;
  color: #4a5568;
  padding: 0.25rem 0.5rem;
  border-radius: 0.25rem;
  margin-right: 0.5rem;
  margin-bottom: 0.5rem;
}

.job-card .action-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 1.5rem;
}

.job-card .action-buttons button {
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  font-size: 0.875rem;
  transition: all 0.3s ease-in-out;
}

.job-card .action-buttons .view-details {
  background-color: #4c51bf;
  color: #fff;
}

.job-card .action-buttons .view-details:hover {
  background-color: #434190;
}

.job-card .action-buttons .apply-now {
  border: 1px solid #4c51bf;
  color: #4c51bf;
}

.job-card .action-buttons .apply-now:hover {
  background-color: #f0f4ff;
}
       .content-wrapper {
            padding-top: 6rem; /* Adjust this value based on your navbar height */
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
<body class="bg-gray-50 min-h-screen custom-scrollbar content-wrapper">
    <jsp:include page="studentnavbar.jsp" />
    <div class="container mx-auto px-4 py-8">
        <!-- Page Header -->
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-3xl font-bold text-gray-800 flex justify-center items-center">
    <i class="fas fa-briefcase text-indigo-600 mr-3"></i>
    Available Job Openings
</h1>

            <!-- Search and Filter Section -->
            <div class="flex space-x-4">
                <input type="text" id="searchInput" placeholder="Search jobs..."
                    class="px-4 py-2 border rounded-lg focus:ring-2 focus:ring-indigo-500">
                <select id="filterJobType" class="px-4 py-2 border rounded-lg focus:ring-2 focus:ring-indigo-500">
                    <option value="">All Job Types</option>
                    <option value="Full-time">Full-time</option>
                    <option value="Part-time">Part-time</option>
                    <option value="Contract">Contract</option>
                    <option value="Internship">Internship</option>
                </select>
            </div>
        </div>

        <!-- Job Listings Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="job" items="${jobs}">
                <div class="bg-white rounded-lg shadow-lg p-6 job-card hover:shadow-xl">
                    <!-- Company Header -->
                    <div class="flex items-center mb-4">
                        <div class="w-16 h-16 rounded-full overflow-hidden mr-4">
                            <img src="data:${job.company.imageType};base64,${job.company.base64Image}" 
                                 alt="${job.company.name}" 
                                 class="w-full h-full object-cover"/>
                        </div>
                        <div>
                            <h3 class="text-xl font-bold text-gray-800">${job.jobTitle}</h3>
                            <p class="text-gray-600">${job.company.name}</p>
                        </div>
                    </div>

                    <!-- Job Details -->
                    <div class="space-y-3">
                        <div class="flex items-center text-gray-600">
                            <i class="fas fa-map-marker-alt w-5"></i>
                            <span>${job.jobLocation}</span>
                        </div>
                        <div class="flex items-center text-gray-600">
                            <i class="fas fa-briefcase w-5"></i>
                            <span>${job.jobType}</span>
                        </div>
                        <div class="flex items-center text-gray-600">
                            <i class="fas fa-money-bill-wave w-5"></i>
                            <span>${job.salaryRange}</span>
                        </div>
                        <div class="flex items-center text-gray-600">
                            <i class="fas fa-clock w-5"></i>
                            <span>${job.experienceRequired} years experience</span>
                        </div>

                       
                        <!-- Application Deadline -->
                        <div class="mt-4 text-sm text-gray-500">
                            Apply by: <fmt:formatDate value="${job.lastDateToApply}" pattern="MMM dd, yyyy"/>
                        </div>

                        <!-- Action Buttons -->
                        <div class="mt-6 flex justify-between items-center">
                            <button onclick="viewJobDetails(${job.jobId})" 
                                    class="px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors">
                                View Details
                            </button>
                            <button onclick="location.href='/student/apply/${job.jobId}'"
            class="px-4 py-2 border border-indigo-600 text-indigo-600 rounded-lg hover:bg-indigo-50 transition-colors">
        Apply Now
    </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- JavaScript for Search and Filter -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const filterJobType = document.getElementById('filterJobType');
            const jobCards = document.querySelectorAll('.job-card');

            function filterJobs() {
                const searchTerm = searchInput.value.toLowerCase();
                const selectedJobType = filterJobType.value.toLowerCase();

                jobCards.forEach(card => {
                    const title = card.querySelector('h3').textContent.toLowerCase();
                    const company = card.querySelector('p').textContent.toLowerCase();
                    const jobType = card.querySelector('.fas.fa-briefcase').nextElementSibling.textContent.toLowerCase();
                    
                    const matchesSearch = title.includes(searchTerm) || company.includes(searchTerm);
                    const matchesJobType = !selectedJobType || jobType.includes(selectedJobType);

                    card.style.display = matchesSearch && matchesJobType ? 'block' : 'none';
                });
            }

            searchInput.addEventListener('input', filterJobs);
            filterJobType.addEventListener('change', filterJobs);
        });

        function viewJobDetails(jobId) {
            window.location.href = "/student/job/" + jobId;
        }

     
    </script>
    
     <script>
        // Function to show toast message with timer
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

            if (success) {
                showToast("Already Applied!!Please Apply Other Jobs", "success");
            } else if (error) {
                showToast("Student Registration failed. Please try again.", "error");
            }
        }
   </script>
</body>
</html>