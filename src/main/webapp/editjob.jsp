<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" href="images/SUPERSET.png"> <!-- This sets the favicon -->
    <title>Edit Job Posting</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom CSS Variables */
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --secondary-color: #64748b;
            --border-color: #e2e8f0;
            --success-color: #10b981;
            --error-color: #ef4444;
            --box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --transition: all 0.3s ease;
        }

        /* Page Layout */
       body {
    background-color: #f8fafc;
    background-image: url('/images/def.jpg'); /* Replace with your image path */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    color: #1e293b;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    line-height: 1.6;
}


       .container {
    max-width: 800px;
    margin: 2rem auto;
    padding: 2rem;
    background: white;
    border-radius: 1rem;
    box-shadow: var(--box-shadow);
    animation: fadeIn 0.3s ease-out;
    position: relative; /* Positioning context */
    left: -130px; /* Moves the container 20px to the left */
}


        /* Form Header */
        h2 {
            color: #0f172a;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--border-color);
        }

        /* Form Groups */
        .form-group {
            margin-bottom: 1.5rem;
        }

        /* Labels */
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #334155;
            font-size: 0.95rem;
        }

        /* Required Field Indicator */
        label[for]:after {
            content: "*";
            color: var(--error-color);
            margin-left: 4px;
        }

        /* Form Controls */
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #1e293b;
            background-color: #fff;
            border: 2px solid var(--border-color);
            border-radius: 0.5rem;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
            outline: none;
        }

        /* Enhanced Select Styling */
        select.form-control {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            padding-right: 2.5rem;
            cursor: pointer;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%232563eb' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 1.2em;
        }

        select.form-control:hover {
            border-color: var(--primary-color);
            background-color: #f8fafc;
        }

        select.form-control option {
            padding: 0.75rem;
            background-color: white;
            color: #1e293b;
            font-size: 1rem;
        }

        /* Textarea Specific */
        textarea.form-control {
            resize: vertical;
            min-height: 100px;
        }

        /* Date Input Styling */
        input[type="date"] {
            position: relative;
            padding-right: 2.5rem;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            position: absolute;
            right: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        /* Button Styling */
        .btn {
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            border-radius: 0.5rem;
            transition: var(--transition);
            cursor: pointer;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        .btn-secondary {
            background-color: var(--secondary-color);
            border: none;
            color: white;
            margin-left: 1rem;
        }

        .btn-secondary:hover {
            background-color: #475569;
            transform: translateY(-1px);
        }

        /* Form Validation Styles */
        .form-control:invalid:not(:placeholder-shown) {
            border-color: var(--error-color);
        }

        .form-control:valid:not(:placeholder-shown) {
            border-color: var(--success-color);
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .container {
                margin: 1rem;
                padding: 1rem;
            }
            
            .btn {
                width: 100%;
                margin: 0.5rem 0;
            }
            
            .btn-secondary {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 align="center">Edit Job Posting</h2>
        
        <form action="/company/job/update/${job.jobId}" method="post" class="needs-validation" novalidate>
            <div class="form-group">
                <label for="jobTitle">Job Title</label>
                <input type="text" class="form-control" id="jobTitle" name="jobTitle" 
                       value="${job.jobTitle}" required>
            </div>
            
            <div class="form-group">
                <label for="jobType">Job Type</label>
                <select class="form-control" id="jobType" name="jobType" required>
                    <option value="" disabled selected>Select a job type</option>
                    <option value="Full-time" ${job.jobType == 'Full-time' ? 'selected' : ''}>Full-time</option>
                    <option value="Part-time" ${job.jobType == 'Part-time' ? 'selected' : ''}>Part-time</option>
                    <option value="Contract" ${job.jobType == 'Contract' ? 'selected' : ''}>Contract</option>
                    <option value="Internship" ${job.jobType == 'Internship' ? 'selected' : ''}>Internship</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="jobLocation">Location</label>
                <input type="text" class="form-control" id="jobLocation" name="jobLocation" 
                       value="${job.jobLocation}" required>
            </div>
            
            <div class="form-group">
                <label for="skillsRequired">Required Skills</label>
                <textarea class="form-control" id="skillsRequired" name="skillsRequired" 
                          rows="3" required>${job.skillsRequired}</textarea>
            </div>
            
            <div class="form-group">
                <label for="salaryRange">Salary Range</label>
                <input type="text" class="form-control" id="salaryRange" name="salaryRange" 
                       value="${job.salaryRange}">
            </div>
            
            <div class="form-group">
                <label for="experienceRequired">Required Experience (years)</label>
                <input type="number" class="form-control" id="experienceRequired" 
                       name="experienceRequired" value="${job.experienceRequired}">
            </div>
            
            <div class="form-group">
                <label for="educationLevel">Education Level</label>
                <input type="text" class="form-control" id="educationLevel" 
                       name="educationLevel" value="${job.educationLevel}">
            </div>
            
            <div class="form-group">
                <label for="lastDateToApply">Last Date to Apply</label>
                <input type="date" class="form-control" id="lastDateToApply" 
                       name="lastDateToApply" 
                       value="<fmt:formatDate value="${job.lastDateToApply}" pattern="yyyy-MM-dd"/>" 
                       required>
            </div>
            
            <div class="form-group">
                <label for="jobDescription">Job Description</label>
                <textarea class="form-control" id="jobDescription" name="jobDescription" 
                          rows="5" required>${job.jobDescription}</textarea>
            </div>
            
            <button type="submit" class="btn btn-primary">Update Job</button>
            <a href="/company/viewjobs" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form validation
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>