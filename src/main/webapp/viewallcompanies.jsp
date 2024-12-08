<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Management Dashboard</title>
    <link rel="stylesheet" href="/css/viewallcompanies.css">
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
            <!-- Enhanced Header with Glass Morphism -->
            <div class="header glass-morphism">
                <div class="header-content">
                    <div class="header-title">
                        <div class="title-icon-wrapper">
                            <i class="fas fa-building pulse"></i>
                        </div>
                        <h1>Company Management Dashboard</h1>
                    </div>
                    <div class="header-stats">
                        <div class="stat-card glass-card">
                            <div class="stat-icon">
                                <i class="fas fa-building"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${ccount}"/></span>
                                <span class="stat-label">Total Companies</span>
                            </div>
                            <div class="stat-progress"></div>
                        </div>
                        <div class="stat-card glass-card">
                            <div class="stat-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${lc}"/></span>
                                <span class="stat-label">Locations</span>
                            </div>
                            <div class="stat-progress"></div>
                        </div>
                        <div class="stat-card glass-card">
                            <div class="stat-icon">
                                <i class="fas fa-handshake"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${ac}"/></span>
                                <span class="stat-label">Active Partnerships</span>
                            </div>
                            <div class="stat-progress"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Enhanced Search and Controls -->
            <div class="controls-container glass-morphism">
                <div class="search-container">
                    <div class="search-wrapper">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" 
                               class="search-bar" 
                               placeholder="Search companies by name, location, or email..."
                               id="companySearch">
                    </div>
                </div>
            </div>

            <!-- Enhanced Table with Glass Morphism -->
            <div class="table-container glass-morphism">
                <table class="company-table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-building"></i> Name</th>
                            <th><i class="fas fa-envelope"></i> Email</th>
                            <th><i class="fas fa-phone"></i> Phone</th>
                            <th><i class="fas fa-map-marker-alt"></i> Location</th>
                            <th><i class="fas fa-globe"></i> Website</th>
                            <th><i class="fas fa-info-circle"></i> Status</th>
                            <th class="actions-column"><i class="fas fa-cogs"></i> Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="company" items="${companies}">
                            <tr class="company-row">
                                <td class="company-name">${company.name}</td>
                                <td class="email-cell">
                                    <a href="mailto:${company.email}" class="email-link">
                                        <i class="fas fa-envelope-open"></i>
                                        ${company.email}
                                    </a>
                                </td>
                                <td>
                                    <div class="phone-wrapper">
                                        
                                        ${company.phone}
                                    </div>
                                </td>
                                <td>
                                    <div class="location-wrapper">
                                        
                                        ${company.location}
                                    </div>
                                </td>
                                <td>
                                    <a href="${company.website}" target="_blank" class="website-link">
                                        
                                        ${company.website}
                                    </a>
                                </td>
                                <td>
                                    <span class="status-badge ${company.status.toLowerCase()}">
                                        <i class="fas fa-circle"></i>
                                        ${company.status}
                                    </span>
                                </td>
                                <td class="actions-column">
                                    <div class="actions-wrapper">
                                     <button class="action-btn btn-accept tooltip" 
                                                onclick="window.location.href='<c:url value='updatecstatus?email=${company.email}&status=Accepted'/>'"
                                                data-tooltip="Accept Company">
                                            <i class="fas fa-check"></i>
                                        </button>
                                        <button class="action-btn btn-reject tooltip"
                                                onclick="window.location.href='<c:url value='updatecstatus?email=${company.email}&status=Rejected'/>'"
                                                data-tooltip="Reject Company">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <button class="action-btn btn-delete tooltip"
                                                onclick="if(confirm('Are you sure you want to delete this company?')) { window.location.href='<c:url value='deletecompany?email=${company.email}' />'; }"
                                                data-tooltip="Delete Company">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
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

        // Enhanced search functionality
        const searchInput = document.getElementById('companySearch');
        const companyRows = document.querySelectorAll('.company-row');

        searchInput.addEventListener('input', filterCompanies);

        function filterCompanies() {
            const searchTerm = searchInput.value.toLowerCase();

            companyRows.forEach(row => {
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

        // Enhanced toast notifications
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

            if (status === 'added') showToast("Company added successfully!", "success");
            if (status === 'updated') showToast("Company updated successfully!", "success");
            if (status === 'deleted') showToast("Company deleted successfully!", "success");
        };

        // Enhanced navbar collapse effect
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