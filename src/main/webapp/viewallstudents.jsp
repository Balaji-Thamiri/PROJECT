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
    <title>Student Management Dashboard</title>
    <link rel="stylesheet" href="/css/viewallstudents.css">
    <link rel="icon" href="/images/SUPERSET.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.12.0/cdn.min.js" defer></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
    .spaced-cell {
    margin-left: 20px; /* Adjust the value as needed */
}
    
    </style>
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
                            <i class="fas fa-user-graduate pulse"></i>
                        </div>
                        <h1>Student Management Dashboard</h1>
                    </div>
                    <div class="header-stats">
                        <div class="stat-card glass-card">
                            <div class="stat-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${count}"/></span>
                                <span class="stat-label">Total Students</span>
                            </div>
                            <div class="stat-progress"></div>
                        </div>
                        <div class="stat-card glass-card">
                            <div class="stat-icon active">
                                <i class="fas fa-user-check"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${acceptedcount}"/></span>
                                <span class="stat-label">Active Students</span>
                            </div>
                            <div class="stat-progress active"></div>
                        </div>
                        <div class="stat-card glass-card">
                            <div class="stat-icon pending">
                                <i class="fas fa-user-clock"></i>
                            </div>
                            <div class="stat-info">
                                <span class="stat-value counter"><c:out value="${pending}"/></span>
                                <span class="stat-label">Pending Approval/Rejected</span>
                            </div>
                            <div class="stat-progress pending"></div>
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
                               placeholder="Search students by name, ID, or email..."
                               id="studentSearch">
                    </div>
                </div>
            </div>

            <!-- Enhanced Table with Glass Morphism -->
            <div class="table-container glass-morphism">
                <table class="student-table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-image"></i> Profile</th>
                            <th><i class="fas fa-user"></i> Name</th>
                            <th><i class="fas fa-university"></i> Uni Name</th>
                            <th><i class="fas fa-id-card"></i> ID</th>
                            <th><i class="fas fa-envelope"></i> Email</th>
                            <th><i class="fas fa-phone"></i> Phone</th>
                            <th><i class="fas fa-calendar"></i> DOB</th>
                            <th><i class="fas fa-venus-mars"></i> Gender</th>
                            <th><i class="fas fa-graduation-cap"></i> Degree</th>
                            <th><i class="fas fa-code-branch"></i> Branch</th>
                            <th><i class="fas fa-chart-line"></i> CGPA</th>
                            <th><i class="fas fa-calendar-alt"></i> Grad Year</th>
                            <th><i class="fas fa-info-circle"></i> Status</th>
                            <th class="actions-column"><i class="fas fa-cogs"></i> Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${students}">
                            <tr class="student-row" data-status="${student.status.toLowerCase()}">
                                <td>
                                    <div class="profile-image-container">
                                        <c:if test="${not empty student.base64Image}">
                                            <img src="data:${student.imageType};base64,${student.base64Image}" 
                                                 alt="Profile Image" 
                                                 class="profile-image">
                                        </c:if>
                                    </div>
                                </td>
                                <td class="student-name">${student.firstName} ${student.lastName}</td>
                                <td>${student.universityname}</td>
                                <td>${student.universityId}</td>
                                <td class="email-cell">
                                    <a href="mailto:${student.email}" class="email-link">
                                        <i class="fas fa-envelope-open"></i>
                                        ${student.email}
                                    </a>
                                </td>
                                <td>
                                    <div class="phone-wrapper">
                                       
                                        ${student.phone}
                                    </div>
                                </td>
                                <td>
                                    <div class="date-wrapper">
                                        
                                        ${student.dateOfBirth}
                                    </div>
                                </td>
                                <td class="spaced-cell">
                                    <div class="gender-wrapper">
                                        
                                        ${student.gender}
                                    </div>
                                </td>
                                <td>${student.degree}</td>
                                <td>${student.branch}</td>
                                <td>
                                    <div class="cgpa-indicator" style="--cgpa: ${student.cgpa * 10}%">
                                        <div class="cgpa-value">${student.cgpa}</div>
                                        <div class="cgpa-bar"></div>
                                    </div>
                                </td>
                                <td>${student.graduationYear}</td>
                                <td>
                                    <span class="status-badge ${student.status.toLowerCase()}">
                                        <i class="fas fa-circle"></i>
                                        ${student.status}
                                    </span>
                                </td>
                                <td class="actions-column">
                                    <div class="actions-wrapper">
                                        <button class="action-btn btn-accept tooltip" 
                                                onclick="window.location.href='<c:url value='updatestatus?email=${student.email}&status=Accepted'/>'"
                                                data-tooltip="Accept Student">
                                            <i class="fas fa-check"></i>
                                        </button>
                                        <button class="action-btn btn-reject tooltip"
                                                onclick="window.location.href='<c:url value='updatestatus?email=${student.email}&status=Rejected'/>'"
                                                data-tooltip="Reject Student">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <button class="action-btn btn-edit tooltip"
        onclick="window.location.href='<c:url value='/admin/editstudent?email=${student.email}'/>'"
        data-tooltip="Edit Student">
    <i class="fas fa-pencil-alt"></i>
</button>
                                       <button class="action-btn btn-delete tooltip"
        onclick="if(confirm('Are you sure you want to delete this student?')) { window.location.href='<c:url value="deletestudent?email=${student.email}" />'; }"
        data-tooltip="Delete Student">
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
        
        <div class="pagination-container">
    <c:choose>
        <c:when test="${totalPages > 1}">
            <nav aria-label="Student pagination">
                <ul class="pagination">
                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="viewallstudents?page=${i}&size=5">${i + 1}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:when>
        <c:otherwise>
            <p>No additional pages available.</p>
        </c:otherwise>
    </c:choose>
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

        // Enhanced search and filter functionality
        const searchInput = document.getElementById('studentSearch');
        const studentRows = document.querySelectorAll('.student-row');

        searchInput.addEventListener('input', filterStudents);

        function filterStudents() {
            const searchTerm = searchInput.value.toLowerCase();
            

            studentRows.forEach(row => {
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
            const success = urlParams.get('success');
            const error = urlParams.get('error');
            const status = urlParams.get('status');
            const add = urlParams.get('add');
            if (success) showToast("Student login successful!", "success");
            if (error) showToast("Student login failed!", "error");
            if (status === 'updated') showToast("Student status updated successfully!", "success");
            if (status == 'deleted') showToast("Student Deleted Sucessfully!","success");
            if (status === 'update') showToast("Student Profile updated successfully!", "success");
            if (status === 'add') showToast("Student Added successfully!", "success");
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