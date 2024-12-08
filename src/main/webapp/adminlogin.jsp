<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | Dashboard</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <link rel="icon" type="image/png" href="assets/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
     <link rel="stylesheet" href="/css/adminlogin.css">
</head>
<body>
  

    <div class="login-container">
        <div class="login-header">
            <h1>Admin Login</h1>
            <p>Please sign in to continue.</p>
        </div>
        
        <form id="loginForm" action="${pageContext.request.contextPath}/admin/checkadminlogin" method="POST" class="space-y-6">
            <div class="form-group">
                <input type="email" id="email" name="email" class="form-input" placeholder=" " required>
                <label for="email" class="form-label">Email Address</label>
            </div>

            <div class="form-group">
                <input type="password" id="password" name="password" class="form-input" placeholder=" " required>
                <label for="password" class="form-label">Password</label>
            </div>

            
            <button type="submit" class="submit-btn">
                <span>Sign In</span>
                <div class="spinner"></div>
            </button>
        </form>
    </div>

    <div id="toast" class="toast"></div>

    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const form = document.getElementById('loginForm');
        const toast = document.getElementById('toast');

        function showToast(message, type) {
            toast.textContent = message;
            toast.className = `toast ${type}`;
            setTimeout(() => toast.classList.add('show'), 100);
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        // Display toast based on URL parameters (success or error)
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('success')) {
            showToast('Login Successful!', 'success');
        } else if (urlParams.has('error')) {
            showToast('Login Unsuccessful. Please try again.', 'error');
        }

        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            form.classList.add('loading');

            try {
                await new Promise(resolve => setTimeout(resolve, 1500));
                showToast('Processing...', 'success');
                setTimeout(() => form.submit(), 1000);
            } catch (error) {
                showToast('Login failed. Please try again.', 'error');
                form.classList.remove('loading');
            }
        });

        // GSAP Animations
        gsap.from('.login-container', {
            duration: 1,
            y: 50,
            opacity: 0,
            ease: 'power3.out'
        });

        gsap.from('.form-group', {
            duration: 0.8,
            y: 30,
            opacity: 0,
            stagger: 0.2,
            ease: 'power3.out',
            delay: 0.3
        });

        gsap.from('.login-header', {
            duration: 1,
            y: -30,
            opacity: 0,
            ease: 'power3.out'
        });
    });
    </script>
</body>
</html>