<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if(admin==null) {
    response.sendRedirect("adminsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Postings Dashboard</title>
    <link rel="stylesheet" href="/css/viewalljobs.css">
    <link rel="icon" href="/images/SUPERSET.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.12.0/cdn.min.js" defer></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</head>
<body>
    <jsp:include page="adminheader.jsp" />
    <jsp:include page="adminnavbar.jsp" />

    <main>
        <div class="dashboard-container">
            <!-- Header with Glass Morphism -->
            <div class="header glass-morphism">
                <div class="header-content">
                    <div class="header-title">
                        <div class="title-icon-wrapper">
                            <i class="fas fa-briefcase pulse"></i>
                        </div>
                        <h1 align="center">Job Postings Dashboard</h1>
                    </div>
                    <div class="header-stats">
                        <div class="stat-card glass-card">
                            <div class="stat-icon">
                                <i class="fas fa-briefcase"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${totalJobs}"/></span>
                                <span class="stat-label">Total Jobs</span>
                            </div>
                            <div class="stat-progress"></div>
                        </div>
                        <div class="stat-card glass-card">
                            <div class="stat-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${activeJobs}"/></span>
                                <span class="stat-label">Active Jobs</span>
                            </div>
                            <div class="stat-progress"></div>
                        </div>
                        <div class="stat-card glass-card">
                            <div class="stat-icon">
                                <i class="fas fa-building"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${totalCompanies}"/></span>
                                <span class="stat-label">Partner Companies</span>
                            </div>
                            <div class="stat-progress"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search and Controls -->
            <div class="controls-container glass-morphism">
                <div class="search-container">
                    <div class="search-wrapper">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" 
                               class="search-bar" 
                               placeholder="Search jobs by title, company, or location..."
                               id="jobSearch">
                    </div>
                </div>
            </div>

            <!-- Table with Glass Morphism -->
            <div class="table-container glass-morphism">
                <table class="job-table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-briefcase"></i> Job Title</th>
                            <th><i class="fas fa-building"></i> Company</th>
                            <th><i class="fas fa-map-marker-alt"></i> Location</th>
                            <th><i class="fas fa-calendar"></i> Posted Date</th>
                            <th><i class="fas fa-clock"></i> Last Date</th>
                            <th><i class="fas fa-money-bill-wave"></i> Salary Range</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="job" items="${jobs}">
                            <tr class="job-row">
                                <td class="job-title">
                                    <div class="title-wrapper">
                                        
                                        ${job.jobTitle}
                                    </div>
                                </td>
                                <td class="company-name">
                                    <div class="company-wrapper">
                                       
                                        ${job.company.name}
                                    </div>
                                </td>
                                <td>
                                    <div class="location-wrapper">
                                        ${job.jobLocation}
                                    </div>
                                </td>
                                <td>
                                    <div class="date-wrapper">
                                        <fmt:formatDate value="${job.jobPostingDate}" pattern="MMM dd, yyyy"/>
                                    </div>
                                </td>
                                <td>
                                    <div class="date-wrapper">
                                        <fmt:formatDate value="${job.lastDateToApply}" pattern="MMM dd, yyyy"/>
                                    </div>
                                </td>
                                <td>
                                    <div class="salary-wrapper">
                                        ${job.salaryRange}
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Pagination -->
        <div class="pagination-container glass-morphism">
            <div class="pagination-controls">
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}" class="pagination-btn">
                        <i class="fas fa-chevron-left"></i> Previous
                    </a>
                </c:if>
                
                <div class="pagination-numbers">
                    <c:forEach begin="0" end="${totalPages - 1}" var="i">
                        <a href="?page=${i}" 
                           class="pagination-number ${currentPage == i ? 'active' : ''}">
                            ${i + 1}
                        </a>
                    </c:forEach>
                </div>

                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}" class="pagination-btn">
                        Next <i class="fas fa-chevron-right"></i>
                    </a>
                </c:if>
            </div>
            <div class="pagination-info">
                Page ${currentPage + 1} of ${totalPages}
            </div>
        </div>
    </main>

    <script>
        // Counter animation
        document.querySelectorAll('.counter').forEach(counter => {
            const target = parseInt(counter.textContent);
            let count = 0;
            const speed = 2000 / target;
            
            const updateCount = () => {
                if (count < target) {
                    count++;
                    counter.textContent = count;
                    requestAnimationFrame(updateCount);
                }
            };
            
            updateCount();
        });

        // Search functionality
        const searchInput = document.getElementById('jobSearch');
        const jobRows = document.querySelectorAll('.job-row');

        searchInput.addEventListener('input', filterJobs);

        function filterJobs() {
            const searchTerm = searchInput.value.toLowerCase();

            jobRows.forEach(row => {
                const text = row.textContent.toLowerCase();
                const matchesSearch = text.includes(searchTerm);
                
                if (matchesSearch) {
                    row.style.display = '';
                    row.style.animation = 'fadeIn 0.3s ease forwards';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        // Toast notifications
        function showToast(message, type) {
            Toastify({
                text: message,
                duration: 3000,
                gravity: "top",
                position: "right",
                className: `toast-${type}`,
                stopOnFocus: true,
                close: true,
                style: {
                    background: type === 'success' ? 'linear-gradient(135deg, #00b09b, #96c93d)' :
                              type === 'error' ? 'linear-gradient(135deg, #ff5f6d, #ffc371)' :
                              'linear-gradient(135deg, #3d8eb9, #42a5f5)'
                }
            }).showToast();
        }

        // Check URL parameters for notifications
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');

            if (status === 'deleted') showToast("Job posting deleted successfully!", "success");
        };

        // Navbar collapse effect
        document.addEventListener('DOMContentLoaded', () => {
            const navbar = document.querySelector('.navbar');
            const main = document.querySelector('main');
            
            function updateMainMargin() {
                main.style.marginLeft = navbar.classList.contains('collapsed') ? '80px' : '280px';
            }

            updateMainMargin();
            new MutationObserver(updateMainMargin).observe(navbar, { attributes: true });
        });
    </script>
</body>
</html>