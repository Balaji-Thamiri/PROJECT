<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student - Admin Panel</title>
     <link rel="icon" href="/images/SUPERSET.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="stylesheet" href="/css/addstudent.css">
</head>
<body>
    <div class="admin-container">
        <div class="admin-card">
            <div class="admin-header" >
                <i class="fas fa-user-plus" style="font-size: 2rem; color: var(--primary-color);"></i>
                <h1 class="admin-title">Add New Student</h1>
            </div>

            <form id="addStudentForm" method="POST" action="/admin/add" enctype="multipart/form-data">
                <div class="form-section">
                    <h2 class="section-title">
                        <i class="fas fa-camera"></i>
                        Student Photo
                    </h2>
                    <div class="image-upload" onclick="document.getElementById('imageUpload').click();">
                        <i class="fas fa-cloud-upload-alt"></i>
                        <img id="uploadedImage" src="" alt="" style="display: none; width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <input type="file" name="file" id="imageUpload" hidden accept="image/*">
                </div>

                <div class="form-section">
                    <h2 class="section-title">
                        <i class="fas fa-user"></i>
                        Personal Information
                    </h2>
                    <div class="row g-4">
                        <div class="col-md-6">
                            <label class="form-label required-field">First Name</label>
                            <input type="text" name="firstName" class="form-control" required placeholder="Enter first name">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Last Name</label>
                            <input type="text" name="lastName" class="form-control" required placeholder="Enter last name">
                        </div>
                         <div class="col-md-6">
                            <label class="form-label required-field">University Name</label>
                            <input type="text" name="universityname" class="form-control" required placeholder="Enter university Name">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">University ID</label>
                            <input type="text" name="universityId" class="form-control" required placeholder="Enter university ID">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Email</label>
                            <input type="email" name="email" class="form-control" required placeholder="Enter email address">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Phone Number</label>
                            <input type="tel" name="phone" class="form-control" required placeholder="Enter phone number">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Date of Birth</label>
                            <input type="date" name="dob" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Gender</label>
                            <select name="gender" class="form-select" required>
                                <option value="">Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="section-title">
                        <i class="fas fa-graduation-cap"></i>
                        Academic Information
                    </h2>
                    <div class="row g-4">
                        <div class="col-md-6">
                            <label class="form-label required-field">Degree Program</label>
                            <input type="text" name="degree" class="form-control" required placeholder="Enter degree program">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Branch/Department</label>
                            <input type="text" name="branch" class="form-control" required placeholder="Enter branch/department">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Current CGPA</label>
                            <input type="number" name="cgpa" step="0.01" min="0" max="10" class="form-control" required placeholder="Enter CGPA">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Year of Graduation</label>
                            <input type="number" name="gradYear" min="2000" max="2100" class="form-control" required placeholder="Enter graduation year">
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="section-title">Account Setup</h2>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label required-field">Password</label>
                            <input type="password" name="password" class="form-control" id="password" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label required-field">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" required>
                            <div id="passwordMismatch" class="text-danger mt-1" style="display: none;">
                                Passwords do not match
                            </div>
                        </div>
                    </div>
                </div>

               <div class="d-grid gap-2 d-md-flex justify-content-center mt-4">
    <button type="button" class="btn btn-light me-md-2" onclick="window.history.back()">Cancel</button>
    <button type="submit" class="btn btn-primary">Add Student</button>
</div>

            </form>
        </div>
    </div>

    <script>
        // Image Upload Preview
        document.getElementById('imageUpload').addEventListener('change', function(e) {
            if (e.target.files && e.target.files[0]) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    const uploadImage = document.querySelector('.image-upload');
                    const icon = uploadImage.querySelector('i');
                    const img = document.getElementById('uploadedImage');
                    
                    img.src = event.target.result;
                    img.style.display = 'block';
                    if (icon) icon.style.display = 'none';
                }
                reader.readAsDataURL(e.target.files[0]);
            }
        });

        // Password Confirmation
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            const mismatchMessage = document.getElementById('passwordMismatch');
            mismatchMessage.style.display = password === confirmPassword ? 'none' : 'block';
        });

        // Form Submission and Toast Notifications
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
                showToast("Add Student Unsucessful. Please try again.", "error");
            }
        }
        
    </script>
</body>
</html>