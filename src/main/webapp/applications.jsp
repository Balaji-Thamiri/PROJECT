<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Applications</title>
    <link rel="icon" href="/images/SUPERSET.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        
    
    <style>
        .application-card {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border-left: 4px solid transparent;
        }
        .application-card:hover {
            border-left-color: #3B82F6;
            transform: translateX(5px);
            background-color: #F8FAFC;
        }
        .modal {
            transition: opacity 0.3s ease-in-out;
            backdrop-filter: blur(5px);
        }
        .modal-content {
            transform: scale(0.95);
            transition: transform 0.3s ease-in-out;
        }
        .modal.active .modal-content {
            transform: scale(1);
        }
    </style>
</head>
<body class="bg-gray-50">
    <jsp:include page="companynavbar.jsp" />

    <div class="max-w-7xl mx-auto px-4 py-8">
        <!-- Header Section -->
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6" data-aos="fade-down">
            <div>
                <h1 class="text-3xl font-bold text-gray-800 mb-2">Job Applications</h1>
                <p class="text-gray-600">Manage and review your candidate applications</p>
            </div>
            
            <!-- Filters -->
            <div class="flex flex-wrap gap-4 mt-4 md:mt-0">
                <div class="relative">
                    <select class="appearance-none bg-white border border-gray-300 rounded-lg py-2 px-4 pr-8 leading-tight focus:outline-none focus:border-blue-500 focus:ring focus:ring-blue-200">
                        <option>All Jobs</option>
                        <option>Software Engineer</option>
                        <option>Product Manager</option>
                        <option>UI Designer</option>
                    </select>
                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
                        </svg>
                    </div>
                </div>
                
                <div class="relative">
                    <select class="appearance-none bg-white border border-gray-300 rounded-lg py-2 px-4 pr-8 leading-tight focus:outline-none focus:border-blue-500 focus:ring focus:ring-blue-200">
                        <option>All Status</option>
                        <option>New</option>
                        <option>Reviewed</option>
                        <option>Interviewed</option>
                        <option>Rejected</option>
                    </select>
                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
                        </svg>
                    </div>
                </div>
            </div>
        </div>

        <!-- Applications List -->
        <div class="space-y-4">
            <!-- Sample Application Cards -->
            <div class="application-card bg-white rounded-lg shadow-sm p-6" data-aos="fade-up">
                <div class="flex flex-col md:flex-row justify-between">
                    <div class="flex items-start space-x-4">
                        <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" 
                             alt="Applicant" 
                             class="w-12 h-12 rounded-full border-2 border-gray-200">
                        <div>
                            <h3 class="font-semibold text-lg text-gray-800">John Doe</h3>
                            <p class="text-gray-600">Senior Software Engineer</p>
                            <div class="flex items-center mt-2 space-x-4">
                                <span class="text-sm text-gray-500 flex items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                                    </svg>
                                    john.doe@example.com
                                </span>
                                <span class="text-sm text-gray-500 flex items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                    </svg>
                                    +1 234 567 890
                                </span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-4 md:mt-0 flex items-center space-x-3">
                        <span class="px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                            New
                        </span>
                        <button onclick="openModal('applicationModal')" 
                                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition duration-300">
                            View Details
                        </button>
                    </div>
                </div>
            </div>

            <!-- More application cards... -->
        </div>
    </div>

    <!-- Application Details Modal -->
    <div id="applicationModal" class="modal fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
        <div class="modal-content bg-white rounded-xl max-w-2xl w-full mx-4 p-6">
            <div class="flex justify-between items-start mb-4">
                <h2 class="text-2xl font-bold text-gray-800">Application Details</h2>
                <button onclick="closeModal('applicationModal')" class="text-gray-500 hover:text-gray-700">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
            
            <div class="space-y-6">
                <!-- Applicant Info -->
                <div class="flex items-center space-x-4">
                    <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" 
                         alt="Applicant" 
                         class="w-16 h-16 rounded-full">
                    <div>
                        <h3 class="text-xl font-semibold text-gray-800">John Doe</h3>
                        <p class="text-gray-600">Senior Software Engineer</p>
                    </div>
                </div>

                <!-- Application Status -->
                <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
                    <div>
                        <p class="text-sm text-gray-600">Current Status</p>
                        <p class="font-semibold text-gray-800">New Application</p>
                    </div>
                    <select class="rounded-lg border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-200">
                        <option>New</option>
                        <option>Under Review</option>
                        <option>Shortlisted</option>
                        <option>Rejected</option>
                    </select>
                </div>

                <!-- Contact Information -->
                <div>
                    <h4 class="font-semibold text-gray-800 mb-2">Contact Information</h4>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <p class="text-sm text-gray-600">Email</p>
                            <p class="font-medium">john.doe@example.com</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Phone</p>
                            <p class="font-medium">+1 234 567 890</p>
                        </div>
                    </div>
                </div>

                <!-- Resume Preview -->
                <div>
                    <h4 class="font-semibold text-gray-800 mb-2">Resume</h4>
                    <div class="border rounded-lg p-4 flex items-center justify-between">
                        <div class="flex items-center">
                            <svg class="w-8 h-8 text-red-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
                            </svg>
                            <div>
                                <p class="font-medium">John_Doe_Resume.pdf</p>
                                <p class="text-sm text-gray-500">PDF, 2.4 MB</p>
                            </div>
                        </div>
                        <button class="text-blue-600 hover:text-blue-700">Download</button>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex justify-end space-x-3">
                    <button class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
                        Reject
                    </button>
                    <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                        Schedule Interview
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Initialize AOS
        AOS.init({
            duration: 800,
            once: true
        });

        // Modal Functions
        function openModal(modalId) {
            const modal = document.getElementById(modalId);
            modal.classList.remove('hidden');
            modal.classList.add('flex');
            setTimeout(() => {
                modal.classList.add('active');
            }, 10);
        }

        function closeModal(modalId) {
            const modal = document.getElementById(modalId);
            modal.classList.remove('active');
            setTimeout(() => {
                modal.classList.remove('flex');
                modal.classList.add('hidden');
            }, 300);
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modals = document.getElementsByClassName('modal');
            Array.from(modals).forEach(modal => {
                if (event.target === modal) {
                    closeModal(modal.id);
                }
            });
        }
    </script>
</body>
</html>