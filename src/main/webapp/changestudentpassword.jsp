<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
        <link rel="icon" href="/images/SUPERSET.png">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4f46e5;
            --error-color: #ef4444;
            --success-color: #22c55e;
        }

       body {
    background-image:url('/images/ssw.jpg');
    background-size: cover;
    background-position: center;
    min-height: 150vh;
}


        .password-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 2.5rem;
            background: white;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border-radius: 16px;
            transition: transform 0.3s ease;
        }

        .password-form:hover {
            transform: translateY(-5px);
        }

        .form-title {
    color: var(--primary-color);
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 2rem;
    text-align: center;
    margin-top: 5rem; 
    white-space: nowrap;
     /* Adjust this value to move it further down */
}


        .form-floating {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-control {
            height: 60px;
            padding-left: 45px !important;
            border: 2px solid #e5e7eb;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(79, 70, 229, 0.1);
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            z-index: 2;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            cursor: pointer;
            z-index: 2;
        }

        .error-message {
            background-color: #fef2f2;
            color: var(--error-color);
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .password-strength {
            height: 4px;
            background: #e5e7eb;
            margin-top: 0.5rem;
            border-radius: 2px;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: width 0.3s ease, background-color 0.3s ease;
        }

        .btn-update {
            height: 50px;
            background: var(--primary-color);
            border: none;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .btn-update:hover {
            background: #4338ca;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.2);
        }

        .success-message {
            display: none;
            background-color: #f0fdf4;
            color: var(--success-color);
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            align-items: center;
            gap: 0.5rem;
        }
    </style>
</head>
<body>
    <jsp:include page="studentnavbar.jsp" />

    <div class="container">
        <div class="password-form">
            <h2 class="form-title">Change Student Password</h2>

            <!-- Success Message -->
          <%
    String passwordSuccess = request.getParameter("passwordSuccess");
    if (passwordSuccess != null && passwordSuccess.equals("true")) { 
%>
    <div class="success-message" id="successMessage">
         <i class="fas fa-check-circle"></i>
         Password updated successfully!
    </div>
<% } %>

            <!-- Error Messages -->
            <% String error = request.getParameter("error");
            if (error != null) {
                if (error.equals("currentPassword")) { %>
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        Current password is incorrect.
                    </div>
                <% } else if (error.equals("mismatch")) { %>
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        New password and confirm password do not match.
                    </div>
                <% } else if (error.equals("true")) { %>
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        An error occurred. Please try again.
                    </div>
                <% } 
            } %>

            <form action="updatepassword" method="post" onsubmit="return validateForm()">
                <div class="form-floating mb-3">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Current Password" required>
                    <i class="fas fa-eye password-toggle" onclick="togglePassword('currentPassword')"></i>
                    <label for="currentPassword">Current Password</label>
                </div>

                <div class="form-floating mb-3">
                    <i class="fas fa-key input-icon"></i>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required onkeyup="checkPasswordStrength()">
                    <i class="fas fa-eye password-toggle" onclick="togglePassword('newPassword')"></i>
                    <label for="newPassword">New Password</label>
                    <div class="password-strength">
                        <div class="password-strength-bar" id="strengthBar"></div>
                    </div>
                </div>

                <div class="form-floating mb-4">
                    <i class="fas fa-key input-icon"></i>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm New Password" required>
                    <i class="fas fa-eye password-toggle" onclick="togglePassword('confirmPassword')"></i>
                    <label for="confirmPassword">Confirm New Password</label>
                </div>

                <button type="submit" class="btn btn-primary btn-update w-100">
                    <i class="fas fa-sync-alt me-2"></i>Update Password
                </button>
            </form>
        </div>
    </div>

    <script>
        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const icon = input.nextElementSibling;
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }

        function checkPasswordStrength() {
            const password = document.getElementById('newPassword').value;
            const strengthBar = document.getElementById('strengthBar');
            let strength = 0;

            if (password.length >= 8) strength += 25;
            if (password.match(/[A-Z]/)) strength += 25;
            if (password.match(/[0-9]/)) strength += 25;
            if (password.match(/[^A-Za-z0-9]/)) strength += 25;

            strengthBar.style.width = strength + '%';

            if (strength <= 25) {
                strengthBar.style.backgroundColor = '#ef4444';
            } else if (strength <= 50) {
                strengthBar.style.backgroundColor = '#f59e0b';
            } else if (strength <= 75) {
                strengthBar.style.backgroundColor = '#10b981';
            } else {
                strengthBar.style.backgroundColor = '#22c55e';
            }
        }

        function validateForm() {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword.length < 8) {
                showError('Password must be at least 8 characters long');
                return false;
            }

            if (!/[A-Z]/.test(newPassword)) {
                showError('Password must contain at least one uppercase letter');
                return false;
            }

            if (!/[0-9]/.test(newPassword)) {
                showError('Password must contain at least one number');
                return false;
            }

            if (!/[^A-Za-z0-9]/.test(newPassword)) {
                showError('Password must contain at least one special character');
                return false;
            }

            if (newPassword !== confirmPassword) {
                showError('Passwords do not match');
                return false;
            }

            return true;
        }

        function showError(message) {
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error-message';
            errorDiv.innerHTML = `<i class="fas fa-exclamation-circle"></i>${message}`;
            
            const form = document.querySelector('form');
            form.insertBefore(errorDiv, form.firstChild);
            
            setTimeout(() => {
                errorDiv.remove();
            }, 3000);
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>