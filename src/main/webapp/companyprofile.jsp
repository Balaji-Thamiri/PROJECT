<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Profile</title>
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
    background-image: url('/images/sde.avif');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: #1a1a1a;
    line-height: 1.6;
    min-height: 100vh;
    position: relative;
}

body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: url('/images/sde.avif');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    z-index: -1;
}


        .page-header {
            background: linear-gradient(135deg, #1a365d 0%, #2b6cb0 100%);
            padding: 2rem 0;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23ffffff' fill-opacity='0.05' fill-rule='evenodd'/%3E%3C/svg%3E");
            opacity: 0.1;
        }

        .header-content {
            max-width: 900px;
            margin: 0 auto;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .header-title {
            color: white;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header-subtitle {
            color: rgba(255,255,255,0.9);
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
        }

        .profile-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background: #ffffff;
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
            border-radius: 16px;
            transition: transform 0.3s ease;
        }

        .profile-container:hover {
            transform: translateY(-5px);
        }

        .profile-header {
            display: flex;
            align-items: flex-start;
            margin-bottom: 35px;
            padding-bottom: 25px;
            border-bottom: 2px solid #eef2f7;
            position: relative;
            flex-wrap: wrap;
        }

        .profile-image {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 40px;
            border: 4px solid #ffffff;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .profile-image:hover {
            transform: scale(1.05);
        }

        .profile-info {
            flex: 1;
            min-width: 200px;
            align-items: center;
            justify-content: center;
        }

        .profile-info h1 {
            margin: 0 0 15px 0;
            color: #2d3748;
            font-size: 2.5em;
            font-weight: 700;
            letter-spacing: -0.5px;
            align-items: center;
            justify-content: center;
        }

        .button-container {
            display: flex;
            gap: 20px;
            margin-left: auto;
            margin-top: 20px;
            width: 100%;
        }

        .back-button,
        .update-button {
            flex: 1;
            height: 60px;
            padding: 0 30px;
            background: #4299e1;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .back-button:hover,
        .update-button:hover {
            background: #2b6cb0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(66, 153, 225, 0.2);
        }

        .back-button:active,
        .update-button:active {
            transform: translateY(0);
        }

        .back-button i,
        .update-button i {
            font-size: 18px;
        }

        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 25px;
        }

        .detail-item {
            padding: 20px;
            background: #f8fafc;
            border-radius: 12px;
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
            position: relative;
            overflow: hidden;
        }

        .detail-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: #4299e1;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .detail-item:hover {
            background: #ffffff;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transform: translateY(-3px);
        }

        .detail-item:hover::before {
            opacity: 1;
        }

        .detail-item i {
            margin-right: 12px;
            color: #4299e1;
            font-size: 1.2em;
        }

        .detail-label {
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 8px;
            font-size: 0.95em;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .detail-value {
            color: #2d3748;
            font-size: 1.1em;
        }

        .detail-value a {
            color: #4299e1;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .detail-value a:hover {
            color: #2b6cb0;
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .header-title {
                font-size: 2rem;
            }

            .header-subtitle {
                font-size: 1rem;
                padding: 0 20px;
            }

            .profile-header {
                flex-direction: column;
                text-align: center;
                align-items: center;
            }

            .profile-image {
                margin: 0 0 20px 0;
            }

            .profile-info {
                width: 100%;
                text-align: center;
            }

            .button-container {
                flex-direction: column;
                width: 100%;
            }

            .back-button,
            .update-button {
                width: 100%;
                height: 60px;
                font-size: 18px;
            }

            .profile-details {
                grid-template-columns: 1fr;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .profile-container {
            animation: fadeIn 0.6s ease-out;
        }
        /* Reset and general styles remain the same */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Previous body styles remain... */

/* Improved canteen section styling */
.canteen {
    padding: 2.5rem 0;
    margin-bottom: 2rem;
    position: relative;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.canteen::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    opacity: 0.1;
    z-index: 1;
}

.canteen h1 {
    position: relative;
    z-index: 2;
    color: #ffffff;
    font-size: 2.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin: 0;
    padding: 0;
    text-align: center;
    border: none;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    animation: fadeInDown 0.6s ease-out;
}

.canteen h1::after {
    content: '';
    display: block;
    width: 60px;
    height: 4px;
    background: #4299e1;
    margin: 15px auto 0;
    border-radius: 2px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Animation for the heading */
@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .canteen {
        padding: 2rem 0;
    }

    .canteen h1 {
        font-size: 2rem;
        letter-spacing: 1px;
    }

    .canteen h1::after {
        width: 40px;
        height: 3px;
        margin: 10px auto 0;
    }
}
    </style>
</head>
<body>
      <div class="canteen">
        <h1>Company Profile</h1>
    </div>
    <div class="profile-container">
        <div class="profile-header">
            <c:choose>
                <c:when test="${not empty company.base64Image}">
                    <img src="data:${company.imageType};base64,${company.base64Image}" alt="Company Logo" class="profile-image">
                </c:when>
                <c:otherwise>
                    <img src="/images/default-company-logo.png" alt="Default Company Logo" class="profile-image">
                </c:otherwise>
            </c:choose>
            <div class="profile-info">
                <h1>${company.name}</h1>
            </div>
        </div>

        <div class="profile-details">
            <div class="detail-item">
                <div class="detail-label"><i class="fas fa-envelope"></i> Email</div>
                <div class="detail-value">${company.email}</div>
            </div>

            <div class="detail-item">
                <div class="detail-label"><i class="fas fa-phone"></i> Phone</div>
                <div class="detail-value">${company.phone}</div>
            </div>

            <div class="detail-item">
                <div class="detail-label"><i class="fas fa-map-marker-alt"></i> Location</div>
                <div class="detail-value">${company.location}</div>
            </div>

           
        </div>
        <div class="button-container">
                <button class="back-button" onclick="window.location.href='/company/companyhome'">
                    <i class="fas fa-arrow-left"></i>
                    Back
                </button>
                <button class="update-button" onclick="window.location.href='/company/updateprofile'">
    <i class="fas fa-edit"></i> Update Profile
</button>

            </div>
    </div>
</body>
</html>