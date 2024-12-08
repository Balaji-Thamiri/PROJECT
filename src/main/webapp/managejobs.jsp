<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Jobs</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <style>
        .job-card {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .job-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            border-color: #3B82F6;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            min-width: 160px;
            z-index: 50;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body class="bg-gray-50">
    <jsp:include page="companynavbar.jsp" />

    <div class="max-w-7xl mx-auto px-4 py-8">
        <!-- Header Section -->
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8" data-aos="fade-down">
            <div>
                <h1 class="text-3xl font-bold text-gray-800 mb-2">Manage Jobs</h1>
                <p class="text-gray-600">Create and manage your job postings</p>
            </div>
            
            <button onclick="location.href='postjob.jsp'" 
                    class="mt-4 md:mt-0 inline-flex items-center px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition duration-300">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24<boltAction type="file" filePath="managejobs.jsp">">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
                Post New Job
            </button>
        </div>

        <!-- Search and Filter Section -->
        <div class="bg-white rounded-xl shadow-sm p-6 mb-8" data-aos="fade-up">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="relative">
                    <input type="text" 
                           placeholder="Search jobs..." 
                           class="w-full pl-10 pr-4 py-2 rounded-lg border border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-200">
                    <svg class="w-5 h-5 text-gray-500 absolute left-3 top-2.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </div>
                
                <div class="relative">
                    <select class="w-full appearance-none rounded-lg border border-gray-300 py-2 px-4 pr-8 focus:border-blue-500 focus:ring focus:ring-blue-200">
                        <option>All Status</option>
                        <option>Active</option>
                        <option>Paused</option>
                        <option>Closed</option>
                    </select>
                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
                        </svg>
                    </div>
                </div>
                
                <div class="relative">
                    <select class="w-full appearance-none rounded-lg border border-gray-300 py-2 px-4 pr-8 focus:border-blue-500 focus:ring focus:ring-blue-200">
                        <option>Sort By: Newest First</option>
                        <option>Sort By: Oldest First</option>
                        <option>Sort By: Most Applications</option>
                        <option>Sort By: Least Applications</option>
                    </select>
                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
                        </svg>
                    </div>
                </div>
            </div>
        </div>

        <!-- Jobs List -->
        <div class="space-y-6">
            <!-- Sample Job Cards -->
            <div class="job-card bg-white rounded-xl border border-gray-200 p-6" data-aos="fade-up">
                <div class="flex flex-col lg:flex-row justify-between">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-4">
                            <h2 class="text-xl font-semibold text-gray-800">Senior Software Engineer</h2>
                            <span class="px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                                Active
                            </span>
                        </div>
                        
                        <div class="space-y-3">
                            <div class="flex items-center text-gray-600">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                </svg>
                                San Francisco, CA (Remote)
                            </div>
                            
                            <div class="flex items-center text-gray-600">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                                Posted 2 days ago
                            </div>
                            
                            <div class="flex items-center text-gray-600">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                                </svg>
                                32 Applications
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-4 lg:mt-0 flex flex-col justify-between items-end">
                        <div class="dropdown relative">
                            <button class="p-2 hover:bg-gray-100 rounded-lg">
                                <svg class="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                            <div class="dropdown-content mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5">
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Edit Job</a>
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">View Applications</a>
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Pause Listing</a>
                                <a href="#" class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100">Delete</a>
                            </div>
                        </div>
                        
                        <div class="flex space-x-3 mt-4">
                            <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-lg hover:bg-gray-200">
                                Preview
                            </button>
                            <button class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700">
                                View Applications
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add more job cards here -->
        </div>
    </div>

    <script>
        // Initialize AOS
        AOS.init({
            duration: 800,
            once: true
        });

        // Add any additional JavaScript functionality here
    </script>
</body>
</html>