<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Student</title>
     <link rel="icon" href="/images/SUPERSET.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/editstudent.css">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2 class="page-title">
                <i class="bi bi-pencil-square"></i>
                Edit Student Details
            </h2>
            <form action="${pageContext.request.contextPath}/admin/updateStudent" method="post">
                <input type="hidden" name="email" value="${student.email}" />
                
                <div class="form-group">
                    <label class="form-label">First Name:</label>
                    <input type="text" class="form-control" name="firstName" value="${student.firstName}" required />
                </div>
                
                <div class="form-group">
                    <label class="form-label">Last Name:</label>
                    <input type="text" class="form-control" name="lastName" value="${student.lastName}" required />
                </div>
                
                <div class="form-group">
                    <label class="form-label">Phone:</label>
                    <input type="text" class="form-control" name="phone" value="${student.phone}" required />
                </div>
                
                
                <div class="form-group">
                    <label class="form-label">Status:</label>
                    <select class="form-select" name="status">
                        <option value="Accepted" ${student.status == 'Accepted' ? 'selected' : ''}>Accepted</option>
                        <option value="Rejected" ${student.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                    </select>
                </div>
                
                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-pencil-square me-2"></i>Update Student
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>