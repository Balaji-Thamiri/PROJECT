<%@page import="com.klef.jfsd.springboot.model.Company"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Add New Job Posting</title>
    <link rel="icon" href="/images/SUPERSET.png"> <!-- This sets the favicon -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="stylesheet" href="/css/postjob.css">
</head>
<jsp:include page="companynavbar.jsp" />
<body class="bg-gray-50 min-h-screen custom-scrollbar">
    <div class="max-w-4xl mx-auto p-6">
        <div class="bg-white rounded-lg shadow-xl p-8 mb-8">
           <div class="flex justify-center">
    <h1 class="text-3xl font-bold text-gray-800 mb-8 flex items-center">
        <i class="fas fa-briefcase text-indigo-600 mr-3"></i>
        Post New Job Opening
    </h1>
</div>


            <form action="/company/addJob" method="post" class="space-y-6">
                <!-- Job Title Section -->
                <div class="space-y-2">
                    <label class="block text-sm font-medium text-gray-700 flex items-center">
                        <i class="fas fa-briefcase text-indigo-500 mr-2"></i>
                        Job Title
                    </label>
                    <input type="text" name="jobTitle" required
                        class="form-input mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl">
                </div>

                <!-- Company Selection -->
               <!-- Company Selection -->
<div class="space-y-2">
                    <label class="block text-sm font-medium text-gray-700 flex items-center">
                        <i class="fas fa-building text-indigo-500 mr-2"></i>
                        Company
                    </label>
                    <input type="text" name="company" value="<%= company.getName() %>" readonly
                        class="form-input mt-1 block w-full rounded-md border-gray-300 bg-gray-100 shadow-sm text-2xl cursor-not-allowed">
                </div>


                <!-- Dates Section -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-calendar-plus text-indigo-500 mr-2"></i>
                            Posting Date
                        </label>
                        <input type="date" name="jobPostingDate" required
                            class="form-input mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl">
                    </div>
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-calendar-times text-indigo-500 mr-2"></i>
                            Last Date to Apply
                        </label>
                        <input type="date" name="lastDateToApply" required
                            class="form-input mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl">
                    </div>
                </div>

                <!-- Job Details Section -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-tasks text-indigo-500 mr-2"></i>
                            Job Type
                        </label>
                        <select name="jobType" required
                            class="form-select mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl">
                            <option value="">Select Job Type</option>
                            <option value="Full-time">Full-time</option>
                            <option value="Part-time">Part-time</option>
                            <option value="Contract">Contract</option>
                            <option value="Internship">Internship</option>
                        </select>
                    </div>
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-map-marker-alt text-indigo-500 mr-2"></i>
                            Job Location
                        </label>
                        <input type="text" name="jobLocation"
                            class="form-input mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl">
                    </div>
                </div>

                <!-- Requirements Section -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-graduation-cap text-indigo-500 mr-2"></i>
                            Education Level
                        </label>
                        <select name="educationLevel"
                            class="form-select mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl">
                            <option value="">Select Education Level</option>
                            <option value="High School">High School</option>
                            <option value="Bachelor's">Bachelor's Degree</option>
                            <option value="Master's">Master's Degree</option>
                            <option value="PhD">PhD</option>
                        </select>
                    </div>
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-clock text-indigo-500 mr-2"></i>
                            Experience Required (Years)
                        </label>
                        <input type="number" name="experienceRequired" min="0"
                            class="form-input mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl">
                    </div>
                </div>

                <!-- Skills and Salary Section -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-tools text-indigo-500 mr-2"></i>
                            Skills Required
                        </label>
                        <input type="text" name="skillsRequired" required
                            class="form-input mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl"
                            placeholder="e.g., Java, Spring Boot, SQL">
                    </div>
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700 flex items-center">
                            <i class="fas fa-money-bill-wave text-indigo-500 mr-2"></i>
                            Salary Range
                        </label>
                        <input type="text" name="salaryRange"
                            class="form-input mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl"
                            placeholder="e.g., $50,000 - $70,000">
                    </div>
                </div>

                <!-- Job Description -->
                <div class="space-y-2">
                    <label class="block text-sm font-medium text-gray-700 flex items-center">
                        <i class="fas fa-file-alt text-indigo-500 mr-2"></i>
                        Job Description
                    </label>
                    <textarea name="jobDescription" rows="4"
                        class="form-textarea mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-500 text-2xl"
                        placeholder="Enter detailed job description..."></textarea>
                </div>

                <!-- Submit Button -->
                <div class="flex justify-center space-x-4">
    <button type="button" onclick="history.back()"
        class="px-6 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
        <i class="fas fa-times mr-2"></i>
        Cancel
    </button>
    <button type="submit"
        class="px-6 py-2 bg-indigo-600 border border-transparent rounded-md text-sm font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
        <i class="fas fa-save mr-2"></i>
        Post Job
    </button>
</div>

            </form>
        </div>
    </div>

    <script>
        // Add date validation
        document.addEventListener('DOMContentLoaded', function() {
            const postingDate = document.querySelector('input[name="jobPostingDate"]');
            const lastDate = document.querySelector('input[name="lastDateToApply"]');

            postingDate.addEventListener('change', function() {
                lastDate.min = this.value;
            });

            lastDate.addEventListener('change', function() {
                if (this.value < postingDate.value) {
                    alert('Last date to apply cannot be earlier than posting date');
                    this.value = '';
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

            if (success) {
                showToast("Student Registration Successful!", "success");
            } else if (error) {
                showToast("Student Registration failed. Please try again.", "error");
            }
        }
    </script>
</body>
</html>