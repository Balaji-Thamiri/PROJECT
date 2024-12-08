<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Talent Placement Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
         <link rel="stylesheet" href="/css/index.css">
        <link rel="icon" href="images/SUPERSET.png"> <!-- This sets the favicon -->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-50">
    <header class="bg-white shadow-md">
        <div class="container mx-auto px-4 py-4 flex justify-between items-center">
            <div class="flex items-center">
    <img src="images/rsm.png" alt="Talent Placement Portal Logo" class="h-16 w-34 mr-3">
</div>

            <div class="flex space-x-4">
                <!-- Login Dropdown -->
                <div class="relative group">
                    <button class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-300 flex items-center space-x-2">
                        <i class="fas fa-sign-in-alt"></i>
                        <span>Login</span>
                    </button>
                    
                    <div class="absolute right-0 mt-2 w-72 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform group-hover:translate-y-0 translate-y-2">
                        <div class="bg-white rounded-xl shadow-2xl border border-gray-100 overflow-hidden">
                            <div class="bg-gradient-to-r from-blue-600 to-blue-700 px-6 py-4 text-white">
                                <h4 class="text-lg font-semibold">Welcome Back!</h4>
                                <p class="text-sm opacity-90">Choose your login type</p>
                            </div>
                            
                            <div class="p-4 space-y-3">
                                <a href="${pageContext.request.contextPath}/student" 
                                   class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50 transition-colors duration-300 group">
                                    <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center text-blue-600">
                                        <i class="fas fa-user-graduate"></i>
                                    </div>
                                    <div>
                                        <h5 class="font-semibold text-gray-800">Student Login</h5>
                                        <p class="text-sm text-gray-500">Access your student portal</p>
                                    </div>
                                    <i class="fas fa-chevron-right ml-auto text-gray-400 group-hover:text-blue-600"></i>
                                </a>
                                
                                <a href="${pageContext.request.contextPath}/company" 
                                   class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50 transition-colors duration-300 group">
                                    <div class="w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center text-purple-600">
                                        <i class="fas fa-building"></i>
                                    </div>
                                    <div>
                                        <h5 class="font-semibold text-gray-800">Company Login</h5>
                                        <p class="text-sm text-gray-500">Access your company dashboard</p>
                                    </div>
                                    <i class="fas fa-chevron-right ml-auto text-gray-400 group-hover:text-purple-600"></i>
                                </a>
                                
                                <a href="${pageContext.request.contextPath}/admin" 
                                   class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50 transition-colors duration-300 group">
                                    <div class="w-10 h-10 bg-red-100 rounded-full flex items-center justify-center text-red-600">
                                        <i class="fas fa-user-shield"></i>
                                    </div>
                                    <div>
                                        <h5 class="font-semibold text-gray-800">Admin Login</h5>
                                        <p class="text-sm text-gray-500">Access your admin portal</p>
                                    </div>
                                    <i class="fas fa-chevron-right ml-auto text-gray-400 group-hover:text-red-600"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sign Up Dropdown -->
                <div class="relative group">
                    <button class="px-6 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors duration-300 flex items-center space-x-2">
                        <i class="fas fa-user-plus"></i>
                        <span>Sign Up</span>
                    </button>
                    
                    <div class="absolute right-0 mt-2 w-72 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform group-hover:translate-y-0 translate-y-2">
                        <div class="bg-white rounded-xl shadow-2xl border border-gray-100 overflow-hidden">
                            <div class="bg-gradient-to-r from-green-600 to-green-700 px-6 py-4 text-white">
                                <h4 class="text-lg font-semibold">Join Us Today!</h4>
                                <p class="text-sm opacity-90">Choose your account type</p>
                            </div>
                            
                            <div class="p-4 space-y-3">
                                <a href="${pageContext.request.contextPath}/student/studentreg" 
                                   class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50 transition-colors duration-300 group">
                                    <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center text-blue-600">
                                        <i class="fas fa-user-graduate"></i>
                                    </div>
                                    <div>
                                        <h5 class="font-semibold text-gray-800">Student Sign Up</h5>
                                        <p class="text-sm text-gray-500">Create a student account</p>
                                    </div>
                                    <i class="fas fa-chevron-right ml-auto text-gray-400 group-hover:text-blue-600"></i>
                                </a>
                                
                                <a href="${pageContext.request.contextPath}/company/companyreg" 
                                   class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50 transition-colors duration-300 group">
                                    <div class="w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center text-purple-600">
                                        <i class="fas fa-building"></i>
                                    </div>
                                    <div>
                                        <h5 class="font-semibold text-gray-800">Company Sign Up</h5>
                                        <p class="text-sm text-gray-500">Register your company</p>
                                    </div>
                                    <i class="fas fa-chevron-right ml-auto text-gray-400 group-hover:text-purple-600"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <section class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen flex items-center">
        <div class="container mx-auto px-4 flex flex-col md:flex-row items-center">
            <div class="md:w-1/2 text-center md:text-left">
                <h1 class="text-4xl md:text-6xl font-bold text-gray-800 mb-6">Welcome to RK Placement Portal!</h1>
                <p class="text-xl text-gray-600 mb-8">Your gateway to connecting students with top companies and exciting career opportunities.</p>
                <div class="space-x-4">
                    <a href="/student" class="bg-blue-600 text-white px-8 py-3 rounded-lg hover:bg-blue-700 transition duration-300">Get Started</a>
                </div>
            </div>
            <div class="md:w-1/2 mt-10 md:mt-0">
                <img src="images/sss.svg" alt="Talent Placement" class="w-full max-w-md mx-auto"/>
            </div>
        </div>
    </section>
    
    <!-- About Us Section -->
    <section class="bg-gradient-to-br from-white to-blue-50 py-16">
        <div class="container mx-auto px-4">
            <div class="flex flex-col md:flex-row items-center gap-12">
               <div class="md:w-1/2">
    <img 
        src="/images/info.avif" 
        alt="Talent Placement Portal Concept" 
        class="rounded-xl shadow-lg" 
        style="width: 550px; height:400px; max-width: 100%;"
    />
</div>
                <div class="md:w-1/2">
                    <h2 class="text-4xl font-bold text-gray-800 mb-6">About RK Placement Portal</h2>
                    <p class="text-xl text-gray-600 mb-4">
                        We are a cutting-edge platform dedicated to bridging the gap between talented students and innovative companies. Our mission is to transform the recruitment landscape by providing a seamless, efficient, and intelligent matching system.
                    </p>
                    <div class="space-y-4 text-gray-700">
                        <div class="flex items-start space-x-4">
                            <i class="fas fa-check-circle text-blue-600 mt-1 text-2xl"></i>
                            <p>Comprehensive student profiles that highlight skills, achievements, and potential</p>
                        </div>
                        <div class="flex items-start space-x-4">
                            <i class="fas fa-check-circle text-blue-600 mt-1 text-2xl"></i>
                            <p>Advanced matching algorithms to connect students with ideal job opportunities</p>
                        </div>
                        <div class="flex items-start space-x-4">
                            <i class="fas fa-check-circle text-blue-600 mt-1 text-2xl"></i>
                            <p>Streamlined recruitment process for both students and companies</p>
                        </div>
                    </div>
                    <div class="mt-8">
                        <a 
                            class="bg-blue-600 text-white px-8 py-3 rounded-lg hover:bg-blue-700 transition duration-300 inline-block"
                        >
                            Learn More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    <section class="top-colleges-section">
  <div class="container mx-auto px-4">
    <h2 align="center">Top Universities</h2>
    
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
      <div class="college-card p-6">
        <img src="images/bits.png" alt="BITS Pilani" />
        <h3>BITS Pilani</h3>
        <p>Birla Institute of Technology and Science, Pilani</p>
      </div>
      
      <div class="college-card p-6">
        <img src="images/iith.png" alt="IIM Ahmedabad" />
        <h3>IIT Hyderabad</h3>
        <p>Indian Institute of Technology, Hyderabad</p>
      </div>
      
      <div class="college-card p-6">
        <img src="images/iiit.png" alt="IIM Calcutta" />
        <h3>IIIT Guwahati</h3>
        <p>Indian Institute of Information Technology Guwahati</p>
      </div>
      
      <div class="college-card p-6">
        <img src="images/vit.png" alt="VNIT Nagpur" />
        <h3>VIT Chennai</h3>
        <p> Vellore Institute of Technology, Chennai</p>
      </div>
    </div>
  </div>
</section>
    
    <!-- Contact Us Section -->
    <section class="bg-gradient-to-br from-indigo-50 to-blue-100 py-16">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <div class="text-center mb-12">
                    <h2 class="text-4xl font-bold text-gray-800 mb-4">Contact Us</h2>
                    <p class="text-xl text-gray-600"><b>We're here to help you connect and succeed!!</b></p>
                </div>

                <div class="bg-white rounded-xl p-8">
                  <form id="contactForm" class="space-y-6">
    <div id="formErrors" class="hidden mb-4"></div>
    
    <div class="grid md:grid-cols-2 gap-6">
        <div>
            <label class="block text-gray-700 mb-2" for="name">Full Name</label>
            <input 
                type="text" 
                id="name" 
                name="name"
                class="advanced-input w-full" 
                placeholder="Enter your full name"
                required
            />
        </div>
        <div>
            <label class="block text-gray-700 mb-2" for="email">Email Address</label>
            <input 
                type="email" 
                id="email" 
                name="email"
                class="advanced-input w-full" 
                placeholder="Enter your email"
                required
            />
        </div>
    </div>

    <div>
        <label class="block text-gray-700 mb-2" for="subject">Subject</label>
        <input 
            type="text" 
            id="subject" 
            name="subject"
            class="advanced-input w-full" 
            placeholder="What can we help you with?"
            required
        />
    </div>

    <div>
        <label class="block text-gray-700 mb-2" for="message">Your Message</label>
        <textarea 
            id="message" 
            name="message"
            rows="4" 
            class="advanced-input w-full resize-none" 
            placeholder="Write your message here..."
            required
        ></textarea>
    </div>

    <div class="text-center">
        <button 
            type="submit" 
            class="bg-blue-600 text-white px-10 py-3 rounded-lg hover:bg-blue-700 transition duration-300 floating-element"
        >
            Send Message
        </button>
    </div>
</form>
                </div>

                <div class="mt-12 text-center">
                    <div class="grid md:grid-cols-3 gap-8">
                        <div class="hover-card p-6 bg-white rounded-xl shadow-md">
                            <i class="fas fa-map-marker-alt text-4xl text-blue-600 mb-4"></i>
                            <h4 class="font-semibold text-gray-800 mb-2">Our Location</h4>
                            <p class="text-gray-600">Hyderabad,Telangana</p>
                        </div>
                        <div class="hover-card p-6 bg-white rounded-xl shadow-md">
                            <i class="fas fa-phone text-4xl text-blue-600 mb-4"></i>
                            <h4 class="font-semibold text-gray-800 mb-2">Call Us</h4>
                            <p class="text-gray-600">(+91) 8912354387</p>
                        </div>
                        <div class="hover-card p-6 bg-white rounded-xl shadow-md">
                            <i class="fas fa-envelope text-4xl text-blue-600 mb-4"></i>
                            <h4 class="font-semibold text-gray-800 mb-2">Email Us</h4>
                            <p class="text-gray-600">info@placementportal.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    
     <jsp:include page="footer.jsp" />
    
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const contactForm = document.getElementById('contactForm');
        
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault(); 

            // Get form values
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const subject = document.getElementById('subject').value.trim();
            const message = document.getElementById('message').value.trim();

            // Basic validation
            const errors = [];

            if (name.length < 2) {
                errors.push('Please enter a valid name');
            }

            if (!email.includes('@') || email.length < 5) {
                errors.push('Please enter a valid email address');
            }

            if (subject.length < 3) {
                errors.push('Please enter a valid subject');
            }

            if (message.length < 10) {
                errors.push('Message is too short. Please provide more details.');
            }

            // Display or handle errors
            const errorContainer = document.getElementById('formErrors');
            if (errors.length > 0) {
                errorContainer.innerHTML = errors.map(error => 
                    `<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                        ${error}
                    </div>`
                ).join('');
                errorContainer.classList.remove('hidden');
                return;
            }

            // Clear previous errors
            errorContainer.innerHTML = '';
            errorContainer.classList.add('hidden');

            // Create URLSearchParams for form data
            const formData = new URLSearchParams();
            formData.append('name', name);
            formData.append('email', email);
            formData.append('subject', subject);
            formData.append('message', message);

            // Send form data via AJAX
            fetch('${pageContext.request.contextPath}/submit-contact', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    alert('Message sent successfully!\nThank you for contacting us.');
                    contactForm.reset();
                } else {
                    throw new Error('Failed to send message');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
        });
    });
</script>
    
</body>
</html>