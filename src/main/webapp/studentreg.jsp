<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Registration</title>
  <link rel="icon" href="/images/SUPERSET.png"> <!-- This sets the favicon -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
   <script src="https://cdn.tailwindcss.com"></script>
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="/css/studentreg.css">
</head>
<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="registration-card p-4 p-md-5">
          <div class="text-center mb-4">
    <img src="/images/stl.svg" alt="Superset Logo" class="login-logo" style="display: block; margin-left: auto; margin-right: auto; width: 300px; height: 100px;">
    <h2 class="fw-bold" style="font-weight: bold; font-size: 36px;">Student Registration</h2>
</div>
          <form id="registrationForm" method="POST" action="/student/register" enctype="multipart/form-data">
            <div class="row mb-4">
              <div class="col-md-4 text-center mb-3 mb-md-0">
                <label for="studentImage" class="form-label">Student Image</label>
                <div class="upload-image mx-auto" onclick="document.getElementById('imageUpload').click();">
                  <i class="fas fa-user-plus"></i>
                  <img id="uploadedImage" src="" alt="Student Image" style="display: none;"> <!-- Hidden initially -->
                </div>
                <input type="file" name="file" id="imageUpload" hidden accept="image/*">
              </div>
              <div class="col-md-8">
                <h4 class="mb-3">Personal Information</h4>
                <div class="mb-3">
                  <label for="firstName" class="form-label">First Name</label>
                  <input type="text" name="firstName" class="form-control" id="firstName" required>
                </div>
                <div class="mb-3">
                  <label for="lastName" class="form-label">Last Name</label>
                  <input type="text" name="lastName" class="form-control" id="lastName" required>
                </div>
                 <div class="mb-3">
                  <label for="universityname" class="form-label">University Name</label>
                  <input type="text" name="universityname" class="form-control" id="universityname" required>
                </div>
                <div class="mb-3">
                  <label for="universityId" class="form-label">University ID</label>
                  <input type="text" name="universityId" class="form-control" id="universityId" required>
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email address</label>
                  <input type="email" name="email" class="form-control" id="email" required>
                </div>
                <div class="mb-3">
  <label for="phone" class="form-label">Phone Number</label>
  <input type="tel" name="phone" class="form-control" id="phone" required pattern="^\d{10}$" title="Please enter a 10-digit phone number">
</div>
              </div>
            </div>
            <div class="row mb-4">
              <div class="col-md-6 mb-3">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="date" name="dob" class="form-control" id="dob" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="gender" class="form-label">Gender</label>
                <select name="gender" class="form-select" id="gender" required>
                  <option value="">Choose...</option>
                  <option value="male">Male</option>
                  <option value="female">Female</option>
                  <option value="other">Other</option>
                </select>
              </div>
            </div>
            <h4 class="mb-3">Academic Information</h4>
            <div class="row mb-4">
              <div class="col-md-6 mb-3">
                <label for="degree" class="form-label">Degree Program</label>
                <input type="text" name="degree" class="form-control" id="degree" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="branch" class="form-label">Branch/Department</label>
                <input type="text" name="branch" class="form-control" id="branch" required>
              </div>
            </div>
            <div class="row mb-4">
              <div class="col-md-6 mb-3">
                <label for="cgpa" class="form-label">Current CGPA</label>
                <input type="number" name="cgpa" step="0.01" min="0" max="10" class="form-control" id="cgpa" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="gradYear" class="form-label">Year of Graduation</label>
                <input type="number" name="gradYear" min="2000" max="2100" class="form-control" id="gradYear" required>
              </div>
            </div>
            <h4 class="mb-3">Login Information</h4>
            <div class="row mb-4">
  <div class="col-md-6 mb-3 position-relative">
    <label for="password" class="form-label">Password</label>
    <input type="password" name="password" class="form-control" id="password" required>
   
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
              <button type="submit" class="btn btn-register">Register</button>
            </div>
            <div class="text-center">
            <p class="login-link">Already have an account? <a href="/student" class="text-decoration-none">Login</a></p>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

  <script>
  document.getElementById('imageUpload').addEventListener('change', function(e) {
      if (e.target.files && e.target.files[0]) {
        let reader = new FileReader();
        reader.onload = function(event) {
          let uploadImage = document.querySelector('.upload-image');
          let icon = uploadImage.querySelector('i');
          let img = uploadImage.querySelector('img') || document.createElement('img');
          
          img.src = event.target.result;
          img.alt = "Student Image";
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


    document.getElementById('confirmPassword').addEventListener('input', function() {
      const password = document.getElementById('password').value;
      const confirmPassword = this.value;
      const mismatchMessage = document.getElementById('passwordMismatch');
      if (confirmPassword !== password) {
        mismatchMessage.style.display = 'block';
      } else {
        mismatchMessage.style.display = 'none';
      }
    });
    
    /* document.getElementById('registrationForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(this);
        
        fetch('/student/register', {
          method: 'POST',
          body: formData
        })
        .then(response => response.json())
        .then(data => {
          if (data.status === 'success') {
            showToast(data.message, 'success');
            // Optionally, reset the form
            document.getElementById('registrationForm').reset();
          } else {
            showToast(data.message, 'error');
          }
        })
        .catch(error => {
          showToast("An error occurred. Please try again.", 'error');
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
                showToast("Student Registration Successful!", "success");
            } else if (error) {
                showToast("Student Registration failed. Please try again.", "error");
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
