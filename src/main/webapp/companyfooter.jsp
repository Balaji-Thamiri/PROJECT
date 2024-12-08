<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Footer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .footer-link {
            position: relative;
            transition: color 0.3s ease;
        }

        .footer-link::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #4A90E2;
            transition: width 0.3s ease;
        }

        .footer-link:hover {
            color: #4A90E2;
        }

        .footer-link:hover::after {
            width: 100%;
        }

        .social-icon {
            transition: transform 0.3s ease;
        }

        .social-icon:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <footer class="bg-gray-900 text-white py-12">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <!-- Company Info -->
                <div>
                    <h3 class="text-2xl font-bold mb-4">Tech Solutions</h3>
                    <p class="text-gray-400">
                        Innovative technology solutions for modern businesses.
                    </p>
                    <div class="flex space-x-4 mt-6">
                        <a href="#" class="social-icon bg-gray-700 w-10 h-10 rounded-full flex items-center justify-center">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a href="#" class="social-icon bg-gray-700 w-10 h-10 rounded-full flex items-center justify-center">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon bg-gray-700 w-10 h-10 rounded-full flex items-center justify-center">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>
                </div>

                <!-- Quick Links -->
                <div>
                    <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="footer-link text-gray-400">Services</a></li>
                        <li><a href="#" class="footer-link text-gray-400">About Us</a></li>
                        <li><a href="#" class="footer-link text-gray-400">Contact</a></li>
                        <li><a href="#" class="footer-link text-gray-400">Careers</a></li>
                    </ul>
                </div>

                <!-- Contact -->
                <div>
                    <h4 class="text-lg font-semibold mb-4">Contact Us</h4>
                    <p class="text-gray-400 mb-2">
                        <i class="fas fa-envelope mr-2 text-blue-500"></i>
                        info@placementportal.com
                    </p>
                    <p class="text-gray-400">
                        <i class="fas fa-phone mr-2 text-blue-500"></i>
                                                     +91 8912354387

                    </p>
                </div>
            </div>

            <!-- Footer Bottom -->
            <div class="border-t border-gray-700 mt-8 pt-4 text-center">
                <p class="text-gray-400">
                    &copy; 2024 Company Portal. All Rights Reserved.
                </p>
            </div>
        </div>
    </footer>
</body>
</html>