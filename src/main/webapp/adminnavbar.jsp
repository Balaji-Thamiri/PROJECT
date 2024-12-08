<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Advanced Admin Dashboard Navbar</title>

<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <link rel="stylesheet" href="/css/adminnavbar.css">
    

<script>
    function toggleNavbar() {
        const navbar = document.querySelector('.navbar');
        const content = document.querySelector('.content');
        const toggle = document.querySelector('.navbar-toggle i');
        
        navbar.classList.toggle('collapsed');
        content.classList.toggle('collapsed');
        
        if (navbar.classList.contains('collapsed')) {
            toggle.classList.remove('fa-chevron-left');
            toggle.classList.add('fa-chevron-right');
        } else {
            toggle.classList.remove('fa-chevron-right');
            toggle.classList.add('fa-chevron-left');
        }
        
        localStorage.setItem('navbarCollapsed', navbar.classList.contains('collapsed'));
    }

    function toggleTheme() {
        const body = document.body;
        if (body.classList.contains('light-mode')) {
            body.classList.remove('light-mode');
            body.classList.add('dark-mode');
            localStorage.setItem('theme', 'dark');
        } else {
            body.classList.remove('dark-mode');
            body.classList.add('light-mode');
            localStorage.setItem('theme', 'light');
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        const savedTheme = localStorage.getItem('theme');
        const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        
        if (savedTheme) {
            document.body.classList.add(`${savedTheme}-mode`);
        } else {
            document.body.classList.add(prefersDark ? 'dark-mode' : 'light-mode');
        }
        
        const navbarCollapsed = localStorage.getItem('navbarCollapsed') === 'true';
        if (navbarCollapsed) {
            const navbar = document.querySelector('.navbar');
            const content = document.querySelector('.content');
            const toggle = document.querySelector('.navbar-toggle i');
            
            navbar.classList.add('collapsed');
            content.classList.add('collapsed');
            toggle.classList.remove('fa-chevron-left');
            toggle.classList.add('fa-chevron-right');
        }
    });
</script>
</head>
<body class="light-mode">
    <nav class="navbar">
        <button class="navbar-toggle" onclick="toggleNavbar()">
            <i class="fas fa-chevron-left"></i>
        </button>
        <br>
        <br>
        <br>
        <br>
        <br>
        <ul>
            <li><a href="/admin/home" class="active">
                <i class="fas fa-home"></i>
                <span class="nav-item">Dashboard</span>
                <span class="status-indicator"></span>
            </a></li>
            <li><a href="/admin/viewallstudents">
                <i class="fas fa-user-graduate"></i>
                <span class="nav-item">Students</span>
            </a></li>
            <li><a href="/admin/viewallcompanies">
                <i class="fas fa-building"></i>
                <span class="nav-item">Companies</span>
            </a></li>
            <li><a href="/admin/viewalljobs">
                <i class="fas fa-briefcase"></i>
                <span class="nav-item">Jobs</span>
            </a></li>
            <li><a href="adminprofileupdate">
                <i class="fas fa-user"></i>
                <span class="nav-item">Update Password</span>
            </a></li>
            <li><a href="adminlogout" class="logout">
                <i class="fas fa-sign-out-alt"></i>
                <span class="nav-item">Logout</span>
            </a></li>
        </ul>
    </nav>
    <div class="content">
        <!-- Content goes here -->
    </div>
</body>
</html>