<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Component</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Footer Animations and Enhanced Styles */
        .footer-link {
            position: relative;
            overflow: hidden;
        }

        .footer-link::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #3B82F6;
            transition: width 0.3s ease;
        }

        .footer-link:hover::after {
            width: 100%;
        }

        .social-icon {
            transform: translateY(0);
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .social-icon:hover {
            transform: translateY(-5px);
        }

        .newsletter-input {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .newsletter-input:focus {
            transform: scale(1.02);
            box-shadow: 0 0 15px rgba(59, 130, 246, 0.5);
        }

        .subscribe-button {
            position: relative;
            overflow: hidden;
        }

        .subscribe-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .subscribe-button:hover::before {
            left: 100%;
        }

        .footer-section {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .footer-heading::after {
            content: '';
            display: block;
            width: 0;
            height: 2px;
            background: #3B82F6;
            transition: width 0.3s ease;
        }

        .footer-heading:hover::after {
            width: 50px;
        }

        /* Quick Links Animation */
        .quick-link {
            transition: transform 0.3s ease, padding-left 0.3s ease;
        }

        .quick-link:hover {
            transform: translateX(10px);
            padding-left: 5px;
        }

        /* Contact Info Hover Effect */
        .contact-item {
            transition: transform 0.3s ease;
        }

        .contact-item:hover {
            transform: translateX(5px);
        }

        /* Newsletter Form Animation */
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .invalid {
            animation: shake 0.5s ease-in-out;
            border-color: #EF4444;
        }
    </style>
</head>
<body>
    <footer class="bg-gray-900 text-white pt-16 pb-8">
        <div class="container mx-auto px-4">
            <!-- Main Footer Content -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-12">
                <!-- Company Info -->
                <div class="footer-section" style="animation-delay: 0.1s">
                    <h3 class="text-2xl font-bold mb-4 footer-heading">Placement Portal</h3>
                    <p class="text-gray-400 leading-relaxed">
                        Empowering students and companies to connect and create meaningful career opportunities.
                    </p>
                    <div class="flex space-x-4 mt-6">
                        <a href="#" class="social-icon bg-gray-700 hover:bg-blue-600 w-10 h-10 rounded-full flex items-center justify-center transition-all duration-300">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon bg-gray-700 hover:bg-blue-400 w-10 h-10 rounded-full flex items-center justify-center transition-all duration-300">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon bg-gray-700 hover:bg-blue-700 w-10 h-10 rounded-full flex items-center justify-center transition-all duration-300">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a href="#" class="social-icon bg-gray-700 hover:bg-gray-600 w-10 h-10 rounded-full flex items-center justify-center transition-all duration-300">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>
                </div>

                <!-- Quick Links -->
                <div class="footer-section" style="animation-delay: 0.2s">
                    <h4 class="text-lg font-semibold mb-4 footer-heading">
                        Quick Links
                    </h4>
                    <ul class="space-y-3">
                        <li>
                            <a href="#" class="quick-link text-gray-400 hover:text-white transition-all duration-300 flex items-center footer-link">
                                <i class="fas fa-chevron-right mr-2 text-sm text-blue-500"></i>
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#" class="quick-link text-gray-400 hover:text-white transition-all duration-300 flex items-center footer-link">
                                <i class="fas fa-chevron-right mr-2 text-sm text-blue-500"></i>
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="#" class="quick-link text-gray-400 hover:text-white transition-all duration-300 flex items-center footer-link">
                                <i class="fas fa-chevron-right mr-2 text-sm text-blue-500"></i>
                                Services
                            </a>
                        </li>
                        <li>
                            <a href="#" class="quick-link text-gray-400 hover:text-white transition-all duration-300 flex items-center footer-link">
                                <i class="fas fa-chevron-right mr-2 text-sm text-blue-500"></i>
                                Contact
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Contact Info -->
                <div class="footer-section" style="animation-delay: 0.3s">
                    <h4 class="text-lg font-semibold mb-4 footer-heading">
                        Contact Info
                    </h4>
                    <ul class="space-y-3">
                        <li class="contact-item flex items-center text-gray-400">
                            <i class="fas fa-map-marker-alt mr-3 text-blue-500"></i>
                            123 University Street, City, State 12345
                        </li>
                        <li class="contact-item flex items-center text-gray-400">
                            <i class="fas fa-phone mr-3 text-blue-500"></i>
                            +1 (555) 123-4567
                        </li>
                        <li class="contact-item flex items-center text-gray-400">
                            <i class="fas fa-envelope mr-3 text-blue-500"></i>
                            info@placementportal.com
                        </li>
                        <li class="contact-item flex items-center text-gray-400">
                            <i class="fas fa-clock mr-3 text-blue-500"></i>
                            Mon - Fri: 9:00 AM - 5:00 PM
                        </li>
                    </ul>
                </div>

                <!-- Newsletter -->
                <div class="footer-section" style="animation-delay: 0.4s">
                    <h4 class="text-lg font-semibold mb-4 footer-heading">
                        Newsletter
                    </h4>
                    <p class="text-gray-400 mb-4">Subscribe to our newsletter for updates and opportunities.</p>
                    <form class="space-y-3" id="newsletterForm">
                        <div class="relative">
                            <input 
                                type="email" 
                                placeholder="Your email address" 
                                class="newsletter-input w-full px-4 py-2 bg-gray-700 text-white rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                            >
                        </div>
                        <button 
                            type="submit" 
                            class="subscribe-button w-full bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg transition-all duration-300 flex items-center justify-center"
                        >
                            <i class="fas fa-paper-plane mr-2"></i>
                            Subscribe
                        </button>
                    </form>
                </div>
            </div>

            <!-- Divider -->
            <div class="border-t border-gray-700 pt-8">
                <div class="flex flex-col md:flex-row justify-between items-center">
                    <!-- Copyright -->
                    <div class="text-gray-400 text-center md:text-left mb-4 md:mb-0">
                        &copy; 2024 <span class="text-white">Placement Portal</span>. All rights reserved.
                    </div>
                    
                    <!-- Terms and Privacy -->
                    <div class="flex space-x-6">
                        <a href="#" class="footer-link text-gray-400 hover:text-white transition-colors duration-300">
                            Terms of Service
                        </a>
                        <a href="#" class="footer-link text-gray-400 hover:text-white transition-colors duration-300">
                            Privacy Policy
                        </a>
                        <a href="#" class="footer-link text-gray-400 hover:text-white transition-colors duration-300">
                            Cookie Policy
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script>
        // Newsletter form validation
        document.getElementById('newsletterForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const emailInput = this.querySelector('input[type="email"]');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (!emailRegex.test(emailInput.value)) {
                emailInput.classList.add('invalid');
                setTimeout(() => {
                    emailInput.classList.remove('invalid');
                }, 500);
            } else {
                // Handle successful submission
                alert('Thank you for subscribing!');
                this.reset();
            }
        });

        // Animate footer sections on scroll
        document.addEventListener('DOMContentLoaded', function() {
            const footerSections = document.querySelectorAll('.footer-section');
            
            function checkScroll() {
                const triggerBottom = window.innerHeight * 0.8;
                
                footerSections.forEach(section => {
                    const sectionTop = section.getBoundingClientRect().top;
                    if (sectionTop < triggerBottom) {
                        section.style.animationPlayState = 'running';
                    }
                });
            }

            window.addEventListener('scroll', checkScroll);
            checkScroll(); // Check on initial load
        });
    </script>
</body>
</html>