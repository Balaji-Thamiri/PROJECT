<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Student student = (Student) session.getAttribute("student");
if(student == null) {
    response.sendRedirect("studentsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <!-- Add Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="/images/SUPERSET.png">
    <style>
       body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8fafc;
    background-image: url('/images/claude.jpg');
    background-size: cover; /* Ensure the image covers the entire background */
    background-position: center; /* Center the background image */
    background-repeat: no-repeat; /* Prevent repeating the image */
}

        .profile-card {
            transition: transform 0.3s ease;
        }
        .profile-card:hover {
            transform: translateY(-5px);
        }
        .cover-image {
            background-image: url('/images/cover.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
            height: 250px;
        }
        .cover-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to bottom, rgba(0,0,0,0.2), rgba(0,0,0,0.3));
        }
        .profile-container {
            position: relative;
            margin-top: -100px;
            padding: 0 1.5rem;
        }
        .profile-image {
            position: relative;
            z-index: 2;
        }
        .profile-heading {
            text-align: center;
            margin-top: 50px;
            background-color: white; /* Light blue background */
            padding: 20px;
            border-radius: 10px;
            color: #007bff; /* Bootstrap primary color */
            font-size: 2.5rem; /* Large text size */
            font-weight: bold; /* Bold text */
        }
        .profile-heading i {
            margin-right: 10px;
            color: #007bff;
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
<body class="bg-gray-50 pt-20">
    <div class="max-w-4xl mx-auto px-4 py-8">
        <!-- Page Title -->
     <div>
        <h1 class="profile-heading">
            <i class="bi bi-person-circle"></i>Student Profile
        </h1>
    </div>
        <!-- Profile Header -->
        <div class="bg-white rounded-2xl shadow-lg overflow-hidden mb-6 profile-card">
            <div class="cover-image"></div>
            <div class="profile-container">
                <div class="profile-image">
                    <img src="data:${student.imageType};base64,${student.base64Image}" 
                         class="w-32 h-32 rounded-full border-4 border-white shadow-lg" 
                         alt="Profile Picture">
                </div>
                <div class="mt-4 pb-4">
                    <h1 class="text-2xl font-bold text-gray-800">
                        <%= student.getFirstName() + " " + student.getLastName() %>
                    </h1>
                    <p class="text-gray-600">
                        <%= student.getDegree() + " - " + student.getBranch() %>
                    </p>
                </div>
            </div>
        </div>

        <!-- Profile Information -->
        <div class="grid md:grid-cols-2 gap-6">
            <!-- Personal Information -->
            <div class="bg-white rounded-xl shadow-lg p-6 profile-card">
                <h2 class="text-xl font-semibold mb-4 text-gray-800 flex items-center">
                    <i class="bi bi-person-fill mr-2 text-blue-600"></i>
                    Personal Information
                </h2>
                <div class="space-y-4">
                    <div>
                        <p class="text-sm text-gray-500">Email</p>
                        <p class="font-medium"><%= student.getEmail() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">University ID</p>
                        <p class="font-medium"><%= student.getUniversityId() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">Phone Number</p>
                        <p class="font-medium"><%= student.getPhone() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">Date of Birth</p>
                        <p class="font-medium"><%= student.getDateOfBirth() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">Gender</p>
                        <p class="font-medium"><%= student.getGender() %></p>
                    </div>
                </div>
            </div>

            <!-- Academic Information -->
            <div class="bg-white rounded-xl shadow-lg p-6 profile-card">
                <h2 class="text-xl font-semibold mb-4 text-gray-800 flex items-center">
                    <i class="bi bi-mortarboard-fill mr-2 text-blue-600"></i>
                    Academic Information
                </h2>
                <div class="space-y-4">
                 <div>
                        <p class="text-sm text-gray-500">University Name</p>
                        <p class="font-medium"><%= student.getUniversityname() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">Degree Program</p>
                        <p class="font-medium"><%= student.getDegree() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">Branch</p>
                        <p class="font-medium"><%= student.getBranch() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">CGPA</p>
                        <p class="font-medium"><%= student.getCgpa() %></p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-500">Graduation Year</p>
                        <p class="font-medium"><%= student.getGraduationYear() %></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="mt-6 flex justify-between space-x-4">
            <button onclick="window.location.href='/student/studenthome' " class="px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 transition duration-300 flex items-center">
                <i class="bi bi-arrow-left mr-2"></i>
                Back
            </button>
           <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition duration-300 flex items-center" onclick="window.location.href='/student/editstudentprofile';">
    <i class="bi bi-pencil-fill mr-2"></i>
    Edit Profile
</button>
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