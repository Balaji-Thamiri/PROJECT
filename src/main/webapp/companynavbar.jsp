<%@page import="com.klef.jfsd.springboot.model.Company"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Company company = (Company) session.getAttribute("company");
if(company==null)
{
	response.sendRedirect("companysessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .card {
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        /* Profile Dropdown Styles */
        .profile-dropdown {
            position: relative;
            display: inline-block;
        }
        
        .profile-dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            top: 100%;
            background-color: white;
            min-width: 200px;
            border-radius: 0.5rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            z-index: 50;
        }
        
        .profile-dropdown-content.show {
            display: block;
        }
        
        .dropdown-link {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            color: #4a5568;
            text-decoration: none;
            transition: all 0.2s;
        }
        
        .dropdown-link i {
            margin-right: 8px;
        }

        .dropdown-link:hover {
            background-color: #f7fafc;
            color: #2b6cb0;
        }

        /* Mobile Menu Styles */
        .mobile-menu {
            display: none;
        }

        .mobile-menu.show {
            display: block;
        }

        @media (max-width: 768px) {
            .desktop-menu {
                display: none;
            }
        }
    </style>
</head>
<body>
   <nav class="bg-white shadow-lg fixed top-0 left-0 w-full z-50">
    <div class="max-w-7xl mx-auto px-4">
        <div class="flex justify-between items-center">
            <div class="flex items-center space-x-7">
                <!-- Logo -->
                <a href="companyhome" class="flex items-center py-4 px-2">
    <img src="/images/rsm.png" alt="Logo" class="h-16" style="width: 190px;" class="mr-2">
</a>
            </div>
            
            <!-- Desktop Menu -->
            <div class="hidden md:flex items-center space-x-4 desktop-menu">
                <a href="companyhome" class="py-2 px-4 font-medium text-gray-700 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                    <i class="fas fa-tachometer-alt mr-2"></i>Dashboard
                </a>
                <a href="/company/viewjobs" class="py-2 px-4 font-medium text-gray-700 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                    <i class="fas fa-briefcase mr-2"></i>Manage Jobs
                </a>
                <a href="/company/applications" class="py-2 px-4 font-medium text-gray-700 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                    <i class="fas fa-file-alt mr-2"></i>Applications
                </a>
                <a href="/company/view-quizzes" class="py-2 px-4 font-medium text-gray-700 rounded hover:bg-blue-500 hover:text-white transition duration-300">
    <i class="fas fa-tasks mr-2"></i>Manage Tests
</a>
                
                
                <!-- Profile Dropdown -->
                <div class="profile-dropdown">
                    <img src="data:${company.imageType};base64,${company.base64Image}"
                         class="w-14 h-14 rounded-full border-2 border-white cursor-pointer hover:opacity-90 transition-opacity" 
                         alt="Profile Image" 
                         id="profileDropdownBtn">
                    
                    <div class="profile-dropdown-content" id="profileDropdown">
                        <a href="/company/profile" class="dropdown-link"><i class="fas fa-user"></i>View Profile</a>
                        <a href="/company/changecompanypassword" class="dropdown-link"><i class="fas fa-key"></i>Change Password</a>
                    </div>
                </div>
                
                <a href="/company/companylogout" class="py-2 px-4 font-medium text-white bg-blue-500 rounded hover:bg-blue-400 transition duration-300">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
            
            <!-- Mobile Menu Button -->
            <div class="md:hidden flex items-center">
                <button class="outline-none mobile-menu-button" type="button">
                    <svg class="w-6 h-6 text-gray-500 hover:text-blue-500"
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
    <div class="mobile-menu md:hidden">
        <a href="companyhome" class="block py-2 px-4 text-sm hover:bg-gray-200">
            <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
        </a>
        <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-200">
            <i class="fas fa-briefcase mr-2"></i> Manage Jobs
        </a>
        <a href="#" class="block py-2 px-4 text-sm hover:bg-gray-200">
            <i class="fas fa-file-alt mr-2"></i> Applications
        </a>
        <div class="p-4">
            <img src="/images/bunny.jpg" class="w-12 h-12 rounded-full cursor-pointer mb-2" alt="Profile Image" id="mobileProfileBtn">
            <div class="hidden bg-gray-100 rounded-lg" id="mobileProfileDropdown">
                <a href="/company/profile" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200">
                    <i class="fas fa-user mr-2"></i> View Profile
                </a>
                <a href="/company/changecompanypassword" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200">
                    <i class="fas fa-key mr-2"></i> Change Password
                </a>
            </div>
        </div>
        <a href="/company/companylogout" class="block py-2 px-4 text-sm text-white bg-blue-500 hover:bg-blue-400">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>
</nav>
   

    <script>
        // Profile Dropdown Toggle
        const profileBtn = document.getElementById('profileDropdownBtn');
        const profileDropdown = document.getElementById('profileDropdown');
        
        profileBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            profileDropdown.classList.toggle('show');
        });

        // Mobile Menu Toggle
        const mobileMenuBtn = document.querySelector('.mobile-menu-button');
        const mobileMenu = document.querySelector('.mobile-menu');
        
        mobileMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('show');
        });

        // Mobile Profile Toggle
        const mobileProfileBtn = document.getElementById('mobileProfileBtn');
        const mobileProfileDropdown = document.getElementById('mobileProfileDropdown');
        
        mobileProfileBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            mobileProfileDropdown.classList.toggle('hidden');
        });

        // Close dropdowns when clicking outside
        document.addEventListener('click', (e) => {
            if (!profileBtn.contains(e.target) && !profileDropdown.contains(e.target)) {
                profileDropdown.classList.remove('show');
            }
            
            if (!mobileProfileBtn.contains(e.target) && !mobileProfileDropdown.contains(e.target)) {
                mobileProfileDropdown.classList.add('hidden');
            }
        });
    </script>
</body>
</html>
