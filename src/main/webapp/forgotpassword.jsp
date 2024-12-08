<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="icon" href="/images/SUPERSET.png">
<title>Forgot Password</title>
<style>
/* Modern color scheme and variables */
:root {
    --primary-color: #4a90e2;
    --secondary-color: #f5f6fa;
    --success-color: #2ecc71;
    --error-color: #e74c3c;
    --text-color: #2c3e50;
    --shadow-color: rgba(0, 0, 0, 0.1);
    --transition-speed: 0.3s;
}

/* Reset and base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: 
        url('/images/frgt.avif') no-repeat center 48%, 
        linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    background-size: cover;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}



/* Form container styling */
form {
    background: white;
    padding: 3.5rem;
    border-radius: 10px;
    box-shadow: 0 15px 30px var(--shadow-color);
    width: 200%;
    max-width: 650px;
    margin-top: 120px; /* Adds a 50px space above the form */
    transition: transform var(--transition-speed);
    position: relative;
    overflow: hidden;
}
form:hover {
    transform: translateY(-5px);
}

/* Form group styling */
.form-group {
    margin-bottom: 1.5rem;
    position: relative;
}

/* Label styling */
label {
    display: block;
    margin-bottom: 0.5rem;
    color: var(--text-color);
    font-weight: 500;
    font-size: 0.9rem;
    transition: color var(--transition-speed);
}

/* Input field styling */
.form-control {
    width: 100%;
    padding: 0.8rem 1rem;
    font-size: 1rem;
    border: 2px solid var(--secondary-color);
    border-radius: 5px;
    transition: all var(--transition-speed);
    outline: none;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
}

.form-control:hover {
    border-color: var(--primary-color);
}

/* Button styling */
.btn {
    display: inline-block;
    padding: 0.8rem 1.5rem;
    font-size: 1rem;
    font-weight: 500;
    text-align: center;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all var(--transition-speed);
    width: 100%;
    margin-top: 1rem;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
    box-shadow: 0 4px 6px rgba(74, 144, 226, 0.2);
}

.btn-primary:hover {
    background-color: #357abd;
    box-shadow: 0 6px 8px rgba(74, 144, 226, 0.3);
    transform: translateY(-2px);
}

.btn-primary:active {
    transform: translateY(0);
}

/* Loading animation for button */
.btn-primary.loading {
    position: relative;
    pointer-events: none;
    opacity: 0.8;
}

.btn-primary.loading::after {
    content: "";
    position: absolute;
    width: 20px;
    height: 20px;
    top: 50%;
    left: 50%;
    margin: -10px 0 0 -10px;
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-top-color: white;
    border-radius: 50%;
    animation: spin 1s ease-in-out infinite;
}

/* Validation styling */
.form-control:invalid {
    border-color: var(--error-color);
}

.form-control:valid {
    border-color: var(--success-color);
}

/* Error message styling */
.error-message {
    color: var(--error-color);
    font-size: 0.8rem;
    margin-top: 0.5rem;
    display: none;
}

.form-control:invalid + .error-message {
    display: block;
}

/* Animations */
@keyframes spin {
    to {
        transform: rotate(360deg);
    }
}

/* Responsive design */
@media (max-width: 480px) {
    form {
        padding: 1.5rem;
    }

    .btn {
        padding: 0.7rem 1.2rem;
    }
}

/* Accessibility improvements */
@media (prefers-reduced-motion: reduce) {
    * {
        animation: none !important;
        transition: none !important;
    }
}

/* Focus visible outline for keyboard navigation */
:focus-visible {
    outline: 3px solid var(--primary-color);
    outline-offset: 2px;
}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/student/forgotpassword" method="post">
    <div class="form-group">
        <h1 style="text-align: center; white-space: nowrap;">Enter Valid Email to Reset ur Password</h1>
        <label for="email">Email address</label>
        <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <button type="submit" class="btn btn-primary">Send OTP</button>
</form>
</body>
</html>