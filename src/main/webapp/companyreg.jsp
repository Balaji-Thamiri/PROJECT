<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Company Signup</title>
  <link rel="icon" href="/images/SUPERSET.png">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.tailwindcss.com"></script>
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/companyreg.css">
</head>
<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="registration-card p-4 p-md-5">
          <div class="text-center mb-4">
          <img src="/images/ima.jpeg" alt="Superset Logo" class="login-logo" style="display: block; margin-left: auto; margin-right: auto; width: 300px; height: 120px;">
          <h2 class="fw-bold" style="font-weight: bold; font-size: 36px;">Company Registration</h2>
          </div>
          <form id="companysignupform" method="POST" action="/company/register" enctype="multipart/form-data">
            <div class="row mb-4">
              <div class="col-md-4 text-center mb-3 mb-md-0">
                <label for="companyImage" class="form-label">Company Logo</label>
                <div class="upload-image mx-auto" onclick="document.getElementById('imageUpload').click();">
                  <i class="fas fa-building"></i>
                </div>
                <input type="file" name="file" id="imageUpload" hidden accept="image/*">
              </div>
              <div class="col-md-8">
                <div class="mb-3">
                  <label for="companyName" class="form-label">Company Name</label>
                  <input type="text" name="companyname" class="form-control" id="companyName" required>
                </div>
                <div class="mb-3">
                  <label for="companyEmail" class="form-label">Email address</label>
                  <input type="email" name="companyemail"  class="form-control" id="companyEmail" required>
                </div>
               <div class="mb-3">
  <label for="companyPhone" class="form-label">Phone Number</label>
  <input type="tel" name="companyphone" class="form-control" id="companyPhone" required pattern="^\d{10}$" title="Please enter a 10-digit phone number">
</div>
              </div>
            </div>
            <div class="row mb-4">
              <div class="col-md-6 mb-3">
                <label for="companyLocation" class="form-label">Company Location</label>
                <input type="text"  name="companylocation" class="form-control" id="companyLocation" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="companyWebsite" class="form-label">Website</label>
                <input type="url" name="companywebsite" class="form-control" id="companyWebsite" required>
              </div>
            </div>
            <h4 class="mb-3">Login Information</h4>
            <div class="row mb-4">
  <div class="col-md-6 mb-3 position-relative">
    <label for="password" class="form-label">Password</label>
    <input type="password" name="pass" class="form-control" id="password" required>
    
  </div>
  <div class="col-md-6 mb-3 position-relative">
    <label for="confirmPassword" class="form-label">Confirm Password</label>
    <input type="password" class="form-control" id="confirmPassword" required>
    <div id="passwordMismatch" class="password-mismatch" style="display: none;">
      Passwords do not match
    </div>
    
  </div>
</div>
            <div class="mb-4 form-check">
              <input type="checkbox" class="form-check-input" id="terms" required>
              <label class="form-check-label" for="terms">I agree to the terms and conditions</label>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary btn-register" id="registerButton">Register</button>
            </div>
          </form>
          <hr>
          <div class="text-center">
            <p class="login-link">Already have an account? <a href="/company" class="text-decoration-none">Login</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script>
    // Image upload preview logic here
    document.getElementById('imageUpload').addEventListener('change', function(e) {
      if (e.target.files && e.target.files[0]) {
        let reader = new FileReader();
        reader.onload = function(event) {
          let uploadImage = document.querySelector('.upload-image');
          let icon = uploadImage.querySelector('i');
          let img = uploadImage.querySelector('img') || document.createElement('img');
          
          img.src = event.target.result;
          img.alt = "Company Logo";
          img.style.display = 'block';
          
          if (!uploadImage.contains(img)) {
            uploadImage.appendChild(img);
          }
          
          if (icon) {
            icon.style.display = 'none';
          }
        }
        reader.readAsDataURL(e.target.files[0]);
      }
    });

    // Password validation
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirmPassword');
    const passwordMismatch = document.getElementById('passwordMismatch');
    const registerButton = document.getElementById('registerButton');

    function validatePassword() {
      if (password.value !== confirmPassword.value) {
        passwordMismatch.style.display = 'block';
        registerButton.disabled = true;
      } else {
        passwordMismatch.style.display = 'none';
        registerButton.disabled = false;
      }
    }

    password.addEventListener('input', validatePassword);
    confirmPassword.addEventListener('input', validatePassword);

    // AJAX form submission
   // AJAX form submission
/* document.getElementById('companysignupform').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const formData = new FormData(this);
    
    fetch('/company/register', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            return response.json().then(data => { throw data; }); // Throw if the response is not ok
        }
        return response.json(); // Otherwise, return the JSON data
    })
    .then(data => {
        showToast(data.message, 'success');
        // Optionally, reset the form
        document.getElementById('companysignupform').reset(); // Resetting the form correctly
    })
    .catch(data => {
        showToast(data.message || "An error occurred. Please try again.", 'error');
    });
});

    

    function showToast(message, type) {
      Toastify({
        text: message,
        duration: 3000,
        close: true,
        gravity: "top",
        position: "right",
        backgroundColor: type === 'success' 
          ? "linear-gradient(to right, #00b09b, #96c93d)"
          : "linear-gradient(to right, #ff5f6d, #ffc371)",
        stopOnFocus: true,
        onClick: function(){} // Prevents auto-close on click
      }).showToast();
    } */
  </script>
   <script>
        // Function to show toast message with timer
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
                showToast("Company Registration Successful!", "success");
            } else if (error) {
                showToast("Company Registration failed. Please try again.", "error");
            }
        }
   </script>
   <script>
  function togglePassword(fieldId, iconElement) {
    const field = document.getElementById(fieldId);
    const icon = iconElement.querySelector('i');
    
    if (field.type === "password") {
      field.type = "text";
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');
    } else {
      field.type = "password";
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
    }
  }
</script>
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
    