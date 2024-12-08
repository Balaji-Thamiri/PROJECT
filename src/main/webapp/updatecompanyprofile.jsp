<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Company Profile</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

      body {
    background-image: url('/images/ase.jpg');  /* Add your background image path here */
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    min-height: 100vh;
    padding: 2rem;
}

        .update-container {
            max-width: 1000px;
            margin: 2rem auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            overflow: hidden;
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .update-header {
            background: linear-gradient(135deg, #1a365d 0%, #2b6cb0 100%);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .update-header h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .update-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .profile-form {
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
            transition: all 0.3s ease;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2d3748;
            font-weight: 600;
            font-size: 0.95rem;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f8fafc;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
            outline: none;
            background: white;
        }

        .image-preview {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 1rem auto;
            border: 4px solid white;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            overflow: hidden;
            position: relative;
        }

        .image-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .file-input-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        .file-input-wrapper input[type=file] {
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            cursor: pointer;
            width: 100%;
            height: 100%;
        }

        .custom-file-upload {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background: #4299e1;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .custom-file-upload:hover {
            background: #2b6cb0;
            transform: translateY(-1px);
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            flex: 1;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: #4299e1;
            color: white;
        }

        .btn-secondary {
            background: #718096;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .btn:active {
            transform: translateY(0);
        }

        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .alert-success {
            background: #c6f6d5;
            color: #2f855a;
            border: 1px solid #9ae6b4;
        }

        .alert-error {
            background: #fed7d7;
            color: #c53030;
            border: 1px solid #feb2b2;
        }

        @media (max-width: 768px) {
            .update-container {
                margin: 1rem;
            }

            .update-header h1 {
                font-size: 2rem;
            }

            .button-group {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="update-container">
        <div class="update-header">
            <h1>Update Company Profile</h1>
            <p>Keep your information up to date</p>
        </div>

        <form action="/company/updateProfile" method="POST" enctype="multipart/form-data" class="profile-form">
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-error">${errorMessage}</div>
            </c:if>

            <div class="image-preview">
                <c:choose>
                    <c:when test="${not empty company.base64Image}">
                        <img src="data:${company.imageType};base64,${company.base64Image}" alt="Company Logo">
                    </c:when>
                    <c:otherwise>
                        <img src="/images/default-company-logo.png" alt="Default Company Logo">
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="form-group">
                <label>Company Logo</label>
                <div class="file-input-wrapper">
                    <label class="custom-file-upload">
                        <i class="fas fa-cloud-upload-alt"></i> Choose New Logo
                        <input type="file" name="file" accept="image/*" />
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Company Name</label>
                <input type="text" name="name" value="${company.name}" readonly />
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" value="${company.email}" required />
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="tel" name="phone" value="${company.phone}" required />
            </div>

            <div class="form-group">
                <label>Location</label>
                <input type="text" name="location" value="${company.location}" required />
            </div>

            <div class="form-group">
                <label>Website</label>
                <input type="url" name="website" value="${company.website}" required />
            </div>

            <div class="button-group">
                <button type="button" class="btn btn-secondary" onclick="window.location.href='/company/companyhome'">
                    <i class="fas fa-arrow-left"></i> Cancel
                </button>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Save Changes
                </button>
            </div>
        </form>
    </div>

    <script>
        // Preview image before upload
        document.querySelector('input[type="file"]').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.querySelector('.image-preview img').src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>