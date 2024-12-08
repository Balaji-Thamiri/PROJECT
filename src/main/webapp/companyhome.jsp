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
    <title>Enterprise Dashboard | Placement Portal</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
   <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

    /* Base styles */
    * {
        font-family: 'Inter', sans-serif;
    }

    /* Enhanced card styles with better performance */
    .stat-card {
        --card-border: rgba(255, 255, 255, 0.1);
        --card-bg: rgba(255, 255, 255, 0.95);
        --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        --hover-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        --hover-border: #6366F1;
        
        border: 1px solid var(--card-border);
        background: var(--card-bg);
        backdrop-filter: blur(20px);
        box-shadow: var(--card-shadow);
        transform: translate3d(0, 0, 0);
        transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1),
                    box-shadow 0.3s cubic-bezier(0.4, 0, 0.2, 1),
                    border-color 0.3s ease;
        will-change: transform, box-shadow;
    }

    .stat-card:hover {
        transform: translate3d(0, -5px, 0) scale(1.005);
        box-shadow: var(--hover-shadow);
        border-color: var(--hover-border);
    }

    /* Enhanced gradient background */
    .gradient-bg {
        background: linear-gradient(135deg, #4F46E5 0%, #6366F1 100%);
        position: relative;
        isolation: isolate;
        overflow: hidden;
    }

    .gradient-bg::before {
        content: '';
        position: absolute;
        inset: 0;
        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3z' fill='%234F46E5' fill-opacity='0.1'/%3E%3C/svg%3E");
        opacity: 0.3;
        z-index: -1;
    }

    /* Enhanced dashboard layout */
    .dashboard-container {
        --container-spacing: 4rem;
        margin-top: var(--container-spacing);
        padding-top: calc(var(--container-spacing) / 2);
        position: relative;
        width: 100%;
    }

    /* Enhanced quick action buttons */
    .quick-action-btn {
        --btn-bg: rgba(255, 255, 255, 0.9);
        --btn-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        
        background-color: var(--btn-bg);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
        will-change: transform;
    }

    .quick-action-btn:hover {
        transform: translateY(-2px);
        box-shadow: var(--btn-shadow);
    }

    /* Enhanced stats grid with auto-fit */
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 1.5rem;
        margin: 1.5rem 0;
    }

    /* Enhanced activity items */
    .activity-item {
        --border-color: #6366F1;
        --hover-bg: #F8FAFC;
        
        border-left: 4px solid transparent;
        transition: all 0.3s ease;
        position: relative;
    }

    .activity-item:hover {
        border-left-color: var(--border-color);
        background-color: var(--hover-bg);
    }

    /* Enhanced toast notifications */
    .toastify {
        --toast-padding: 16px 24px;
        --toast-radius: 8px;
        --toast-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        
        font-family: 'Inter', sans-serif;
        padding: var(--toast-padding);
        border-radius: var(--toast-radius);
        font-size: 0.875rem;
        font-weight: 500;
        box-shadow: var(--toast-shadow);
    }

    .toastify.success {
        background: linear-gradient(135deg, #059669 0%, #10B981 100%);
    }

    .toastify.error {
        background: linear-gradient(135deg, #DC2626 0%, #EF4444 100%);
    }

    /* Enhanced toast timer animation */
    .toast-timer {
        position: absolute;
        bottom: 0;
        left: 0;
        height: 3px;
        background-color: rgba(255, 255, 255, 0.7);
        animation: toast-timer 3s linear forwards;
        transform-origin: left;
        will-change: width;
    }

    @keyframes toast-timer {
        to { width: 0%; }
    }

    /* Print styles */
    @media print {
        .stat-card {
            break-inside: avoid;
            page-break-inside: avoid;
        }
        
        .gradient-bg::before {
            display: none;
        }
    }
</style>
</head>
<body class="bg-gray-50">
    <jsp:include page="companynavbar.jsp" />

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Welcome Section -->
        <div class="dashboard-container">
  <div class="relative overflow-hidden rounded-2xl gradient-bg p-8 mb-8" data-aos="fade-up">
    <div class="relative z-10">
      <div class="flex items-center space-x-4 mb-4">
        <div class="h-12 w-12 rounded-full bg-white/20 flex items-center justify-center">
          <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
          </svg>
        </div>
        <div>
          <h1 class="text-3xl font-bold text-white mb-1">Welcome Back, <%= company.getName() %> </h1>
          <p class="text-indigo-100 text-lg">Dashboard Overview</p>
        </div>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mt-6">
        <button
  class="quick-action-btn px-4 py-3 rounded-xl flex items-center space-x-3"
  onclick="window.location.href='/company/postjob';"
>
  <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
  </svg>
  <span class="text-gray-700 font-medium">Post New Job</span>
</button>

        <button class="quick-action-btn px-4 py-3 rounded-xl flex items-center space-x-3"
          onclick="window.location.href='/company/applications';"
        >
          <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
          </svg>
          <span class="text-gray-700 font-medium">View Applications</span>
        </button>
        <button class="quick-action-btn px-4 py-3 rounded-xl flex items-center space-x-3">
          <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
          </svg>
          <span class="text-gray-700 font-medium">Schedule Interviews</span>
        </button>
        <button class="quick-action-btn px-4 py-3 rounded-xl flex items-center space-x-3">
          <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
          </svg>
          <span class="text-gray-700 font-medium">View Analytics</span>
        </button>
      </div>
    </div>
  </div>
</div>

        <!-- Statistics Grid -->
        <div class="stats-grid mb-8">
            <div class="stat-card p-6 rounded-xl" data-aos="fade-up" data-aos-delay="100">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold text-gray-700">Active Jobs</h3>
                    <div class="p-2 bg-indigo-100 rounded-lg">
                        <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                </div>
                <p class="text-3xl font-bold text-gray-900 mb-2">${activeJobCount}</p>
                <div class="flex items-center text-sm">
                </div>
            </div>

            <div class="stat-card p-6 rounded-xl" data-aos="fade-up" data-aos-delay="200">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold text-gray-700">Total Applications</h3>
                    <div class="p-2 bg-emerald-100 rounded-lg">
                        <svg class="w-6 h-6 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                        </svg>
                    </div>
                </div>
                <p class="text-3xl font-bold text-gray-900 mb-2">${totalApplicationsCount}</p>
                <div class="flex items-center text-sm">
                </div>
            </div>

            <div class="stat-card p-6 rounded-xl" data-aos="fade-up" data-aos-delay="300">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold text-gray-700">Interviews Scheduled</h3>
                    <div class="p-2 bg-violet-100 rounded-lg">
                        <svg class="w-6 h-6 text-violet-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                </div>
                <p class="text-3xl font-bold text-gray-900 mb-2">${tis}</p>
                <div class="flex items-center text-sm">
                </div>
            </div>

            <div class="stat-card p-6 rounded-xl" data-aos="fade-up" data-aos-delay="400">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold text-gray-700">Hire Rate</h3>
                    <div class="p-2 bg-amber-100 rounded-lg">
                        <svg class="w-6 h-6 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>
                        </svg>
                    </div>
                </div>
                <p class="text-3xl font-bold text-gray-900 mb-2">88%</p>
                <div class="flex items-center text-sm">
                </div>
            </div>
        </div>
        
        <div class="container mx-auto mt-4">
<h1 align="center" style="font-size: 2rem; font-weight: bold; color: #333;">Analytics Graph</h1>
    <canvas id="jobTrendsChart" class="w-full h-64"></canvas>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const ctx = document.getElementById('jobTrendsChart').getContext('2d');
        
        // Calculate the max value to determine appropriate scale
        const dataValues = [${activeJobCount}, ${totalApplicationsCount}, ${tis}];
        const maxValue = Math.max(...dataValues);
        
        // Determine the appropriate max for y-axis (rounded up to nearest 10)
        const yAxisMax = Math.ceil(maxValue / 10) * 10 + 10;

        // Custom gradient backgrounds
        const gradient1 = ctx.createLinearGradient(0, 0, 0, 400);
        gradient1.addColorStop(0, 'rgba(54, 162, 235, 0.7)');
        gradient1.addColorStop(1, 'rgba(54, 162, 235, 0.2)');

        const gradient2 = ctx.createLinearGradient(0, 0, 0, 400);
        gradient2.addColorStop(0, 'rgba(75, 192, 192, 0.7)');
        gradient2.addColorStop(1, 'rgba(75, 192, 192, 0.2)');

        const gradient3 = ctx.createLinearGradient(0, 0, 0, 400);
        gradient3.addColorStop(0, 'rgba(255, 206, 86, 0.7)');
        gradient3.addColorStop(1, 'rgba(255, 206, 86, 0.2)');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Active Jobs', 'Total Applications', 'Interviews Scheduled'],
                datasets: [{
                    label: 'Company Metrics',
                    data: [${activeJobCount}, ${totalApplicationsCount}, ${tis}],
                    backgroundColor: [gradient1, gradient2, gradient3],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 2,
                    borderRadius: 10,
                    borderSkipped: false,
                    barThickness: 50,
                    hoverBackgroundColor: [
                        'rgba(54, 162, 235, 0.9)',
                        'rgba(75, 192, 192, 0.9)',
                        'rgba(255, 206, 86, 0.9)'
                    ]
                }]
            },
            options: {
                responsive: true,
                layout: {
                    padding: {
                        top: 20,
                        bottom: 20
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        max: yAxisMax,
                        ticks: {
                            stepSize: 5,
                            color: '#6B7280',
                            font: {
                                weight: 'bold'
                            }
                        },
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)',
                            borderDash: [5, 5]
                        },
                        title: {
                            display: true,
                            text: 'Number of Items',
                            color: '#4B5563',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            color: '#4B5563',
                            font: {
                                weight: 'bold'
                            }
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: 'white',
                        bodyColor: 'white',
                        cornerRadius: 8,
                        padding: 12
                    },
                    title: {
                        display: true,
                        text: 'Company Performance Metrics',
                        color: '#1F2937',
                        font: {
                            size: 18,
                            weight: 'bold'
                        }
                    },
                    legend: {
                        display: false
                    }
                },
                animation: {
                    duration: 1500,
                    easing: 'easeOutQuart'
                }
            }
        });
    });
</script>



       
            </div>
     
 <jsp:include page="companyfooter.jsp" />
    <script>
        // Initialize AOS
        AOS.init({
            duration: 800,
            once: true,
            offset: 100
        });

        
        // Toast Notifications
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
                showToast("Company Login successful!", "success");
            }
        }
    </script>
    <!-- Add this script for the charts -->
<script>
    // Initialize AOS with slightly different delays for smooth loading
    document.addEventListener('DOMContentLoaded', function() {
        const elements = document.querySelectorAll('[data-aos]');
        elements.forEach((element, index) => {
            element.setAttribute('data-aos-delay', (index * 100).toString());
        });
    });
</script>
    
</body>
</html>