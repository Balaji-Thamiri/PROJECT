<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Admin admin = (Admin) session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="/css/admindashboard.css">
<!-- Required CSS -->
  <link rel="icon" href="/images/SUPERSET.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts/dist/apexcharts.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</head>
<body>
<jsp:include page="adminheader.jsp" />
<jsp:include page="adminnavbar.jsp" />
    <div class="dashboard-container">
   <h3 style="text-align: center; font-weight: bold; font-size: 36px; color: #5DADE2;">
    Welcome Back! <%= admin.getEmail().substring(0, 1).toUpperCase() + admin.getEmail().substring(1, admin.getEmail().indexOf('@')).toLowerCase() %> 
</h3>


    
        <div class="dashboard-grid">
            <!-- Stats Cards -->
            <div class="card stats-card animate-fade-in">
                <div class="stats-icon" style="background: rgba(59, 130, 246, 0.1); color: var(--accent-light);">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stats-info">
                    <h3><c:out value="${count}"/></h3>
                  <p><b>Total Students</b></p>
                </div>
            </div>

            <div class="card stats-card animate-fade-in" style="animation-delay: 0.1s;">
                <div class="stats-icon" style="background: rgba(34, 197, 94, 0.1); color: var(--success-light);">
                    <i class="fas fa-building"></i>
                </div>
                <div class="stats-info">
                    <h3><c:out value="${ccount}"/></h3>
                   <p><b>Partner Companies</b></p>
                </div>
            </div>

           <div class="card stats-card animate-fade-in" style="animation-delay: 0.2s;">
    <div class="stats-icon" style="background: rgba(34, 197, 94, 0.1); color: var(--success-light);">
        <i class="fas fa-briefcase"></i>
    </div>
    <div class="stats-info">
       <h3><c:out value="${jcount}"/></h3>
        <p><b>Jobs</b></p>
    </div>
</div>


            <div class="card stats-card animate-fade-in" style="animation-delay: 0.3s;">
                <div class="stats-icon" style="background: rgba(239, 68, 68, 0.1); color: var(--danger-light);">
<i class="fas fa-users"></i>
                </div>
                <div class="stats-info">
   <h3><c:out value="${pcount}"/></h3>                   
   <p><b>Students Placed</b></p>
                </div>
            </div>

           <div class="dashboard-chart card">
    <div class="chart-header">
        <h3 class="chart-title">Dashboard Metrics</h3>
    </div>
    <div class="chart-container">
        <div>
            <canvas id="mainMetricsChart"></canvas>
        </div>
        <div>
            <canvas id="placementRateChart"></canvas>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Color Palette
        const colors = {
            primary: 'rgba(59, 130, 246, 0.6)',
            success: 'rgba(34, 197, 94, 0.6)',
            warning: 'rgba(245, 158, 11, 0.6)',
            danger: 'rgba(239, 68, 68, 0.6)'
        };

        // Main Metrics Bar Chart
        var ctxMain = document.getElementById('mainMetricsChart').getContext('2d');
        var mainChart = new Chart(ctxMain, {
            type: 'bar',
            data: {
                labels: ['Students', 'Companies', 'Jobs'],
                datasets: [{
                    label: 'Dashboard Metrics',
                    data: [${count}, ${ccount}, ${jcount}],
                    backgroundColor: [
                        colors.primary, 
                        colors.success, 
                        colors.warning
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Count'
                        }
                    }
                },
                plugins: {
                    title: {
                        display: true,
                        text: 'Key Metrics',
                        font: {
                            size: 16
                        }
                    },
                    legend: {
                        display: false
                    }
                }
            }
        });

     // Placement Rate Doughnut Chart
        var ctxPlacement = document.getElementById('placementRateChart').getContext('2d');
        var placementChart = new Chart(ctxPlacement, {
            type: 'doughnut',
            data: {
                labels: ['Placed', 'Unplaced'],
                datasets: [{
                    data: [85, 15], // Static data
                    backgroundColor: [
                        '#28a745',  // Green for placed
                        '#dc3545'   // Red for unplaced
                    ]
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '60%',
                plugins: {
                    title: {
                        display: true,
                        text: 'Placement Rate',
                        font: {
                            size: 16
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                // Static tooltip content
                                if (context.label === 'Placed') {
                                    return 'Placed: 85% (85%)';
                                } else if (context.label === 'Unplaced') {
                                    return 'Unplaced: 15% (15%)';
                                }
                            }
                        }
                    }
                }
            }
        });
    });
</script>


            

    
    
       
    

    <!-- Required JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.0/apexcharts.min.js"></script>
    
    <script>
        
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
            const succ = urlParams.get('succ');
            const error = urlParams.get('error');

            if (success) {
                showToast("Admin Login successful!", "success");
            } else if (error) {
                showToast("Login failed. Please try again.", "error");
            }
            else if (succ) {
            	showToast("Admin Profile Update successful!", "succ");
            }
        }
    </script>

</body>
</html>
                        