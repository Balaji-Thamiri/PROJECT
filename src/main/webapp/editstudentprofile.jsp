<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("studentsessionexpiry");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="icon" href="/images/SUPERSET.png">
    <style>
      body {
  font-family: 'Poppins', sans-serif;
  background-image: url('/images/sup.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
  margin: 0;
}

.profile-card {
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
  padding: 40px;
  width: 100%;
  max-width: 600px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.profile-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
}

.form-group {
  margin-bottom: 24px;
}

.form-control {
  border: 1px solid #d0d0d0;
  border-radius: 6px;
  padding: 12px 16px;
  font-size: 16px;
  width: 100%;
  transition: border-color 0.3s ease;
}

.form-control:focus {
  outline: none;
  border-color: #007bff;
}

.btn {
  border-radius: 6px;
  padding: 12px 24px;
  font-size: 16px;
  font-weight: 500;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.btn-primary {
  background-color: #007bff;
  border-color: #007bff;
  color: #fff;
}

.btn-primary:hover {
  background-color: #0056b3;
  border-color: #004a99;
}

.btn-secondary {
  background-color: #6c757d;
  border-color: #6c757d;
  color: #fff;
}

.btn-secondary:hover {
  background-color: #4d5259;
  border-color: #46494c;
}

.row {
  display: flex;
  flex-wrap: wrap;
  margin: -12px;
}

.col {
  flex: 0 0 50%;
  max-width: 50%;
  padding: 12px;
}


.text-2xl.font-bold.mb-6.text-gray-800 {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
  font-weight: bold;
  color: #4a5568;
}

.text-2xl.font-bold.mb-6.text-gray-800 i {
  font-size: 1.5rem;
  margin-right: 0.5rem;
  color: #4a5568;
}


@media (max-width: 767px) {
  .col {
    flex: 0 0 100%;
    max-width: 100%;
  }
}
.toastify {
            font-family: 'Poppins', sans-serif;
            padding: 12px 20px;
            color: #ffffff;
            border-radius: 5px;
            font-size: 1rem;
            overflow: hidden;
        }
        .toastify.success {
            background: linear-gradient(to right, #00b09b, #96c93d);
        }
        .toastify.error {
            background: linear-gradient(to right, #ff5f6d, #ffc371);
        }
        .toast-timer {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 4px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.7);
            animation: toast-timer 5s linear forwards;
        }
        @keyframes toast-timer {
            0% {
                width: 100%;
            }
            100% {
                width: 0%;
            }
        }
    </style>
</head>
<body>
<h1 class="text-4xl font-bold mb-6 text-gradient from-green-300 to-green-500">
  <u>Update Student Profile</u>
</h1>
    <div class="max-w-4xl mx-auto px-4 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6 profile-card">
            <form action="/student/updatestudentprofile" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="firstName" class="text-gray-600 font-medium">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="<%= student.getFirstName() %>" disabled>
                </div>
                <div class="form-group">
                    <label for="lastName" class="text-gray-600 font-medium">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="<%= student.getLastName() %>" disabled>
                </div>
                <div class="form-group">
                    <label for="email" class="text-gray-600 font-medium">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= student.getEmail() %>" disabled>
                </div>
                <div class="form-group">
                    <label for="phone" class="text-gray-600 font-medium">Phone</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="<%= student.getPhone() %>" required>
                </div>
                <div class="form-group">
                    <label for="dob" class="text-gray-600 font-medium">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" name="dob" value="<%= student.getDateOfBirth() %>" required>
                </div>
                <div class="form-group">
                    <label for="gender" class="text-gray-600 font-medium">Gender</label>
                    <select class="form-control" id="gender" name="gender" required>
                        <option value="<%= student.getGender() %>" selected><%= student.getGender() %></option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="profile-image" class="text-gray-600 font-medium">Profile Image</label>
                    <input type="file" class="form-control-file" id="profile-image" name="file">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Update Profile</button>
                    <a href="studentprofile" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
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
                showToast("Student Profile Update Successful!", "success");
            } else if (error) {
                showToast("Student Profile Update Failed!Try Again", "error");
            }
        }
   </script>
</body>
</html>