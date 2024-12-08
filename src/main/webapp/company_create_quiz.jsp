<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Quiz</title>
         <link rel="icon" href="/images/SUPERSET.png">
    
    <style>
    :root {
    /* Enhanced Color Palette with Depth */
    --primary-color: #4a90e2;
    --secondary-color: #2ecc71;
    --accent-color: #6c5ce7;
    --background-color: #f5f6fa;
    --text-color: #2c3e50;
    --border-color: rgba(76, 124, 255, 0.2);
    
    /* Advanced Gradient & Shadow Tokens */
    --primary-gradient: linear-gradient(135deg, #4a90e2 0%, #4a90e2 50%, #5f27cd 100%);
    --box-shadow-elevated: 0 15px 35px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
    --border-radius-modern: 16px;
}

/* Modern Reset & Base Styling */
*, *::before, *::after {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

body {
    font-family: 'Inter', 'Segoe UI', -apple-system, BlinkMacSystemFont, 'Roboto', sans-serif;
    background: linear-gradient(135deg, var(--background-color) 0%, color-mix(in srgb, var(--background-color) 90%, white) 100%);
    min-height: 100vh;
    display: grid;
    place-items: center;
    line-height: 1.6;
    color: var(--text-color);
    perspective: 1000px;
}

/* Advanced Form Container */
form {
    background: white;
    width: 100%;
    max-width: 520px;
    padding: 45px;
    border-radius: var(--border-radius-modern);
    box-shadow: var(--box-shadow-elevated);
    display: flex;
    flex-direction: column;
    gap: 20px;
    position: relative;
    overflow: hidden;
    transform-style: preserve-3d;
    transform: rotateX(10deg) scale(0.95);
    opacity: 0;
    animation: formReveal 0.8s forwards cubic-bezier(0.645, 0.045, 0.355, 1);
    background: 
        linear-gradient(45deg, rgba(74, 144, 226, 0.05) 0%, rgba(95, 39, 205, 0.05) 100%),
        white;
    border: 1px solid var(--border-color);
}

@keyframes formReveal {
    0% {
        opacity: 0;
        transform: rotateX(10deg) scale(0.9);
    }
    100% {
        opacity: 1;
        transform: rotateX(0) scale(1);
    }
}

form::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(
        circle at center, 
        rgba(74, 144, 226, 0.1) 0%, 
        transparent 70%
    );
    z-index: 1;
    pointer-events: none;
}

/* Enhanced Input & Select Styles */
input, textarea, select {
    width: 100%;
    padding: 14px 18px;
    border: 2px solid var(--border-color);
    border-radius: 12px;
    font-size: 16px;
    outline: none;
    background: white;
    position: relative;
    z-index: 2;
    backdrop-filter: blur(5px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.02);
}

/* Micro-interaction States */
input:focus, 
textarea:focus, 
select:focus {
    border-color: var(--primary-color);
    box-shadow: 
        0 0 0 3px rgba(74, 144, 226, 0.2),
        0 4px 10px rgba(74, 144, 226, 0.1);
    transform: translateY(-3px);
}

/* Advanced Submit Button */
input[type="submit"] {
    background: var(--primary-gradient);
    color: white;
    border: none;
    cursor: pointer;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    position: relative;
    overflow: hidden;
}

input[type="submit"]::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        120deg, 
        transparent, 
        rgba(255,255,255,0.3), 
        transparent
    );
    transition: all 0.5s;
}

input[type="submit"]:hover::after {
    left: 100%;
}

input[type="submit"]:hover {
    transform: scale(1.03) translateY(-2px);
    box-shadow: 0 10px 20px rgba(74, 144, 226, 0.3);
}

/* Responsive & Accessibility Enhancements */
@media screen and (max-width: 600px) {
    form {
        width: 95%;
        padding: 25px;
        margin: 15px;
    }
}

/* Animated Background Flair */
@keyframes gradientShift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

body {
    background: url('/images/quiz.jpg');
    background-size: cover, 200% 200%;
    background-repeat: no-repeat, no-repeat;
    background-position: center, center;
    animation: gradientShift 15s ease infinite;
}

/* Enhanced Select Styling */
select {
    appearance: none;
    background-image: url("data:image/svg+xml;utf8,<svg fill='%232c3e50' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 24px;
}

/* Textarea with Unique Touch */
textarea {
    resize: vertical;
    min-height: 130px;
    line-height: 1.5;
}

/* Placeholder with Soft Styling */
::placeholder {
    color: rgba(44, 62, 80, 0.45);
    font-style: italic;
    transition: all 0.3s ease;
}

input:focus::placeholder, 
textarea:focus::placeholder {
    opacity: 0.6;
    transform: translateX(5px);
}
    </style>
</head>
<body>
    <form action="/company/create-quiz" method="post">
      <h1 align="center">Add New Quiz</h1>
        <input type="text" name="quiz_title" required placeholder="Quiz Title">
        <textarea name="quiz_description" required placeholder="Quiz Description"></textarea>
        
        <select name="difficulty">
            <option value="Easy">Easy</option>
            <option value="Medium">Medium</option>
            <option value="Hard">Hard</option>
        </select>
        
        <input type="number" name="duration" required placeholder="Quiz Duration (minutes)">
        
        <input type="submit" value="Next: Add Questions">
    </form>
</body>
</html>