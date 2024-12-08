<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/images/SUPERSET.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Expiry</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
            color: #2d3748;
            min-height: 100vh;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            padding: 20px;
            line-height: 1.6;
            background-image: url('/images/session.png');
            background-size: cover;
           background-position: center 10%; /* Move the image closer to the top */
            background-repeat: no-repeat;
            background-attachment: fixed; 
        }

        .container {
            background: linear-gradient(
                to bottom right,
                rgba(255, 255, 255, 0.95),
                rgba(255, 255, 255, 0.85)
            );
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 24px;
            box-shadow: 
                0 10px 25px -5px rgba(0, 0, 0, 0.1),
                0 0 20px -5px rgba(0, 0, 0, 0.05),
                inset 0 1px 2px rgba(255, 255, 255, 0.9);
            padding: 48px 40px;
            max-width: 440px;
            width: 100%;
            transform: translateY(0);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            margin-top: 80px;
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        .container::before {
            content: '';
            position: absolute;
            top: -1px;
            left: -1px;
            right: -1px;
            bottom: -1px;
            border-radius: 24px;
            padding: 1px;
            background: linear-gradient(
                135deg,
                rgba(255, 255, 255, 0.5),
                rgba(255, 255, 255, 0.2)
            );
            -webkit-mask: linear-gradient(#fff 0 0) content-box,
                         linear-gradient(#fff 0 0);
            mask: linear-gradient(#fff 0 0) content-box,
                  linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            pointer-events: none;
        }

        .container:hover {
            transform: translateY(-5px) scale(1.01);
            box-shadow: 
                0 20px 35px -10px rgba(0, 0, 0, 0.2),
                0 0 30px -5px rgba(0, 0, 0, 0.1),
                inset 0 1px 2px rgba(255, 255, 255, 0.95);
        }

        h1 {
            color: #e53e3e;
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
            position: relative;
            display: inline-block;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, #e53e3e, transparent);
            border-radius: 2px;
        }

        p {
            font-size: 18px;
            color: #4a5568;
            margin: 16px 0 32px 0;
            font-weight: 500;
            line-height: 1.7;
        }

        .login-btn {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: linear-gradient(135deg, #4299e1, #3182ce);
            padding: 14px 32px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            box-shadow: 0 4px 12px rgba(66, 153, 225, 0.3);
            position: relative;
            overflow: hidden;
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                120deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(66, 153, 225, 0.4);
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .login-btn:active {
            transform: translateY(0);
            box-shadow: 0 4px 12px rgba(66, 153, 225, 0.2);
        }

        @media (max-width: 480px) {
            .container {
                padding: 32px 24px;
                margin-top: 40px;
                border-radius: 20px;
            }

            .container::before {
                border-radius: 20px;
            }

            h1 {
                font-size: 28px;
            }

            p {
                font-size: 16px;
                margin: 12px 0 24px 0;
            }

            .login-btn {
                padding: 12px 28px;
                font-size: 15px;
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

        .container {
            animation: fadeIn 0.6s cubic-bezier(0.4, 0, 0.2, 1);
        }
    </style>
</head>
<body>
    <div class="container">
       <h1>OOPS! Session Expired</h1>
        <p>Your session has timed out for security reasons. Please log in again to continue.</p>
        <a href="/admin" class="login-btn">Log In Again</a>
    </div>
</body>
</html>