<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Company Login</title>
  <link rel="icon" href="/images/SUPERSET.png">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/css/companylogin.css">
</head>
<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6 col-lg-5">
        <div class="login-card p-4 p-md-5">
          <div class="text-center mb-4">
            <img src="/images/ima.jpeg" alt="Superset Logo" class="login-logo" style="display: block; margin-left: auto; margin-right: auto; width: 300px; height: 120px;">
            <h2 class="fw-bold" style="font-weight: bold; font-size: 36px;">Company Login</h2>
          </div>
         <div class="social-login d-flex justify-content-center mb-4">
    <!-- Google Button -->
    <a href="#" class="btn btn-danger p-3 rounded-circle d-flex align-items-center justify-content-center" aria-label="Login with Google" style="transition: all 0.3s ease;">
        <i class="fab fa-google text-white" style="font-size: 1.5rem;"></i>
    </a>
   <!-- LinkedIn Button -->
<a href="#" class="btn btn-primary me-2 p-3 rounded-circle d-flex align-items-center justify-content-center" aria-label="Login with LinkedIn" style="background-color: #0077b5; transition: all 0.3s ease;">
    <i class="fab fa-linkedin-in text-white" style="font-size: 1.5rem;"></i>
</a>
    <!-- Github Button -->
     <a href="#" class="btn btn-dark me-2 p-3 rounded-circle d-flex align-items-center justify-content-center" aria-label="Login with GitHub" style="transition: all 0.3s ease;">
        <i class="fab fa-github text-white" style="font-size: 1.5rem;"></i>
    </a>
</div>
          <div class="or-divider mb-4">
            <span class="px-3">or login with email</span>
          </div>
          <form id="loginForm" action="${pageContext.request.contextPath}/company/checkCompanylogin" method="POST">
            <div class="mb-3">
              <label for="email" class="form-label">Email address</label>
              <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required autocomplete="email">
            </div>
          <div class="mb-3 position-relative">
  <label for="password" class="form-label">Password</label>
  <div class="input-group">
    <input 
      type="password" 
      class="form-control" 
      id="password" 
      name="password" 
      placeholder="Enter your password" 
      required 
      autocomplete="current-password">
    <span class="input-group-text" id="togglePassword" style="cursor: pointer;">
      <i class="fas fa-eye" id="eyeIcon"></i>
    </span>
  </div>
</div>
            <div class="mb-3 form-check">
              <input type="checkbox" class="form-check-input" id="remember">
              <label class="form-check-label" for="remember">Remember me</label>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary btn-login">
                <span class="btn-text">Login</span>
                <div class="spinner"></div>
              </button>
            </div>
          </form>
          <hr>
          <div class="text-center">
            <p class="signup-link">Don't have an account? <a href="/company/companyreg" class="text-decoration-none">Sign up</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="loading-overlay">
    <div class="text-center">
      <div class="spinner"></div>
      <div class="loading-message">
        <div>Verifying credentials</div>
        <div class="dot-animation"></div>
      </div>
      <div class="progress-bar">
        <div class="progress-bar-fill"></div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
   <script>
   document.addEventListener('DOMContentLoaded', () => {
	      const form = document.getElementById('loginForm');
	      const submitButton = form.querySelector('button[type="submit"]');
	      const loadingOverlay = document.querySelector('.loading-overlay');
	      const progressBarFill = document.querySelector('.progress-bar-fill');
	      const loadingMessage = document.querySelector('.loading-message div:first-child');

	      const loadingMessages = [
	        'Verifying credentials',
	        'Checking account status',
	        'Preparing your DashBoard',
	        'Almost there'
	      ];

	      function showToast(message, type) {
	        Toastify({
	          text: message,
	          duration: 3000,
	          gravity: "top",
	          position: "right",
	          className: type,
	          stopOnFocus: true
	        }).showToast();
	      }

	      function updateLoadingProgress(progress, messageIndex) {
	        progressBarFill.style.width = `${progress}%`;
	        if (messageIndex < loadingMessages.length) {
	          loadingMessage.textContent = loadingMessages[messageIndex];
	        }
	      }

	      async function simulateLoading() {
	        loadingOverlay.classList.add('show');
	        
	        // Total duration: 6 seconds
	        const totalSteps = 60; // 100 ms per step
	        const progressPerStep = 100 / totalSteps;
	        
	        for (let i = 0; i <= totalSteps; i++) {
	          const progress = progressPerStep * i;
	          const messageIndex = Math.floor((progress / 100) * loadingMessages.length);
	          
	          updateLoadingProgress(progress, messageIndex);
	          await new Promise(resolve => setTimeout(resolve, 100)); // 100ms per step
	        }
	      }

	      // Check URL parameters for different response scenarios
	      const urlParams = new URLSearchParams(window.location.search);
	      
	      if (urlParams.has('success')) {
	        showToast('Registration successful! Please Login.', 'success');
	      } 
	      else if (urlParams.has('status')) {
	        showToast('Your account is pending approval or has been rejected. Please contact support.', 'status');
	      }
	      else if (urlParams.has('error')) {
	        const errorType = urlParams.get('error');
	        switch(errorType) {
	          case 'loginFailed':
	            showToast('Invalid email or password. Please try again.', 'error');
	            break;
	          case 'unknownStatus':
	            showToast('Account status unknown. Please contact support.', 'error');
	            break;
	          default:
	            showToast('An error occurred. Please try again.', 'error');
	        }
	      }

	      // Handle form submission
	      form.addEventListener('submit', async (e) => {
	        e.preventDefault();
	        
	        // Validate form
	        if (!form.checkValidity()) {
	          e.stopPropagation();
	          showToast('Please fill in all required fields.', 'error');
	          return;
	        }

	        // Disable the button and show loading state
	        submitButton.disabled = true;
	        submitButton.classList.add('loading');

	        try {
	          // Remove any existing success/error parameters from the URL
	          const currentUrl = window.location.href.split('?')[0];
	          history.replaceState({}, '', currentUrl);

	          // Show loading animation for 6 seconds
	          await simulateLoading();
	          
	          // Submit the form
	          form.submit();
	        } catch (error) {
	          loadingOverlay.classList.remove('show');
	          submitButton.disabled = false;
	          submitButton.classList.remove('loading');
	          showToast('An error occurred. Please try again.', 'error');
	        }
	      });

	      // GSAP Animations
	      gsap.from('.login-card', {
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
   
   document.addEventListener('DOMContentLoaded', () => {
	   const passwordField = document.getElementById('password');
	   const togglePassword = document.getElementById('togglePassword');
	   const eyeIcon = document.getElementById('eyeIcon');

	   togglePassword.addEventListener('click', () => {
	     const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
	     passwordField.setAttribute('type', type);
	     
	     // Toggle the eye icon
	     eyeIcon.classList.toggle('fa-eye');
	     eyeIcon.classList.toggle('fa-eye-slash');
	   });
	 });

   </script>
</body>
</html>