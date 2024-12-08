<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apply for Job</title>
        <link rel="icon" href="/images/SUPERSET.png">
    
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <style>
    :root {
    --gradient-primary: linear-gradient(45deg, #6a11cb 0%, #2575fc 100%);
    --gradient-secondary: linear-gradient(to right, #ff6a00, #ee0979);
    --background-color: #f0f2f5;
    --text-primary: #2c3e50;
    --text-secondary: #7f8c8d;
    --border-radius-sharp: 15px;
    --border-radius-soft: 30px;
    --box-shadow-elevated: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
    --transition-smooth: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    scrollbar-width: thin;
    scrollbar-color: rgba(90, 90, 90, 0.1) transparent;
}

body {
    font-family: 'system-ui', '-apple-system', 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    background: url('/images/ff.jpeg') no-repeat center center fixed; /* Replace '/images/background.jpg' with your image path */
    background-size: cover; /* Ensures the image covers the entire viewport */
    display: grid;
    place-items: center;
    min-height: 100vh;
    perspective: 1000px;
}


.container {
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(15px);
    border-radius: var(--border-radius-sharp);
    width: 100%;
    max-width: 500px;
    padding: 40px;
    box-shadow: var(--box-shadow-elevated);
    transform: rotateX(10deg) scale(0.9);
    opacity: 0;
    animation: 
        slideIn 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards,
        float 4s ease-in-out infinite;
}

@keyframes slideIn {
    0% { 
        transform: rotateX(30deg) translateY(50px) scale(0.8); 
        opacity: 0; 
    }
    100% { 
        transform: rotateX(0) translateY(0) scale(1); 
        opacity: 1; 
    }
}



h2 {
    background: var(--gradient-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-align: center;
    margin-bottom: 35px;
    font-weight: 800;
    position: relative;
}

h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background: var(--gradient-secondary);
    border-radius: 10px;
}

.form-group {
    position: relative;
    margin-bottom: 25px;
}

.form-group input, 
.form-group textarea {
    width: 100%;
    padding: 15px;
    border: 2px solid transparent;
    border-radius: var(--border-radius-soft);
    font-size: 16px;
    background: linear-gradient(to right, #f5f7fa, #f5f7fa), 
                linear-gradient(to right, rgba(255,255,255,0.8), rgba(255,255,255,0.8));
    background-clip: padding-box, border-box;
    border: 2px solid transparent;
    background-origin: border-box;
    transition: var(--transition-smooth);
}

.form-group input:focus, 
.form-group textarea:focus {
    outline: none;
    border: 2px solid transparent;
    background: linear-gradient(to right, #f5f7fa, #f5f7fa), 
                var(--gradient-primary);
    background-clip: padding-box, border-box;
    background-origin: border-box;
    box-shadow: 0 10px 20px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
}

.btn-submit {
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: var(--border-radius-soft);
    background: var(--gradient-primary);
    color: white;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    transition: var(--transition-smooth);
    position: relative;
    overflow: hidden;
}

.btn-submit::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(120deg, transparent, rgba(255,255,255,0.3), transparent);
    transition: var(--transition-smooth);
}

.btn-submit:hover::before {
    left: 100%;
}

.btn-submit:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 25px rgba(50,50,93,.2), 0 5px 15px rgba(0,0,0,.1);
}

@media (max-width: 600px) {
    .container {
        width: 95%;
        padding: 25px;
    }
}
    </style>
</head>
<body>
    <div class="container">
        <h2>Job Application Form</h2>
        
        <form action="/student/submitapplication" method="post" enctype="multipart/form-data">
            <input type="hidden" name="companyName" value="${job.company.name}">
            <input type="hidden" name="jobName" value="${job.jobTitle}">
            
            <div class="form-group">
                <label>Name:</label>
                <input type="text" value="${student.firstName} ${student.lastName}" readonly>
            </div>
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" value="${student.email}" readonly>
            </div>
            
            <div class="form-group">
                <label>Phone Number:</label>
                <input type="tel" name="phoneNumber" value="${student.phone}" required>
            </div>
            
            <div class="form-group">
                <label>Work Experience (in years):</label>
                <input type="text" name="workExperience" required>
            </div>
            
            <div class="form-group">
                <label>Skills:</label>
                <textarea name="skills" rows="4" required></textarea>
            </div>
            
            <div class="form-group">
                <label>LinkedIn Profile:</label>
                <input type="url" name="linkedinProfile" required>
            </div>
            
            <div class="form-group">
                <label>Resume (PDF only):</label>
                <input type="file" name="resume" accept=".pdf" required>
            </div>
            
            <button type="submit" class="btn-submit">Submit Application</button>
        </form>
    </div>
</body>
</html>