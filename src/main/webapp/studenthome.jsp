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
    <title>Student Home - Placement Portal</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
         :root {
            --primary: #4f46e5;
            --primary-dark: #4338ca;
            --secondary: #6366f1;
            --accent: #818cf8;
            --success: #22c55e;
            --warning: #f59e0b;
            --danger: #ef4444;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            color: #1e293b;
        }

        /* Modern Header */
        .hero-section {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            min-height: 60vh;
            position: relative;
            overflow: hidden;
            padding: 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
             margin-top: 80px;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="50" fill="white" opacity="0.1"/></svg>') 0 0/50px 50px;
            animation: move-bg 20s linear infinite;
        }

        @keyframes move-bg {
            0% { background-position: 0 0; }
            100% { background-position: 100px 100px; }
        }

        .hero-content {
            text-align: center;
            color: white;
            position: relative;
            z-index: 1;
            max-width: 800px;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            line-height: 1.2;
            white-space: nowrap;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            opacity: 0.9;
            margin-bottom: 2rem;
        }

        /* Quick Stats Section */
        .stats-section {
            margin-top: -4rem;
            padding: 0 2rem;
            position: relative;
            z-index: 2;
        }

        .stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 1.5rem;
    max-width: 1200px;
    margin: 0 auto;
}

.stat-card {
    background: white;
    border-radius: 1rem;
    padding: 1.5rem;
    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1);
    text-align: center;
    transition: transform 0.3s ease;
}

.stat-card:hover {
    transform: translateY(-5px);
}

.stat-icon {
    font-size: 2.5rem; /* Icon size */
    color: var(--primary); /* Use primary color or any other color */
    margin-bottom: 0.5rem;
}

.stat-value {
    font-size: 2.5rem;
    font-weight: 700;
    color: var(--primary);
    margin-bottom: 0.5rem;
}

.stat-label {
    color: #64748b;
    font-size: 1.2rem; /* Increased font size */
    font-weight: bold; /* Makes the text bold */
}



        /* Main Content Section */
        .main-content {
            max-width: 1200px;
            margin: 4rem auto;
            padding: 0 2rem;
        }

        .section-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 4px;
            background: var(--primary);
            border-radius: 2px;
        }

        /* Card Grid */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 4rem;
        }

        .feature-card {
            background: white;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1);
        }

        .card-image {
            height: 200px;
            overflow: hidden;
        }

        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .feature-card:hover .card-image img {
            transform: scale(1.1);
        }

        .card-content {
            padding: 1.5rem;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .card-info {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
            color: #64748b;
        }

        .card-info i {
            width: 20px;
            margin-right: 0.5rem;
            color: var(--primary);
        }

        .action-button {
            display: inline-block;
            background: var(--primary);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            width: 100%;
            text-align: center;
            margin-top: 1rem;
        }

        .action-button:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }

            .stats-section {
                margin-top: -2rem;
            }

            .section-title {
                font-size: 1.75rem;
            }
        }
           .toastify {
            font-family: 'Inter', sans-serif;
            padding: 16px 24px;
            color: #ffffff;
            border-radius: 8px;
            font-size: 0.875rem;
            font-weight: 500;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .toastify.success {
            background: linear-gradient(135deg, #059669 0%, #10B981 100%);
        }

        .toastify.error {
            background: linear-gradient(135deg, #DC2626 0%, #EF4444 100%);
        }

        .toast-timer {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 3px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.7);
            animation: toast-timer 3s linear forwards;
        }

        @keyframes toast-timer {
            from { width: 100%; }
            to { width: 0%; }
        }
        
       .preparation-materials {
            background-color: #f0f4f8;
            padding: 3rem 1.5rem;
        }
    .card-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 2rem;
    }

   /* Main section styling */
.preparation-materials {
    background-color: #f0f4f8;
    padding: 3rem 1.5rem;
    width: 100%;
    margin: 0 auto;
}

/* Container styles */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
}

/* Section title styling */
.section-title {
    font-size: 2.5rem;
    font-weight: 700;
    color: #1e293b;
    margin-bottom: 2.5rem;
    position: relative;
    display: inline-block;
}

.section-title:after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 60px;
    height: 4px;
    background-color: #4f46e5;
}

/* Card grid layout */
.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 2rem;
    margin-top: 2rem;
}

/* Individual card styling */
.preparation-card {
    background: white;
    border-radius: 1rem;
    padding: 2rem;
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    transition: all 0.3s ease;
    height: 100%;
}

.preparation-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

/* Icon styles */
.preparation-icon {
    font-size: 2.5rem;
    color: #4f46e5;
    margin-bottom: 1rem;
}

/* Content area styling */
.preparation-content {
    flex-grow: 1;
}

.preparation-title {
    font-size: 1.5rem;
    font-weight: 600;
    color: #1e293b;
    margin-bottom: 0.75rem;
}

.preparation-description {
    color: #64748b;
    line-height: 1.6;
    margin-bottom: 1.5rem;
    font-size: 1rem;
}

/* Download button styling */
.download-button {
    background-color: #4f46e5;
    color: white;
    padding: 0.75rem 1.5rem;
    border-radius: 0.5rem;
    text-decoration: none;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.2s ease;
    border: none;
    cursor: pointer;
}

.download-button:hover {
    background-color: #4338ca;
    transform: translateY(-2px);
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .card-grid {
        grid-template-columns: 1fr;
    }

    .preparation-card {
        padding: 1.5rem;
    }

    .section-title {
        font-size: 2rem;
    }
}

  
    </style>
</head>
<jsp:include page="studentnavbar.jsp" />
<body>
    <header class="hero-section">
        <div class="hero-content">
            <h1 class="hero-title">Your Gateway to Career Success</h1>
            <p class="hero-subtitle">Discover opportunities, connect with top companies, and build your future</p>
<button class="action-button" onclick="location.href='/student/viewalljobs';">Explore Opportunities</button>
        </div>
    </header>

  <section class="stats-section">
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon">
                <i class="bi bi-briefcase-fill"></i> <!-- Job icon -->
            </div>
            <div class="stat-value"><c:out value="${jc}"/></div>
            <div class="stat-label">Job Opportunities</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">
                <i class="bi bi-building"></i> <!-- Partner companies icon -->
            </div>
            <div class="stat-value"><c:out value="${cc}"/></div>
            <div class="stat-label">Partner Companies</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">
                <i class="bi bi-graph-up-arrow"></i> <!-- Success rate icon -->
            </div>
            <div class="stat-value">95%</div>
            <div class="stat-label">Success Rate</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">
                <i class="bi bi-people-fill"></i> <!-- Active students icon -->
            </div>
           <div class="stat-value"><c:out value="${acceptedcount}"/></div>
            <div class="stat-label">Active Students</div>
        </div>
    </div>
</section>

    <main class="main-content">
        <section>
            <h2 class="section-title">Featured Opportunities</h2>
           <div class="card-grid">
    <c:forEach var="jobPosting" items="${topJobs}" varStatus="status" begin="0" end="2">
        <div class="feature-card">
            <div class="card-image">
                <img src="data:${jobPosting.company.imageType};base64,${jobPosting.company.base64Image}" 
                     alt="${jobPosting.company.name}">
            </div>
            <div class="card-content">
                <h3 class="card-title">${jobPosting.jobTitle}</h3>
                <div class="card-info">
                    <i class="fas fa-building"></i>
                    <span>${jobPosting.company.name}</span>
                </div>
                <div class="card-info">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>${jobPosting.jobLocation}</span>
                </div>
                <div class="card-info">
                    <i class="fas fa-money-bill-wave"></i>
                    <span>${jobPosting.salaryRange}</span>
                </div>
 <button 
    onclick="location.href='/student/apply/${jobPosting.jobId}'"
    class="px-6 py-3 bg-gradient-to-r from-blue-500 to-blue-700 text-white font-semibold rounded-lg shadow-lg hover:shadow-xl transform transition-all duration-300 hover:scale-105 focus:ring focus:ring-offset-2 focus:ring-blue-300">
    Apply Now
</button>
      
    </div>
        </div>
    </c:forEach>
</div>

                

            <h2 class="section-title">Upcoming Events</h2>
            <div class="card-grid">
                <div class="feature-card">
                    <div class="card-image">
                        <img src="/images/vt.jpeg" alt="Career Fair">
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Virtual Career Fair</h3>
                        <div class="card-info">
                            <i class="fas fa-calendar"></i>
                            <span>November 15, 2024</span>
                        </div>
                        <div class="card-info">
                            <i class="fas fa-clock"></i>
                            <span>10:00 AM - 4:00 PM</span>
                        </div>
                        <div class="card-info">
                            <i class="fas fa-users"></i>
                            <span>50+ Companies</span>
                        </div>
                        <button class="action-button" onclick="window.location.href='/student/eventreg';">
    Register Now
</button>
                    </div>
                </div>

                <div class="feature-card">
                    <div class="card-image">
                        <img src="/images/rs.png" alt="Workshop">
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Resume Building Workshop</h3>
                        <div class="card-info">
                            <i class="fas fa-calendar"></i>
                            <span>November 20, 2024</span>
                        </div>
                        <div class="card-info">
                            <i class="fas fa-clock"></i>
                            <span>2:00 PM - 4:00 PM</span>
                        </div>
                        <div class="card-info">
                            <i class="fas fa-chalkboard-teacher"></i>
                            <span>Expert Session</span>
                        </div>
                        <button class="action-button" onclick="window.location.href='/student/eventreg';">
    Register Now
</button>
                    </div>
                </div>

                <div class="feature-card">
                    <div class="card-image">
                        <img src="/images/mok.avif" alt="Mock Interview">
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Mock Interview Drive</h3>
                        <div class="card-info">
                            <i class="fas fa-calendar"></i>
                            <span>November 25, 2024</span>
                        </div>
                        <div class="card-info">
                            <i class="fas fa-clock"></i>
                            <span>9:00 AM - 5:00 PM</span>
                        </div>
                        <div class="card-info">
                            <i class="fas fa-user-tie"></i>
                            <span>Industry Experts</span>
                        </div>
                       <button class="action-button" onclick="window.location.href='/student/eventreg';">
    Register Now
</button>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- New Placement Preparation Materials Section -->
   <!-- New Placement Preparation Materials Section -->
<section class="preparation-materials">
    <div class="container">
        <h2 class="section-title">Placement Preparation Materials</h2>
        <div class="card-grid">
            <!-- Resume Building Guide Card -->
            <div class="preparation-card">
                <div class="preparation-icon">
                    <i class="fas fa-file-alt"></i>
                </div>
                <div class="preparation-content">
                    <h3 class="preparation-title">Resume Building Guide</h3>
                    <p class="preparation-description">
                        Comprehensive guide to creating a standout resume for placements.
                    </p>
                </div>
                <a href="https://assets.ctfassets.net/zqmhp5i8t0xx/1K3FXxbYnmySsUkEOggyIQ/fa2e358dbf4c77e028bdd59ba752fd0b/ResumeBook.pdf" class="download-button">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>

            <!-- Interview Preparation Ebook Card -->
            <div class="preparation-card">
                <div class="preparation-icon">
                    <i class="fas fa-book"></i>
                </div>
                <div class="preparation-content">
                    <h3 class="preparation-title">Interview Preparation Ebook</h3>
                    <p class="preparation-description">
                        Essential tips, common questions, and interview strategies.
                    </p>
                </div>
                <a href="https://www.csuci.edu/careerdevelopment/services/documents/interviewhandbook.pdf" class="download-button">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>

            <!-- Coding Interview Handbook Card -->
            <div class="preparation-card">
                <div class="preparation-icon">
                    <i class="fas fa-laptop-code"></i>
                </div>
                <div class="preparation-content">
                    <h3 class="preparation-title">Coding Interview Handbook</h3>
                    <p class="preparation-description">
                        Programming concepts, data structures, and coding challenge solutions.
                    </p>
                </div>
                <a href="https://cdn.cdo.mit.edu/wp-content/uploads/sites/67/2021/01/MBAn-Technical-Interview-Skills-Training-Workshop-Part-1-with-Jack-Dunn-Daisy-Zhou-Slides.pdf" class="download-button">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
        </div>
    </div>
</section>
    </main>
</body>

    <jsp:include page="studentfooter.jsp" />
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
                showToast("Student Login successful!", "success");
            }
        }
   </script>
</body>
</html>
    