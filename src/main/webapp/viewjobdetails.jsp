<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/lucide/0.263.1/lucide.min.js"></script>
    
    <link rel="icon" href="/images/SUPERSET.png">
    <style>
       body {
    font-family: 'Inter', system-ui, -apple-system, sans-serif;
    background: #f8fafc url('/images/gdsc.jpg') no-repeat center center;
    background-size: cover;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    color: #1e293b;
}

        .container {
            max-width: 800px;
            width: 90%;
            padding: 6rem;
            margin: 2rem auto;
            background-color: #ffffff;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            border-radius: 1rem;
            justify-content: center;
        }

        .job-title-container {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #e2e8f0;
        }

        .job-title {
            font-size: 2rem;
            font-weight: 700;
            color: skyblue; /* Sky blue color */
            margin-bottom: 0.5rem;
        }

        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            align-items: center;
            margin-top: 2rem;
        }

        .detail-row {
            display: contents;
        }

        .detail-label {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            gap: 0.5rem;
            padding: 1rem;
            background-color: #f8fafc;
            border-radius: 0.5rem;
            font-weight: 600;
            color: #475569;
        }

        .detail-value {
            padding: 1rem;
            background-color: #ffffff;
            border-radius: 0.5rem;
            border: 1px solid #e2e8f0;
            color: #1e293b;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .detail-label i {
            color: #3b82f6;
            font-size: 1.25rem;
            width: 24px;
            text-align: center;
        }

        .btn-container {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 2px solid #e2e8f0;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            color: #ffffff;
            background-color: #3b82f6;
            border: none;
            border-radius: 0.5rem;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
        }

        .btn-back {
            background-color: #64748b;
        }

        .btn-back:hover {
            background-color: #475569;
        }

        @media (max-width: 640px) {
            .container {
                padding: 1rem;
                margin: 1rem;
                width: calc(100% - 2rem);
            }

            .details-grid {
                grid-template-columns: 1fr;
                gap: 0.5rem;
            }

            .btn-container {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
        .subtitle {
    font-weight: bold;
    font-size: 20px; /* Adjust the size as needed */
  }
    </style>
</head>
<body>
    <jsp:include page="studentnavbar.jsp" />
    
    <div class="container">
        <div class="job-title-container">
            <h1 class="job-title">${job.jobTitle}🧑‍💻</h1>
            <div class="subtitle">Join our team and make a difference...Job Details are Below..👇</div>
        </div>

        <div class="details-grid">
            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-building"></i>
                    Company
                </div>
                <div class="detail-value">${job.company.name}</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-briefcase"></i>
                    Job Type
                </div>
                <div class="detail-value">${job.jobType}</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-map-marker-alt"></i>
                    Location
                </div>
                <div class="detail-value">${job.jobLocation}</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-dollar-sign"></i>
                    Salary Range
                </div>
                <div class="detail-value">${job.salaryRange}</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-history"></i>
                    Experience Required
                </div>
                <div class="detail-value">${job.experienceRequired} years</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-graduation-cap"></i>
                    Education Level
                </div>
                <div class="detail-value">${job.educationLevel}</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-tools"></i>
                    Skills Required
                </div>
                <div class="detail-value">${job.skillsRequired}</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-info-circle"></i>
                    Job Description
                </div>
                <div class="detail-value">${job.jobDescription}</div>
            </div>

            <div class="detail-row">
                <div class="detail-label">
                    <i class="fas fa-calendar-times"></i>
                    Application Deadline
                </div>
                <div class="detail-value">${job.lastDateToApply}</div>
            </div>
        </div>

        <div class="btn-container">
            <button class="btn" onclick="location.href='/student/apply/${job.jobId}'" >
                <i class="fas fa-paper-plane"></i>
                Apply for this job
            </button>
            <button class="btn btn-back" onclick="goBack()">
                <i class="fas fa-arrow-left"></i>
                Back
            </button>
        </div>
    </div>

    <script>
        function applyForJob(jobId) {
            window.location.href = "/student/apply/" + jobId;
        }
        
        function goBack() {
            window.history.back();
        }
        document.addEventListener("DOMContentLoaded", () => {
            lucide.createIcons();
        });

    </script>
</body>
</html>