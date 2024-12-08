<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <link rel="icon" href="/images/pnf.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #1a1a2e, #16213e);
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            text-align: center;
            padding: 20px;
            position: relative;
        }

        .error-code {
            font-size: 8rem;
            font-weight: 700;
            color: #ff4b5c;
            text-shadow: 0px 5px 10px rgba(0, 0, 0, 0.6);
            animation: glow 1.5s infinite alternate;
        }

        .error-message {
            font-size: 2rem;
            margin-top: 1rem;
            color: #f0f0f0;
            letter-spacing: 3px;
            text-transform: uppercase;
        }

        .error-description {
            font-size: 1.2rem;
            margin: 1rem 0 2rem 0;
            color: #d1d1d1;
        }

        .home-button {
            padding: 0.8rem 2rem;
            font-size: 1rem;
            font-weight: bold;
            color: #ffffff;
            text-decoration: none;
            background: linear-gradient(90deg, #36d1dc, #5b86e5);
            border-radius: 50px;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .home-button:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
        }

        @keyframes glow {
            from {
                text-shadow: 0px 0px 10px #ff4b5c, 0px 0px 20px #ff4b5c;
            }
            to {
                text-shadow: 0px 0px 20px #ff4b5c, 0px 0px 30px #ff4b5c;
            }
        }

        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            width: 8px;
            height: 8px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            animation: floatParticles 20s linear infinite;
            opacity: 0;
        }

        @keyframes floatParticles {
            0% {
                transform: translateY(100vh) translateX(0);
                opacity: 0;
            }
            30% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100vh) translateX(30vw);
                opacity: 0;
            }
        }

    </style>
</head>
<body>
    <div class="particles"></div>

    <div class="container">
        <div class="error-code">404</div>
        <div class="error-message">Page Not Found</div>
        <div class="error-description">
            The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.
        </div>
        <a href="/" class="home-button">Return Home</a>
    </div>

    <script>
        // Particle animation
        function createParticle() {
            const particlesContainer = document.querySelector('.particles');
            const particle = document.createElement('div');
            particle.className = 'particle';
            particle.style.left = Math.random() * 100 + 'vw';
            particle.style.animationDuration = 15 + Math.random() * 15 + 's';
            particle.style.animationDelay = Math.random() * 5 + 's';
            particlesContainer.appendChild(particle);

            setTimeout(() => {
                particle.remove();
            }, 30000); // Remove particle after animation ends
        }

        setInterval(createParticle, 500); // Generate particles periodically
    </script>
</body>
</html>
