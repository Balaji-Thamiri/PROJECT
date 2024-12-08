<%@ page import="com.klef.jfsd.springboot.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("adminsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/images/SUPERSET.png">
    <title>Admin Profile Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        .profile-container {
    max-width: 500px;
    margin: 50px auto;
    padding: 40px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    transform: translateY(0);
    transition: all 0.3s ease;
}

.profile-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
}

.profile-header {
    text-align: center;
    margin-bottom: 35px;
    padding-bottom: 25px;
    border-bottom: 2px solid rgba(0, 123, 255, 0.1);
    position: relative;
}

.profile-header::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 2px;
    background: #007bff;
}

.profile-header h2 {
    color: #2c3e50;
    font-weight: 600;
    margin-bottom: 10px;
}

.form-control {
    border: 2px solid #e9ecef;
    padding: 12px;
    border-radius: 10px;
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.9);
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.15);
    transform: translateY(-2px);
}

.form-label {
    font-weight: 500;
    color: #495057;
    margin-bottom: 8px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.form-label i {
    color: #007bff;
    font-size: 1.1em;
    transition: transform 0.3s ease;
}

.form-label:hover i {
    transform: scale(1.1);
}

.btn {
    padding: 12px 24px;
    border-radius: 10px;
    font-weight: 500;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.btn-primary {
    background: linear-gradient(135deg, #007bff, #0056b3);
    border: none;
    box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
}

.btn-primary:hover {
    background: linear-gradient(135deg, #0056b3, #004094);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(0, 123, 255, 0.4);
}

.btn-secondary {
    background: linear-gradient(135deg, #6c757d, #495057);
    border: none;
    box-shadow: 0 4px 15px rgba(108, 117, 125, 0.3);
}

.btn-secondary:hover {
    background: linear-gradient(135deg, #495057, #343a40);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(108, 117, 125, 0.4);
}

.alert {
    border-radius: 10px;
    padding: 15px 20px;
    margin-bottom: 25px;
    border: none;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.8));
    backdrop-filter: blur(5px);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.alert-success {
    border-left: 4px solid #28a745;
    color: #155724;
}

.alert-danger {
    border-left: 4px solid #dc3545;
    color: #721c24;
}

body {
    background-image: url('/images/profileedit.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    min-height: 120vh;
    position: relative;
}

body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(0, 123, 255, 0.1), rgba(0, 0, 0, 0.2));
    z-index: -1;
}

@media (max-width: 768px) {
    .profile-container {
        margin: 20px;
        padding: 25px;
    }
    
    .btn {
        padding: 10px 20px;
    }
}
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <div class="profile-container">
            <div class="profile-header">
                <h2>
                    <i class="bi bi-pencil-square"></i> Update Admin Profile
                </h2>
            </div>

            <% if(request.getParameter("success") != null) { %>
                <div class="alert alert-success" role="alert">
                    Profile updated successfully!
                </div>
            <% } %>

            <% if(request.getParameter("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    Failed to update profile. Please try again.
                </div>
            <% } %>
           
           <% if(request.getParameter("error") != null) { %>
    <div class="alert alert-danger" role="alert">
        <% if("invalidPassword".equals(request.getParameter("error"))) { %>
            Current password is incorrect.
        <% } else { %>
            Failed to update profile. Please try again.
        <% } %>
    </div>
<% } %>
           


            <form action="/admin/updateprofile" method="post" onsubmit="return validateForm()">
            
            
<div class="mb-3">
    <label for="name" class="form-label">
         <i class="bi bi-person-fill fs-4"></i><b>Name</b>
    </label>
    <input type="text" 
           class="form-control" 
           id="name" 
           name="name" 
           readonly>
</div>
            
            
                <div class="mb-3">
                    <label for="email" class="form-label">
                        <i class="bi bi-envelope-fill"></i><b>Email Address</b>
                    </label>
                    
                    
                    
                    
                    <input type="email" 
                           class="form-control" 
                           id="email" 
                           name="email" 
                           value="${admin.email}"
                           readonly>
                </div>

                <div class="mb-3">
                    <label for="currentPassword" class="form-label">
                        <i class="bi bi-key-fill"></i><b>Current Password</b>
                    </label>
                    <input type="password" 
                           class="form-control" 
                           id="currentPassword" 
                           name="currentPassword"
                           required>
                </div>

                <div class="mb-3">
                    <label for="newPassword" class="form-label">
                        <i class="bi bi-shield-lock-fill"></i><b>New Password</b>
                    </label>
                    <input type="password" 
                           class="form-control" 
                           id="newPassword" 
                           name="newPassword"
                           required>
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">
                        <i class="bi bi-shield-check"></i><b>Confirm New Password</b>
                    </label>
                    <input type="password" 
                           class="form-control" 
                           id="confirmPassword" 
                           name="confirmPassword"
                           required>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-pencil-square me-2"></i> Update Password
                    </button>
                    <a href="/admin/home" class="btn btn-secondary">
                        <i class="bi bi-house"></i> Back to Dashboard
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function validateForm() {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword !== confirmPassword) {
                alert('New password and confirm password do not match!');
                return false;
            }

            return true;
        }
        
        function updateName() {
            const email = document.getElementById('email').value;
            const name = email.split('@')[0]; // Get the part before '@'
            const capitalized = name.charAt(0).toUpperCase() + name.slice(1); // Capitalize the first letter
            document.getElementById('name').value = capitalized; // Set the name in the input
        }

        // Initialize the name field when the page loads
        window.onload = function() {
            updateName();
        };
    </script>
</body>
</html>
