<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="icon" href="/images/SUPERSET.png">
<style>
/* Modern color scheme and variables */
:root {
    --primary-color: #6c5ce7;
    --secondary-color: #f5f6fa;
    --success-color: #00b894;
    --error-color: #d63031;
    --text-color: #2d3436;
    --border-color: #dfe6e9;
    --shadow-color: rgba(108, 92, 231, 0.1);
    --transition-speed: 0.3s;
}

/* Base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

/* Form container */
form {
    background: white;
    padding: 2.5rem;
    border-radius: 15px;
    box-shadow: 0 20px 40px var(--shadow-color);
    width: 100%;
    max-width: 400px;
    position: relative;
}

/* Form header */
.form-header {
    text-align: center;
    margin-bottom: 2rem;
}

.form-header h2 {
    color: var(--text-color);
    font-size: 1.5rem;
    margin-bottom: 0.5rem;
}

.form-header p {
    color: #636e72;
    font-size: 0.9rem;
}

/* Form group */
.form-group {
    margin-bottom: 1.5rem;
    position: relative;
}

/* Label styling */
label {
    display: block;
    margin-bottom: 0.8rem;
    color: var(--text-color);
    font-weight: 500;
    font-size: 0.9rem;
}

/* OTP input styling */
.form-control {
    width: 100%;
    padding: 1rem;
    font-size: 1.2rem;
    letter-spacing: 0.5rem;
    text-align: center;
    border: 2px solid var(--border-color);
    border-radius: 8px;
    transition: all var(--transition-speed);
    background-color: var(--secondary-color);
    color: var(--text-color);
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px var(--shadow-color);
    background-color: white;
}

/* Button styling */
.btn {
    display: block;
    width: 100%;
    padding: 1rem;
    font-size: 1rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all var(--transition-speed);
    position: relative;
    overflow: hidden;
}

.btn-primary {
    background: linear-gradient(45deg, var(--primary-color), #a55eea);
    color: white;
    box-shadow: 0 4px 15px var(--shadow-color);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px var(--shadow-color);
}

.btn-primary:active {
    transform: translateY(0);
}

/* Timer styling */
.timer {
    text-align: center;
    margin-top: 1rem;
    color: #636e72;
    font-size: 0.9rem;
}

/* OTP input animation */
@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-5px); }
    75% { transform: translateX(5px); }
}

.form-control.error {
    border-color: var(--error-color);
    animation: shake 0.5s;
}

/* Success state */
.form-control.success {
    border-color: var(--success-color);
}

/* Loading state */
.btn-primary.loading {
    background: linear-gradient(45deg, var(--primary-color), #a55eea);
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
    animation: spin 1s linear infinite;
}

@keyframes spin {
    to { transform: rotate(360deg); }
}

/* Resend OTP link */
.resend-link {
    display: block;
    text-align: center;
    margin-top: 1rem;
    color: var(--primary-color);
    text-decoration: none;
    font-size: 0.9rem;
    transition: color var(--transition-speed);
}

.resend-link:hover {
    color: #a55eea;
}

/* Error message */
.error-message {
    color: var(--error-color);
    font-size: 0.8rem;
    margin-top: 0.5rem;
    display: none;
}

.form-control.error + .error-message {
    display: block;
}

/* Responsive design */
@media (max-width: 480px) {
    form {
        padding: 1.5rem;
    }
    
    .form-control {
        font-size: 1rem;
        letter-spacing: 0.3rem;
    }
    
    .btn {
        padding: 0.8rem;
    }
}

/* Accessibility */
@media (prefers-reduced-motion: reduce) {
    * {
        animation: none !important;
        transition: none !important;
    }
}

/* Focus styles */
:focus-visible {
    outline: 3px solid var(--primary-color);
    outline-offset: 2px;
}

/* Auto-fill styles */
.form-control:-webkit-autofill {
    box-shadow: 0 0 0 30px var(--secondary-color) inset;
    -webkit-text-fill-color: var(--text-color);
}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/student/verifyotp" method="post">
    <input type="hidden" name="email" value="${email}">
    <div class="form-group">
        <label for="otp">Enter OTP</label>
        <input type="text" class="form-control" id="otp" name="otp" required>
    </div>
    <button type="submit" class="btn btn-primary">Verify OTP</button>
</form>
</body>
</html>