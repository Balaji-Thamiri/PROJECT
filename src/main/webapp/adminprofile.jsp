<%@ page import="com.klef.jfsd.springboot.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("adminsessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="/images/SUPERSET.png">
    <title>Admin Profile</title>
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <style>
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
       :root {
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --text-dark: #2c3e50;
    --text-light: #34495e;
    --background-light: #f4f6f7;
    --background-dark: #ecf0f1;
    --card-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

body {
    font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
    background-color: var(--background-light);
    background-attachment: fixed;
    background-size: cover;
    background-position: center 90%; /* Adjusts the vertical position */
    line-height: 1.6;
    color: var(--text-dark);
    margin: 0;
    padding: 0;
    min-height: 100vh;
}


.admin-profile-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 2rem;
    background: linear-gradient(135deg, var(--background-light) 0%, var(--background-dark) 100%);
}

.profile-container {
    width: 100%;
    max-width: 600px;
    background-color: white;
    border-radius: 16px;
    box-shadow: var(--card-shadow);
    overflow: hidden;
    transition: all 0.3s ease;
}

.profile-header {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    text-align: center;
    padding: 2rem;
    position: relative;
}

.admin-profile-title {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 1rem;
}

.profile-photo-container {
    width: 150px;
    height: 150px;
    margin: 0 auto 1rem;
    border-radius: 50%;
    border: 4px solid white;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.profile-photo {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.info-container {
    padding: 2rem;
    background-color: #f9f9f9;
}

.info-item {
    display: flex;
    align-items: center;
    margin-bottom: 1rem;
    padding: 1rem;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
}

.info-item:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.info-item i {
    margin-right: 1rem;
    color: var(--primary-color);
    font-size: 1.5rem;
    width: 40px;
    text-align: center;
}

.info-item b {
    min-width: 100px;
    color: var(--text-dark);
    font-weight: 600;
    margin-right: 1rem;
}

.info-item span {
    color: var(--text-light);
    flex-grow: 1;
}

.edit-profile-btn {
    display: block;
    width: max-content;
    margin: 2rem auto;
    padding: 0.75rem 1.5rem;
    background: var(--primary-color);
    color: white;
    text-decoration: none;
    border-radius: 50px;
    font-weight: 600;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.edit-profile-btn:hover {
    background: var(--secondary-color);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .admin-profile-wrapper {
        padding: 1rem;
    }

    .profile-container {
        max-width: 100%;
        margin: 0;
    }

    .info-item {
        flex-direction: column;
        text-align: center;
    }

    .info-item i {
        margin-bottom: 0.5rem;
        margin-right: 0;
    }
}

/* Dark Mode */
@media (prefers-color-scheme: dark) {
    body {
        background-color: #121212;
        color: #e0e0e0;
    }

    .profile-container {
        background-color: #1e1e1e;
    }

    .info-container {
        background-color: #2a2a2a;
    }

    .info-item {
        background-color: #2f2f2f;
        color: #e0e0e0;
    }

    .info-item b {
        color: #f0f0f0;
    }

    .info-item span {
        color: #c0c0c0;
    }
}
    </style>
</head>
<body class="light-mode">
    <jsp:include page="adminheader.jsp" />
    <%@include file="adminnavbar.jsp" %>

    <div class="admin-profile-wrapper">
        <div class="profile-container">
            <div class="profile-header">
               <h1 class="admin-profile-title" >
    <i class="bi-person-workspace"></i> <!-- New icon suggestion -->
    ADMIN PROFILE
</h1>
                <div class="profile-photo-container">
                    <img src="/images/addr.jpg" 
                         alt="Admin Profile Photo" 
                         class="profile-photo">
                </div>
            </div>

            <div class="info-container">
            <div class="info-item">
                     <i class="bi bi-person-fill"></i>
                    <b>Name:</b>
                   <span>
    <%= admin != null ? 
        admin.getEmail().split("@")[0].substring(0, 1).toUpperCase() + 
        admin.getEmail().split("@")[0].substring(1) : 
        "N/A" 
    %>
</span>
                </div>
                <div class="info-item">
                    <i class="bi bi-envelope-fill"></i>
                    <b>Email:</b>
                    <span><%= admin != null ? admin.getEmail() : "N/A" %></span>
                </div>
                <div class="info-item">
                    <i class="bi bi-key-fill"></i>
                    <b>Password:</b>
                    <span>••••••••</span>
                </div>
            </div>

          <div class="text-center" style="display: flex; justify-content: center;">
    <a href="adminprofileupdate" class="edit-profile-btn">
        <i class="bi bi-pencil-square"></i>
        Edit Profile
    </a>
</div>
        </div>
    </div>

    <script>
        // Add script to toggle collapsed class based on navbar state
        const navbar = document.querySelector('.navbar');
        const profileWrapper = document.querySelector('.admin-profile-wrapper');
        
        // Initial check
        if (navbar.classList.contains('collapsed')) {
            profileWrapper.classList.add('collapsed');
        }

        // Observer for navbar changes
        const observer = new MutationObserver(mutations => {
            mutations.forEach(mutation => {
                if (mutation.attributeName === 'class') {
                    if (navbar.classList.contains('collapsed')) {
                        profileWrapper.classList.add('collapsed');
                    } else {
                        profileWrapper.classList.remove('collapsed');
                    }
                }
            });
        });

        observer.observe(navbar, { attributes: true });
        
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
                showToast("Admin Profile Update Sucess!", "success");
            } else if (error) {
                showToast("Update failed. Please try again.", "error");
            }
        }
    </script>
</body>
</html>