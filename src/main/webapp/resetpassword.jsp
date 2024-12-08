<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
 <link rel="icon" href="/images/SUPERSET.png">
<style>
/* Modern color scheme and variables */
:root {
    --primary-color: #4834d4;
    --secondary-color: #fff;
    --success-color: #2ecc71;
    --error-color: #e74c3c;
    --text-color: #2d3436;
    --border-color: #dfe6e9;
    --shadow-color: rgba(72, 52, 212, 0.1);
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
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

/* Form container */
form {
    background: var(--secondary-color);
    padding: 2.5rem;
    border-radius: 20px;
    box-shadow: 0 20px 40px var(--shadow-color);
    width: 100%;
    max-width: 400px;
    position: relative;
    transform: translateY(0);
    transition: transform var(--transition-speed);
}

form:hover {
    transform: translateY(-5px);
}

/* Form header */
.form-header {
    text-align: center;
    margin-bottom: 2rem;
}

.form-header h2 {
    color: var(--text-color);
    font-size: 1.8rem;
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
    transition: color var(--transition-speed);
}

/* Input styling */
.form-control {
    width: 100%;
    padding: 1rem;
    font-size: 1rem;
    border: 2px solid var(--border-color);
    border-radius: 8px;
    transition: all var(--transition-speed);
    background-color: #f8f9fa;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px var(--shadow-color);
    background-color: white;
}

/* Password visibility toggle */
.password-toggle {
    position: absolute;
    right: 1rem;
    top: 2.8rem;
    cursor: pointer;
    color: #636e72;
    transition: color var(--transition-speed);
}

.password-toggle:hover {
    color: var(--primary-color);
}

/* Password strength indicator */
.password-strength {
    height: 4px;
    margin-top: 0.5rem;
    border-radius: 2px;
    background-color: var(--border-color);
    overflow: hidden;
}

.password-strength-bar {
    height: 100%;
    width: 0;
    transition: all var(--transition-speed);
    background-color: var(--error-color);
}

.password-strength-bar.weak {
    width: 33.33%;
    background-color: var(--error-color);
}

.password-strength-bar.medium {
    width: 66.66%;
    background-color: #f1c40f;
}

.password-strength-bar.strong {
    width: 100%;
    background-color: var(--success-color);
}

/* Password requirements list */
.password-requirements {
    margin-top: 0.5rem;
    font-size: 0.8rem;
    color: #636e72;
}

.requirement {
    margin-top: 0.25rem;
    display: flex;
    align-items: center;
}

.requirement::before {
    content: "•";
    color: var(--border-color);
    margin-right: 0.5rem;
}

.requirement.met::before {
    content: "✓";
    color: var(--success-color);
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
    background: linear-gradient(45deg, var(--primary-color), #686de0);
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

/* Loading state */
.btn-primary.loading {
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

/* Error messages */
.error-message {
    color: var(--error-color);
    font-size: 0.8rem;
    margin-top: 0.5rem;
    display: none;
}

.form-control.error {
    border-color: var(--error-color);
}

.form-control.error + .error-message {
    display: block;
}

/* Success state */
.form-control.success {
    border-color: var(--success-color);
}

/* Responsive design */
@media (max-width: 480px) {
    form {
        padding: 1.5rem;
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

/* Animation for error shake */
@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-10px); }
    75% { transform: translateX(10px); }
}

.shake {
    animation: shake 0.5s;
}
</style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/student/resetpassword" method="post">
        <div class="form-header">
            <h2>Reset Password</h2>
            <p>Please create a strong password for your account</p>
        </div>

        <input type="hidden" name="email" value="${email}">
        <input type="hidden" name="token" value="${token}">
        
        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            <span class="password-toggle">👁️</span>
            <div class="password-strength">
                <div class="password-strength-bar"></div>
            </div>
            <div class="password-requirements">
                <div class="requirement" data-requirement="length">At least 8 characters</div>
                <div class="requirement" data-requirement="uppercase">At least 1 uppercase letter</div>
                <div class="requirement" data-requirement="lowercase">At least 1 lowercase letter</div>
                <div class="requirement" data-requirement="number">At least 1 number</div>
                <div class="requirement" data-requirement="special">At least 1 special character</div>
            </div>
            <span class="error-message">Please enter a valid password</span>
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            <span class="password-toggle">👁️</span>
            <span class="error-message">Passwords do not match</span>
        </div>

        <button type="submit" class="btn btn-primary">Reset Password</button>
    </form>

    <script>
        // Add JavaScript for password visibility toggle and validation
        document.addEventListener('DOMContentLoaded', function() {
            // Password toggle functionality
            document.querySelectorAll('.password-toggle').forEach(toggle => {
                toggle.addEventListener('click', function() {
                    const input = this.previousElementSibling;
                    input.type = input.type === 'password' ? 'text' : 'password';
                    this.textContent = input.type === 'password' ? '👁️' : '👁️‍🗨️';
                });
            });
        });
    </script>
</body>
</html>