<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/images/SUPERSET.png">
    <title>Application Details</title>
    <!-- Add your CSS here -->
    <style>
    /* Modern CSS Reset */
*, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

/* Custom Properties */
:root {
    --primary-color: #2563eb;
    --primary-hover: #1d4ed8;
    --success-color: #059669;
    --success-hover: #047857;
    --background-color: #f8fafc;
    --card-background: #ffffff;
    --text-primary: #1e293b;
    --text-secondary: #64748b;
    --border-color: #e2e8f0;
    --transition-speed: 0.3s;
}

/* Body Styles */
/* Body Styles */
body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    line-height: 1.6;
    color: var(--text-primary);
    background-color: var(--background-color);
    background-image: url('/images/jsn.jpg'); /* Replace with your image URL */
    background-size: cover; /* Ensures the image covers the entire screen */
    background-position: center; /* Centers the background image */
    background-attachment: fixed; /* Keeps the background image fixed while scrolling */
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh; /* Full viewport height */
    margin: 0; /* Reset margin to avoid unnecessary spacing */
}

.container {
    max-width: 1000px; /* Increased width for a larger container */
    margin: 0; /* Remove top and bottom margin for perfect centering */
    padding: 4rem; /* Increased padding for more spacing inside the container */
    background: var(--card-background);
    border-radius: 4rem;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
                0 2px 4px -1px rgba(0, 0, 0, 0.06);
    position: relative; /* Enables the use of left/right positioning */
    transform: translate(-10%, 0); /* Moves the container 5% to the left */
}

/* Headings */
h2 {
    font-size: 2rem;
    font-weight: 700;
    color: var(--text-primary);
    margin-bottom: 2rem;
    position: relative;
    padding-bottom: 0.5rem;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 60px;
    height: 4px;
    background-color: var(--primary-color);
    border-radius: 2px;
}

h5 {
    font-size: 1.25rem;
    font-weight: 600;
    color: var(--text-primary);
    margin: 1.5rem 0 1rem;
}

/* Card Styles */
.card {
    background: var(--card-background);
    border-radius: 1rem;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 
                0 2px 4px -1px rgba(0, 0, 0, 0.06);
    transition: transform var(--transition-speed),
                box-shadow var(--transition-speed);
}

.card:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1),
                0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

.card-body {
    padding: 2rem;
}

/* Information Display */
p {
    margin-bottom: 1rem;
    color: var(--text-secondary);
}

strong {
    color: var(--text-primary);
    font-weight: 600;
}

/* Links */
a {
    color: var(--primary-color);
    text-decoration: none;
    transition: color var(--transition-speed);
}

a:hover {
    color: var(--primary-hover);
}

/* Buttons */
.btn {
    display: inline-block;
    padding: 0.75rem 1.5rem;
    border-radius: 0.5rem;
    font-weight: 500;
    text-align: center;
    transition: all var(--transition-speed);
    border: none;
    cursor: pointer;
    font-size: 0.975rem;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
}

.btn-primary:hover {
    background-color: var(--primary-hover);
    transform: translateY(-1px);
}

.btn-success {
    background-color: var(--success-color);
    color: white;
}

.btn-success:hover {
    background-color: var(--success-hover);
    transform: translateY(-1px);
}

/* Form Elements */
.form-group {
    margin-bottom: 1.5rem;
}

.form-control {
    width: 100%;
    padding: 0.75rem 1rem;
    font-size: 1rem;
    line-height: 1.5;
    color: var(--text-primary);
    background-color: var(--card-background);
    border: 2px solid var(--border-color);
    border-radius: 1.5rem;
    transition: border-color var(--transition-speed),
                box-shadow var(--transition-speed);
}

.form-control:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
}

label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: var(--text-primary);
}

/* Utility Classes */
.mt-3 {
    margin-top: 1.5rem;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        padding: 0 1rem;
    }
    
    .card-body {
        padding: 1.5rem;
    }
    
    h2 {
        font-size: 1.75rem;
    }
    
    .btn {
        width: 100%;
        margin-bottom: 0.5rem;
    }
}

/* Status-specific Colors */
select[name="status"] option[value="Selected"] {
    color: var(--success-color);
}

select[name="status"] option[value="Rejected"] {
    color: #dc2626;
}

/* Animation for Status Updates */
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

.form-group select {
    animation: fadeIn 0.3s ease-out;
}
    </style>
</head>
<body>
    <div class="container">
        <h2>Application Details</h2>
        
        <div class="card">
            <div class="card-body">
                <h5>Student Information</h5>
                <p><strong>Name:</strong> ${application.studentName}</p>
                <p><strong>Email:</strong> ${application.studentEmail}</p>
                <p><strong>Phone:</strong> ${application.phoneNumber}</p>
                
                <h5>Application Details</h5>
                <p><strong>Position:</strong> ${application.jobName}</p>
                <p><strong>Work Experience:</strong> ${application.workExperience}</p>
                <p><strong>Skills:</strong> ${application.skills}</p>
                <p><strong>LinkedIn:</strong> <a href="${application.linkedinProfile}" target="_blank">View Profile</a></p>
                <p><strong>Status:</strong> ${application.status}</p>
                
                <div class="mt-3">
                    <a href="/company/application/${application.id}/resume" class="btn btn-primary">Download Resume</a>
                </div>
                
                <div class="mt-3">
                <a href="/company/application/${application.id}/viewresume" 
                   target="_blank" 
                   class="btn btn-primary">
                    View Resume
                </a>
            </div>
                
                <form action="/company/application/${application.id}/status" method="POST" class="mt-3">
                    <div class="form-group">
                        <label>Update Status:</label>
                        <select name="status" class="form-control">
                            <option value="Pending" ${application.status == 'Pending' ? 'selected' : ''}>Pending</option>
                            <option value="Under Review" ${application.status == 'Under Review' ? 'selected' : ''}>Under Review</option>
                            <option value="Shortlisted" ${application.status == 'Shortlisted' ? 'selected' : ''}>Shortlisted</option>
                            <option value="Interview Scheduled" ${application.status == 'Interview Scheduled' ? 'selected' : ''}>Interview Scheduled</option>
                            <option value="Selected" ${application.status == 'Selected' ? 'selected' : ''}>Selected</option>
                            <option value="Rejected" ${application.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success">Update Status</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>