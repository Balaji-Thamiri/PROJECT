<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Quiz Questions</title>
         <link rel="icon" href="/images/SUPERSET.png">
    
    <style>
    :root {
    /* Comprehensive Color Palette */
    --primary-color: #4a90e2;
    --secondary-color: #2ecc71;
    --accent-color: #6c5ce7;
    --background-color: #f0f4f8;
    --text-color: #2c3e50;
    --input-border-color: rgba(76, 124, 255, 0.2);
    
    /* Advanced Design Tokens */
    --form-gradient: linear-gradient(135deg, rgba(74, 144, 226, 0.05) 0%, rgba(95, 39, 205, 0.05) 100%);
    --box-shadow-elevated: 
        0 15px 35px rgba(0, 0, 0, 0.1), 
        0 5px 15px rgba(0, 0, 0, 0.07);
    --border-radius-modern: 16px;
}

/* Modern Reset & Global Styling */
*, *::before, *::after {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', 'Segoe UI', -apple-system, BlinkMacSystemFont, 'Roboto', sans-serif;
    background: linear-gradient(
        135deg, 
        var(--background-color), 
        color-mix(in srgb, var(--background-color) 90%, white)
    );
    min-height: 100vh;
    display: grid;
    place-items: center;
    line-height: 1.6;
    color: var(--text-color);
    padding: 20px;
    perspective: 1000px;
}

/* Advanced Form Container */
form {
    background: white;
    width: 100%;
    max-width: 600px;
    padding: 45px;
    border-radius: var(--border-radius-modern);
    box-shadow: var(--box-shadow-elevated);
    display: flex;
    flex-direction: column;
    gap: 20px;
    position: relative;
    overflow: hidden;
    transform-style: preserve-3d;
    background: 
        var(--form-gradient),
        white;
    border: 1px solid var(--input-border-color);
    
    /* Animated Entrance */
    opacity: 0;
    transform: rotateX(10deg) scale(0.95);
    animation: formReveal 0.8s cubic-bezier(0.645, 0.045, 0.355, 1) forwards;
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

/* Pseudo-element Background Effect */
form::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(
        circle at center, 
        rgba(74, 144, 226, 0.05) 0%, 
        transparent 70%
    );
    z-index: 1;
    pointer-events: none;
}

/* Enhanced Input Styling */
textarea, 
input[type="text"], 
select {
    width: 100%;
    padding: 14px 18px;
    border: 2px solid var(--input-border-color);
    border-radius: 12px;
    font-size: 16px;
    outline: none;
    background: white;
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    position: relative;
    z-index: 2;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.02);
}

/* Textarea Specific Styling */
textarea {
    resize: vertical;
    min-height: 150px;
    line-height: 1.6;
    font-weight: 400;
}

/* Focus States with Advanced Interactions */
textarea:focus, 
input[type="text"]:focus, 
select:focus {
    border-color: var(--primary-color);
    box-shadow: 
        0 0 0 3px rgba(74, 144, 226, 0.2),
        0 4px 10px rgba(74, 144, 226, 0.1);
    transform: translateY(-3px);
}

/* Custom Select Styling */
select {
    appearance: none;
    cursor: pointer;
    background-image: url("data:image/svg+xml;utf8,<svg fill='%232c3e50' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 24px;
}

/* Submit Button with Advanced Styling */
/* [All previous CSS remains the same, with the following modifications] */

input[type="submit"] {
    background: linear-gradient(
        135deg, 
        var(--primary-color), 
        color-mix(in srgb, var(--primary-color) 80%, white)
    );
    color: white;
    border: none;
    cursor: pointer;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    position: relative;
    overflow: hidden;
    border-radius: 12px;

    /* Enhanced Submit Button Size */
    padding: 18px 24px;  /* Increased padding */
    font-size: 18px;     /* Larger font size */
    margin-top: 10px;    /* Added extra margin */
    width: 100%;         /* Full width */
    box-shadow: 0 8px 15px rgba(74, 144, 226, 0.2);  /* Enhanced shadow */
}

input[type="submit"]:hover {
    transform: scale(1.02) translateY(-4px);  /* Slightly more pronounced hover effect */
    box-shadow: 
        0 12px 25px rgba(74, 144, 226, 0.3),
        0 0 0 4px rgba(74, 144, 226, 0.2);
}

/* Hover & Active States */
input[type="text"]:hover,
textarea:hover,
select:hover {
    border-color: rgba(74, 144, 226, 0.4);
}

/* Responsive Design */
@media screen and (max-width: 680px) {
    form {
        width: 95%;
        max-width: 100%;
        padding: 25px;
        margin: 15px 0;
    }
}

/* Placeholder Styling */
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

/* Subtle Animations */
@keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.02); }
}

/* Accessibility & Interaction Improvements */
input:focus, 
textarea:focus, 
select:focus {
    outline: none;
    
}
    </style>
</head>
<body>
    <form action="/company/add-quiz-questions" method="post">
      <h1 align="center">Add Quiz Questions</h1>
        <textarea name="question_text" required placeholder="Question Text"></textarea>
        
        <input type="text" name="option1" required placeholder="Option 1">
        <input type="text" name="option2" required placeholder="Option 2">
        <input type="text" name="option3" required placeholder="Option 3">
        <input type="text" name="option4" required placeholder="Option 4">
        
        <select name="correct_answer">
            <option value="option1">Option 1</option>
            <option value="option2">Option 2</option>
            <option value="option3">Option 3</option>
            <option value="option4">Option 4</option>
        </select>
        
        <select name="add_more">
            <option value="yes">Add Another Question</option>
            <option value="no">Finish Quiz</option>
        </select>
        
        <input type="submit" value="Save Question">
    </form>
</body>
</html>