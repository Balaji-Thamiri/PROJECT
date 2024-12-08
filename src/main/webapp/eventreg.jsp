<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Registration</title>
            <link rel="icon" href="/images/SUPERSET.png">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

      body {
    background: url('/images/bhima.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 90px;
}

        .container {
            max-width: 800px;
            width: 100%;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .form-header {
            background: #4c1d95;
            color: #fff;
            padding: 30px;
            text-align: center;
        }

        .form-header h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .form-content {
            padding: 40px;
        }

        .event-selection {
            margin-bottom: 30px;
        }

        .event-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .event-card {
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            padding: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .event-card:hover {
            border-color: #4c1d95;
            transform: translateY(-2px);
        }

        .event-card.selected {
            border-color: #4c1d95;
            background: #f8f4ff;
        }

        .event-card h3 {
            color: #1a202c;
            margin-bottom: 10px;
        }

        .event-info {
            color: #4a5568;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2d3748;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #4c1d95;
            outline: none;
            box-shadow: 0 0 0 3px rgba(76, 29, 149, 0.1);
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .submit-btn {
            background: #4c1d95;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            background: #6d28d9;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
            }

            .form-content {
                padding: 20px;
            }
        }

        /* Animation classes */
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<jsp:include page="studentnavbar.jsp" />
    <div class="container fade-in">
        <div class="form-header">
            <h2><b>Event Registration</b></h2>
           
        </div>
        
        <form action="processRegistration.jsp" method="POST" class="form-content">
            <div class="event-selection">
                <div class="event-cards">
                    <div class="event-card" onclick="selectEvent(this, 'virtualCareerFair')">
                        <h3>Virtual Career Fair</h3>
                        <div class="event-info">
                            <p>📅 November 15, 2024</p>
                            <p>⏰ 10:00 AM - 4:00 PM</p>
                            <p>👥 50+ Companies</p>
                        </div>
                    </div>
                    
                    <div class="event-card" onclick="selectEvent(this, 'resumeWorkshop')">
                        <h3>Resume Building Workshop</h3>
                        <div class="event-info">
                            <p>📅 November 20, 2024</p>
                            <p>⏰ 2:00 PM - 4:00 PM</p>
                            <p>👨‍🏫 Expert Session</p>
                        </div>
                    </div>
                    
                    <div class="event-card" onclick="selectEvent(this, 'mockInterview')">
                        <h3>Mock Interview Drive</h3>
                        <div class="event-info">
                            <p>📅 November 25, 2024</p>
                            <p>⏰ 9:00 AM - 5:00 PM</p>
                            <p>👔 Industry Experts</p>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="selectedEvent" id="selectedEvent">
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="organization">Organization/University</label>
                    <input type="text" id="organization" name="organization" required>
                </div>
                
                <div class="form-group">
                    <label for="designation">Designation/Year</label>
                    <input type="text" id="designation" name="designation" required>
                </div>
            </div>

            <button type="submit" class="submit-btn">Register Now</button>
        </form>
    </div>

    <script>
        function selectEvent(element, eventId) {
            // Remove selected class from all cards
            document.querySelectorAll('.event-card').forEach(card => {
                card.classList.remove('selected');
            });
            
            // Add selected class to clicked card
            element.classList.add('selected');
            
            // Update hidden input
            document.getElementById('selectedEvent').value = eventId;
        }

        // Form validation and animation
        document.querySelector('form').addEventListener('submit', function(e) {
            e.preventDefault();
            
            if (!document.getElementById('selectedEvent').value) {
                alert('Please select an event to register');
                return;
            }
            
            // Add animation class before submission
            this.classList.add('fade-in');
            
            // Submit the form
            this.submit();
        });
    </script>
</body>
</html>