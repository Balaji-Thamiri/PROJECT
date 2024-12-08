<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Student student = (Student) session.getAttribute("student");
if(student==null)
{
	response.sendRedirect("studentsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Navigation Bar</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8fafc;
        }

        .nav-link {
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 50%;
            background-color: #3b82f6;
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .nav-link:hover::after {
            width: 100%;
        }

        .nav-icon {
            transition: transform 0.3s ease;
            display: inline-block;
            vertical-align: middle;
            margin-right: 8px;
        }

        .nav-link:hover .nav-icon {
            transform: translateY(-2px);
        }

        .dropdown-icon {
            transition: transform 0.2s ease;
            display: inline-block;
            vertical-align: middle;
            margin-right: 12px;
            font-size: 1.1em;
        }

        .dropdown-item:hover .dropdown-icon {
            transform: scale(1.1);
            color: #3b82f6;
        }

        .profile-img {
            transition: transform 0.3s ease;
        }

        .profile-img:hover {
            transform: scale(1.05);
        }

        #profileDropdown {
            display: none;
            position: absolute;
            right: 0;
            top: 100%;
            transform: translateY(-10px);
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            background-color: white;
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            z-index: 50;
        }

        #profileDropdown.show {
            display: block;
            transform: translateY(0);
            opacity: 1;
            visibility: visible;
        }

        .dropdown-item {
            transition: all 0.2s ease;
            position: relative;
            padding-left: 1.5rem;
        }

        .dropdown-item::before {
            content: '';
            position: absolute;
            left: 0.75rem;
            top: 50%;
            width: 0.35rem;
            height: 0.35rem;
            background-color: #3b82f6;
            border-radius: 50%;
            transform: translateY(-50%) scale(0);
            transition: transform 0.2s ease;
        }

        .dropdown-item:hover::before {
            transform: translateY(-50%) scale(1);
        }

        .nav-container {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.9);
        }

        .mobile-menu {
            transition: all 0.3s ease;
        }

        @keyframes slideDown {
            from {
                transform: translateY(-1rem);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .notification-badge {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        .custom-scrollbar {
            scrollbar-width: thin;
            scrollbar-color: #e2e8f0 #ffffff;
        }

        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }

        .custom-scrollbar::-webkit-scrollbar-track {
            background: #ffffff;
        }

        .custom-scrollbar::-webkit-scrollbar-thumb {
            background-color: #e2e8f0;
            border-radius: 3px;
        }

        /* Active link styles */
        .nav-link.active {
            color: #3b82f6;
            background-color: #eff6ff;
            border-radius: 0.5rem;
        }

        .nav-link.active::after {
            width: 100%;
        }

        /* Notification dropdown styles */
        #notificationDropdown {
            width: 320px;
            max-height: 480px;
            overflow-y: auto;
        }

        .notification-item {
            transition: all 0.2s ease;
        }

        .notification-item:hover {
            background-color: #f8fafc;
        }

        .notification-dot {
            width: 8px;
            height: 8px;
            background-color: #3b82f6;
            border-radius: 50%;
            display: inline-block;
        }
    </style>
</head>
<body class="bg-gray-50">
    <nav class="fixed w-full top-0 z-50">
        <div class="nav-container shadow-lg">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex justify-between">
                    <!-- Logo Section -->
                    <div class="flex space-x-7">
                        <div class="logo-container">
                      <a href="/student/studenthome" class="flex items-center py-4 px-2">
    <img src="/images/rsm.png" alt="Logo" class="mr-2" style="width: 190px; height: 60px;">
</a>

                        </div>
                    </div>

                    <!-- Desktop Navigation -->
                    <div class="hidden md:flex items-center space-x-6">
                        <a href="/student/studenthome" class="nav-link active py-2 px-3 font-medium text-gray-600 rounded-lg hover:bg-blue-50 hover:text-blue-600">
                            <i class="bi bi-house-door-fill nav-icon"></i>
                            Home
                        </a>
                        <a href="/student/viewalljobs" class="nav-link py-2 px-3 font-medium text-gray-600 rounded-lg hover:bg-blue-50 hover:text-blue-600">
                            <i class="bi bi-briefcase-fill nav-icon"></i>
                            Job Listings
                        </a>
                        <a href="/student/myapplications" class="nav-link py-2 px-3 font-medium text-gray-600 rounded-lg hover:bg-blue-50 hover:text-blue-600">
                            <i class="bi bi-file-earmark-text-fill nav-icon"></i>
                            My Applications
                        </a>
                        <a href="/student/available-quizzes" class="nav-link py-2 px-3 font-medium text-gray-600 rounded-lg hover:bg-blue-50 hover:text-blue-600">
    <i class="bi bi-check2-square nav-icon"></i>
    Assessments
</a>
                        
                        

                        <!-- Notifications -->
                        <div class="relative">
                            <button id="notificationBtn" class="nav-link p-2 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-full">
                                <i class="bi bi-bell-fill text-xl"></i>
                                <span class="notification-badge absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">3</span>
                            </button>

                            <!-- Notifications Dropdown -->
                            <div id="notificationDropdown" class="hidden absolute right-0 mt-2 bg-white rounded-xl shadow-lg custom-scrollbar">
                                <div class="p-4 border-b border-gray-100">
                                    <div class="flex justify-between items-center">
                                        <h3 class="font-semibold text-gray-900">Notifications</h3>
                                        <span class="text-sm text-blue-600 cursor-pointer hover:text-blue-800">Mark all as read</span>
                                    </div>
                                </div>

                                <div class="divide-y divide-gray-100">
                                    <!-- Notification Items -->
                                    <div class="notification-item p-4 hover:bg-gray-50">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0">
                                                <i class="bi bi-briefcase-fill text-blue-500 text-lg"></i>
                                            </div>
                                            <div class="ml-3">
                                                <p class="text-sm font-medium text-gray-900">New job matching your profile</p>
                                                <p class="text-sm text-gray-500">Software Developer at Tech Corp</p>
                                                <p class="text-xs text-gray-400 mt-1">2 hours ago</p>
                                            </div>
                                            <div class="ml-auto">
                                                <div class="notification-dot"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Add more notification items as needed -->
                                </div>

                                <div class="p-4 text-center border-t border-gray-100">
                                    <a href="#" class="text-sm text-blue-600 hover:text-blue-800">View all notifications</a>
                                </div>
                            </div>
                        </div>

                        <!-- Profile Dropdown -->
                        <div class="relative" id="profileDropdownContainer">
<img src="data:${student.imageType};base64,${student.base64Image}" class="profile-img w-14 h-14 rounded-full border-2 border-white cursor-pointer shadow-md hover:border-blue-400" alt="Profile Image" id="profileDropdownBtn">
                    
                            <div id="profileDropdown" class="w-64 py-2 px-1 rounded-xl custom-scrollbar">
                                <div class="px-4 py-3 border-b border-gray-100">
                                    <div class="flex items-center space-x-3">
                                        <img src="data:${student.imageType};base64,${student.base64Image}" class="w-10 h-10 rounded-full" alt="Profile">
                                        <div>
                                            <p class="text-sm font-semibold text-gray-700"><%= student.getFirstName()+student.getLastName()%> </p>
                                            <p class="text-xs text-gray-500"> <%= student.getEmail()%> 
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="px-4 py-2">
                                    <div class="text-xs text-gray-500 mb-2">ACCOUNT SETTINGS</div>
                                    <a href="/student/studentprofile" class="dropdown-item flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-blue-50 hover:text-blue-600 rounded-lg mt-1">
                                        <i class="bi bi-person-fill dropdown-icon"></i>
                                        View Profile
                                    </a>
                                    <a href="/student/changestudentpassword" class="dropdown-item flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-blue-50 hover:text-blue-600 rounded-lg">
                                        <i class="bi bi-key-fill dropdown-icon"></i>
                                        Change Password
                                    </a>
                                    <a href="#" class="dropdown-item flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-blue-50 hover:text-blue-600 rounded-lg">
                                        <i class="bi bi-gear-fill dropdown-icon"></i>
                                        Settings
                                    </a>
                                </div>

                               

                                <div class="border-t border-gray-100 mt-2 pt-2 px-4">
                                    <a href="studentlogout" class="dropdown-item flex items-center px-4 py-2 text-sm text-red-600 hover:bg-red-50 hover:text-red-700 rounded-lg">
                                        <i class="bi bi-box-arrow-right dropdown-icon"></i>
                                        Logout
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Mobile menu button -->
                    <div class="md:hidden flex items-center">
                        <button class="outline-none mobile-menu-button p-2 rounded-lg hover:bg-gray-100">
                            <svg class="w-6 h-6 text-gray-600"
                                fill="none" stroke-linecap="round" 
                                stroke-linejoin="round" stroke-width="2" 
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M4 6h16M4 12h16M4 18h16"></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Mobile Menu -->
            <div class="md:hidden mobile-menu hidden bg-white border-t">
                <ul class="px-2 pt-2 pb-4">
                    <li>
                        <a href="#" class="flex items-center px-4 py-2 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg">
                            <i class="bi bi-house-door-fill mr-3"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center px-4 py-2 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg mt-1">
                            <i class="bi bi-briefcase-fill mr-3"></i>
                            Job Listings
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center px-4 py-2 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg mt-1">
                            <i class="bi bi-file-earmark-text-fill mr-3"></i>
                            My Applications
                        </a>
                    </li>
                     <li>
                        <a href="student/available-quizzes" class="nav-link py-2 px-3 font-medium text-gray-600 rounded-lg hover:bg-blue-50 hover:text-blue-600">
    <i class="bi bi-check2-square nav-icon"></i>
    Assessments
</a>

                    </li>
                    <li class="border-t border-gray-100 my-2"></li>
                    <li>
                        <a href="#" class="flex items-center px-4 py-2 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg">
                            <img src="/images/bunny.jpg" class="w-8 h-8 rounded-full mr-3" alt="Profile">
                            <div>
                                <p class="text-sm font-medium">Student Profile</p>
                                <p class="text-xs text-gray-500">student@example.com</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <script>
        // Toggle mobile menu
        const mobileMenuBtn = document.querySelector('.mobile-menu-button');
        const mobileMenu = document.querySelector('.mobile-menu');

        mobileMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });

        // Profile dropdown functionality
        const profileBtn = document.getElementById('profileDropdownBtn');
        const profileDropdown = document.getElementById('profileDropdown');
        const profileDropdownContainer = document.getElementById('profileDropdownContainer');

        profileBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            profileDropdown.classList.toggle('show');
        });

        // Notification dropdown functionality
        const notificationBtn = document.getElementById('notificationBtn');
        const notificationDropdown = document.getElementById('notificationDropdown');

        notificationBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            notificationDropdown.classList.toggle('hidden');
            profileDropdown.classList.remove('show');
        });

        // Close dropdowns when clicking outside
        document.addEventListener('click', (e) => {
            if (!profileDropdownContainer.contains(e.target)) {
                profileDropdown.classList.remove('show');
            }
            if (!notificationBtn.contains(e.target) && !notificationDropdown.contains(e.target)) {
                notificationDropdown.classList.add('hidden');
            }
        });

        // Prevent dropdown from closing when clicking inside it
        notificationDropdown.addEventListener('click', (e) => {
            e.stopPropagation();
        });

        // Add active class to current page link
        const currentLocation = window.location.pathname;
        const navLinks = document.querySelectorAll('.nav-link');
        
        navLinks.forEach(link => {
            if (link.getAttribute('href') === currentLocation) {
                link.classList.add('active');
            }
        });
    </script>
</body>
</html>