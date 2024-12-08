package com.klef.jfsd.springboot.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Company;
import com.klef.jfsd.springboot.model.CompanyQuiz;
import com.klef.jfsd.springboot.model.CompanyQuizQuestion;
import com.klef.jfsd.springboot.model.JobApplication;
import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.repository.CompanyRepository;
import com.klef.jfsd.springboot.repository.JobApplicationRepository;
import com.klef.jfsd.springboot.repository.JobPostingRepository;
import com.klef.jfsd.springboot.service.CompanyQuizService;
import com.klef.jfsd.springboot.service.CompanyService;
import com.klef.jfsd.springboot.service.JobApplicationService;
import com.klef.jfsd.springboot.service.JobService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company")
public class CompanyController {
    
    @Autowired
    private CompanyService companyService;
    
    @Autowired
    private JobService jobService;
    
    @Autowired
    private JobPostingRepository post;
    
    @Autowired
    private JobApplicationRepository jobapp;
    
    @Autowired
    private CompanyRepository companyRepository;
    
    @Autowired
    private JobApplicationService jobApplicationService;

    @Autowired
    private CompanyQuizService companyQuizService;

    @GetMapping("/companyreg")
    public ModelAndView companyreg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("companyreg");
        return mv;
    }

//    @PostMapping("/register")
//    public ResponseEntity<?> registerCompany(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
//        Map<String, Object> response = new HashMap<>();
//
//        try {
//            // Retrieve parameters using request.getParameter()
//            String name = request.getParameter("companyname");
//            String email = request.getParameter("companyemail");
//            String phone = request.getParameter("companyphone");
//            String location = request.getParameter("companylocation");
//            String website = request.getParameter("companywebsite");
//            String pass = request.getParameter("pass");
//
//            // Check if a company with the same name already exists
//            Optional<Company> existingCompanyByName = companyRepository.findById(name);
//            if (existingCompanyByName.isPresent()) {
//                response.put("status", "error");
//                response.put("message", "A company with this name already exists.");
//                return ResponseEntity.badRequest().body(response);
//            }
//
//            // Check if a company with the same email already exists
//            Optional<Company> existingCompanyByEmail = companyRepository.findAll().stream()
//                    .filter(c -> c.getEmail().equals(email))
//                    .findFirst();
//            if (existingCompanyByEmail.isPresent()) {
//                response.put("status", "error");
//                response.put("message", "A company with this email already exists.");
//                return ResponseEntity.badRequest().body(response);
//            }
//
//            // Create a new Company object and set its properties
//            Company company = new Company();
//            company.setName(name);
//            company.setEmail(email);
//            company.setPhone(phone);
//            company.setLocation(location);
//            company.setWebsite(website);
//            company.setPassword(pass);
//
//            // Handle file upload for company logo
//            if (!file.isEmpty()) {
//                try {
//                    File tempFile = File.createTempFile("temp", file.getOriginalFilename());
//                    file.transferTo(tempFile);
//
//                    String base64Image = ImageUtil.encodeImageToBase64(tempFile);
//                    company.setBase64Image(base64Image);
//                    company.setImageType(file.getContentType());
//
//                    // Delete the temporary file
//                    tempFile.delete();
//                } catch (IOException e) {
//                    response.put("status", "error");
//                    response.put("message", "Error processing the company logo: " + e.getMessage());
//                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
//                }
//            }
//
//            // Save the company to the database
//            companyService.addCompany(company);
//
//            response.put("status", "success");
//            response.put("message", "Company registered successfully!");
//            return ResponseEntity.ok(response);
//
//        } catch (Exception e) {
//            response.put("status", "error");
//            response.put("message", "An error occurred during registration: " + e.getMessage());
//            return ResponseEntity.badRequest().body(response);
//        }
//    }

    @PostMapping("/register")
    public ModelAndView registerCompany(HttpServletRequest request, @RequestParam("file") MultipartFile file, Model model) {
        ModelAndView mv = new ModelAndView();
        try {
            // Retrieve parameters using request.getParameter()
            String name = request.getParameter("companyname");
            String email = request.getParameter("companyemail");
            String phone = request.getParameter("companyphone");
            String location = request.getParameter("companylocation");
            String website = request.getParameter("companywebsite");
            String pass = request.getParameter("pass");
            String status = "Registered";
            // Check if a company with the same name already exists
            Optional<Company> existingCompanyByName = companyRepository.findById(name);
            if (existingCompanyByName.isPresent()) {
                mv.addObject("error", "A company with this name already exists.");
                mv.setViewName("redirect:/company/companyreg?error=true");
                return mv;
            }

            // Check if a company with the same email already exists
            Optional<Company> existingCompanyByEmail = companyRepository.findAll().stream()
                    .filter(c -> c.getEmail().equals(email))
                    .findFirst();
            if (existingCompanyByEmail.isPresent()) {
                mv.addObject("error", "A company with this email already exists.");
                mv.setViewName("redirect:/company/companyreg?error=true");
                return mv;
            }

            // Create a new Company object and set its properties
            Company company = new Company();
            company.setName(name);
            company.setEmail(email);
            company.setPhone(phone);
            company.setLocation(location);
            company.setWebsite(website);
            company.setPassword(pass);
            company.setStatus(status);
            // Handle file upload for company logo
            if (!file.isEmpty()) {
                try {
                    File tempFile = File.createTempFile("temp", file.getOriginalFilename());
                    file.transferTo(tempFile);
                    String base64Image = ImageUtil.encodeImageToBase64(tempFile);
                    company.setBase64Image(base64Image);
                    company.setImageType(file.getContentType());
                    // Delete the temporary file
                    tempFile.delete();
                } catch (IOException e) {
                    mv.addObject("error", "Error processing the company logo: " + e.getMessage());
                    mv.setViewName("redirect:/company/companyreg?error=true");
                    return mv;
                }
            }

            // Save the company to the database
            companyService.addCompany(company);

            // Redirect to companylogin on successful registration
            mv.setViewName("redirect:/company?success=true");
            return mv;

        } catch (Exception e) {
            mv.addObject("error", "An error occurred during registration: " + e.getMessage());
            mv.setViewName("redirect:/company/companyreg?error=true");
            return mv;
        }
    }
    
    
    
    @GetMapping("companyhome")
    public ModelAndView companyhome(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        // Retrieve the logged-in company's name from session
        String companyName = (String) session.getAttribute("companyname");
        if (companyName == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }

        // Get the count of active jobs for the logged-in company
        Long activeJobCount = post.countActiveJobsByCompanyName(companyName);
        Long totalApplicationsCount = jobapp.countByCompanyName(companyName);
        Long interviewScheduledCount = jobapp.countByStatus("Interview Scheduled");


        // Add the count to the model
        mv.addObject("activeJobCount", activeJobCount);
        mv.addObject("totalApplicationsCount", totalApplicationsCount);
        mv.addObject("tis",interviewScheduledCount);
        mv.setViewName("companyhome");
        return mv;
    }

    @GetMapping("")
    public ModelAndView companylogin()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("companylogin");
    	return mv;
    }
    
    @PostMapping("/checkCompanylogin")
    public ModelAndView checkCompanyLogin(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Company company = companyService.checkCompanyLogin(email, password);
        
        ModelAndView mv = new ModelAndView();
        
        // Check if the company exists
        if (company != null) {
            String status = company.getStatus();
            
            if ("Accepted".equalsIgnoreCase(status)) {
            	
            	HttpSession session = request.getSession();
                session.setAttribute("company", company); // "student" is the session variable
                
                session.setAttribute("companyname", company.getName());
            	
            	
                mv.setViewName("redirect:/company/companyhome?success=true");
                
                
            } else if ("Registered".equalsIgnoreCase(status) || "Rejected".equalsIgnoreCase(status)) {
                // Redirect if the company status is "Registered" or "Rejected"
                mv.setViewName("redirect:/company?status=true");
            } else {
                // Handle other statuses if necessary
                mv.setViewName("redirect:/company?error=unknownStatus");
            }
        } else {
            // No company found with the provided email and password
            mv.setViewName("redirect:/company?error=loginFailed");
        }
        
        return mv;
    }
    
    @GetMapping("postjob")
    public ModelAndView postjob(Model model) {
        ModelAndView mv = new ModelAndView();
        List<String> companyNames = companyRepository.findAllCompanyNames();
        model.addAttribute("companyNames", companyNames);
        mv.setViewName("postjob");
        return mv;
    }
    
    @PostMapping("/addJob")
    public ModelAndView addJob(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        try {
            // Create a new JobPosting object
            JobPosting job = new JobPosting();
            
            // Set basic job details
            job.setJobTitle(request.getParameter("jobTitle"));
            job.setJobType(request.getParameter("jobType"));
            job.setJobLocation(request.getParameter("jobLocation"));
            job.setSkillsRequired(request.getParameter("skillsRequired"));
            job.setSalaryRange(request.getParameter("salaryRange"));
            job.setEducationLevel(request.getParameter("educationLevel"));
            job.setJobDescription(request.getParameter("jobDescription"));
            
            // Handle experience required (converting String to Integer)
            String expRequired = request.getParameter("experienceRequired");
            if (expRequired != null && !expRequired.trim().isEmpty()) {
                job.setExperienceRequired(Integer.parseInt(expRequired));
            }
            
            // Parse and set dates
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            String postingDateStr = request.getParameter("jobPostingDate");
            String lastDateStr = request.getParameter("lastDateToApply");
            
            if (postingDateStr != null && !postingDateStr.isEmpty()) {
                job.setJobPostingDate(dateFormat.parse(postingDateStr));
            }
            
            if (lastDateStr != null && !lastDateStr.isEmpty()) {
                job.setLastDateToApply(dateFormat.parse(lastDateStr));
            }
            
            // Handle company association
            String companyName = request.getParameter("company");
            Optional<Company> companyOpt = companyRepository.findById(companyName);
            
            if (!companyOpt.isPresent()) {
                mv.setViewName("redirect:/company/postjob?error=companyNotFound");
                return mv;
            }
            
            job.setCompany(companyOpt.get());
            
            // Save the job posting
            jobService.addjob(job);
            
            // Redirect to success page or job listings
            mv.setViewName("redirect:/company/viewjobs?success=true");
            return mv;
            
        } catch (ParseException e) {
            // Handle date parsing errors
            mv.setViewName("redirect:/company/postjob?error=dateFormat");
            return mv;
        } catch (NumberFormatException e) {
            // Handle number parsing errors
            mv.setViewName("redirect:/company/postjob?error=numberFormat");
            return mv;
        } catch (Exception e) {
            // Handle other errors
            mv.setViewName("redirect:/company/postjob?error=general");
            return mv;
        }
    }
    
    @GetMapping("companysessionexpiry")
    public ModelAndView companysessionexpiry()
    {
 	   ModelAndView mv=new ModelAndView();
 	   mv.setViewName("companysessionexpiry");
 	   return mv;
    }
    
    
    @RequestMapping("/**")
    public String handleInvalidMapping() {
        return "redirect:/company/pagenotfound";
    }
    
    @GetMapping("/pagenotfound")
    public ModelAndView pageNotFound() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Pagenotfound"); // This view should correspond to a 404 page
        return mv;
    }
    
    @GetMapping("/viewjobs")
    public ModelAndView viewCompanyJobs(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        // Get the logged-in company's name from session
        String companyName = (String) session.getAttribute("companyname");
        
        if (companyName == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        List<JobPosting> companyJobs = jobService.getJobsByCompanyName(companyName);
        mv.addObject("jobs", companyJobs);
        mv.setViewName("viewcompanyjobs");
        return mv;
    }
    
    
    @GetMapping("companylogout")
    public void adminlogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("company"); 

        // Redirect to the admin login page
        response.sendRedirect("/");
    }
    
    @GetMapping("/profile")
    public ModelAndView companyProfile(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        // Get company from session
        Company company = (Company) session.getAttribute("company");
        
        if (company == null) {
            // If no company in session, redirect to session expiry page
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        // Add company object to ModelAndView
        mv.addObject("company", company);
        mv.setViewName("companyprofile");
        return mv;
    }
    
    @GetMapping("changecompanypassword")
    public ModelAndView changePassword() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("changecompanypass");
        return mv;
    }
    
    
    @PostMapping("/updatepassword")
    public ModelAndView updatePassword(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        try {
            Company company = (Company) session.getAttribute("company");
            if (company == null) {
                mv.setViewName("redirect:/company/companysessionexpiry");
                return mv;
            }

            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            // First verify the current password
            if (!company.getPassword().equals(currentPassword)) {
                mv.setViewName("redirect:/company/changecompanypassword?error=currentPassword");
                return mv;
            }

            // Verify new password and confirm password match
            if (!newPassword.equals(confirmPassword)) {
                mv.setViewName("redirect:/company/changecompanypassword?error=mismatch");
                return mv;
            }

            // Update the password
            company.setPassword(newPassword);
            companyService.addCompany(company);

            // Update session with new password
            session.setAttribute("company", company);

            mv.setViewName("redirect:/company/changecompanypassword?passwordSuccess=true");
            return mv;

        } catch (Exception e) {
            mv.setViewName("redirect:/student/changecompanypassword?error=true");
            return mv;
        }
    }
    
    @GetMapping("/updateprofile")
    public ModelAndView showUpdateProfile(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Company company = (Company) session.getAttribute("company");
        if (company == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        mv.addObject("company", company);
        mv.setViewName("updatecompanyprofile");
        return mv;
    }
    
    @PostMapping("/updateProfile")
    public ModelAndView updateCompanyProfile(@RequestParam("file") MultipartFile file,
                                           HttpServletRequest request,
                                           HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {
            // Get the company from session
            Company company = (Company) session.getAttribute("company");
            
            if (company == null) {
                mv.setViewName("redirect:/company/companysessionexpiry");
                return mv;
            }

            // Update company details
            company.setEmail(request.getParameter("email"));
            company.setPhone(request.getParameter("phone"));
            company.setLocation(request.getParameter("location"));
            company.setWebsite(request.getParameter("website"));

            // Handle file upload if a new image is provided
            if (!file.isEmpty()) {
                try {
                    File tempFile = File.createTempFile("temp", file.getOriginalFilename());
                    file.transferTo(tempFile);
                    
                    String base64Image = ImageUtil.encodeImageToBase64(tempFile);
                    company.setBase64Image(base64Image);
                    company.setImageType(file.getContentType());
                    
                    tempFile.delete();
                } catch (IOException e) {
                    mv.addObject("errorMessage", "Error processing the company logo: " + e.getMessage());
                    mv.setViewName("updatecompanyprofile");
                    return mv;
                }
            }

            // Save the updated company
            companyService.addCompany(company);
            
            // Update session with new company details
            session.setAttribute("company", company);

            // Add success message and redirect
            mv.addObject("successMessage", "Profile updated successfully!");
            mv.setViewName("redirect:/company/profile?success=true");
            return mv;

        } catch (Exception e) {
            mv.addObject("errorMessage", "An error occurred while updating the profile: " + e.getMessage());
            mv.setViewName("updatecompanyprofile");
            return mv;
        }
    }
    
    @GetMapping("/applications")
    public ModelAndView viewCompanyApplications(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        // Get company name from session
        String companyName = (String) session.getAttribute("companyname");
        if (companyName == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        // Get all applications for this company
        List<JobApplication> applications = jobApplicationService.getApplicationsByCompanyName(companyName);
        mv.addObject("applications", applications);
        mv.setViewName("companyapplications");
        return mv;
    }
    
    @GetMapping("/application/{id}")
    public ModelAndView viewApplicationDetail(@PathVariable("id") Long id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        String companyName = (String) session.getAttribute("companyname");
        if (companyName == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        JobApplication application = jobApplicationService.getApplicationById(id);
        
        // Verify this application belongs to the logged-in company
        if (!application.getCompanyName().equals(companyName)) {
            mv.setViewName("redirect:/company/applications");
            return mv;
        }
        
        mv.addObject("application", application);
        mv.setViewName("applicationdetail");
        return mv;
    }
    
    @GetMapping("/application/{id}/resume")
    public ResponseEntity<ByteArrayResource> downloadResume(@PathVariable("id") Long id, HttpSession session) {
        String companyName = (String) session.getAttribute("companyname");
        if (companyName == null) {
            return ResponseEntity.badRequest().build();
        }

        JobApplication application = jobApplicationService.getApplicationById(id);

        // Verify this application belongs to the logged-in company
        if (!application.getCompanyName().equals(companyName)) {
            return ResponseEntity.badRequest().build();
        }

        ByteArrayResource resource = new ByteArrayResource(application.getResume());
        
        // Sanitize and set Content-Disposition header properly
        String filename = application.getResumeFileName().replaceAll("[^a-zA-Z0-9.]", "_");
        String contentDisposition = "attachment; filename=\"" + filename + "\"";
        
        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
            .contentLength(application.getResume().length)
            .contentType(MediaType.APPLICATION_OCTET_STREAM)
            .body(resource);
    }

    
    @PostMapping("/application/{id}/status")
    public ModelAndView updateApplicationStatus(
            @PathVariable("id") Long id, 
            String status,
            HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        String companyName = (String) session.getAttribute("companyname");
        if (companyName == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        JobApplication application = jobApplicationService.getApplicationById(id);
        
        // Verify this application belongs to the logged-in company
        if (!application.getCompanyName().equals(companyName)) {
            mv.setViewName("redirect:/company/applications");
            return mv;
        }
        
        // Update the status
        jobApplicationService.updateApplicationStatus(id, status);
        
        mv.setViewName("redirect:/company/application/" + id + "?success=true");
        return mv;
    }
    
    @GetMapping("/application/{id}/viewresume")
    public void viewResume(@PathVariable("id") Long id, HttpSession session, HttpServletResponse response) {
        try {
            // Verify company session
            String companyName = (String) session.getAttribute("companyname");
            if (companyName == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session expired");
                return;
            }

            // Fetch job application
            JobApplication application = jobApplicationService.getApplicationById(id);
            
            // Verify application belongs to the logged-in company
            if (!application.getCompanyName().equals(companyName)) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Unauthorized access");
                return;
            }

            // Check if resume exists
            if (application.getResume() == null || application.getResume().length == 0) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resume not found");
                return;
            }

            // Set content type 
            response.setContentType("application/pdf");
            
            // Set content disposition to inline to view in browser
            String filename = application.getResumeFileName().replaceAll("[^a-zA-Z0-9.-]", "_");
            response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
            
            // Write resume directly to response
            response.getOutputStream().write(application.getResume());
            response.getOutputStream().flush();
        } catch (IOException e) {
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error displaying resume");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
    
    @GetMapping("/job/edit/{jobId}")
    public ModelAndView editJob(@PathVariable("jobId") int jobId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        // Get company from session
        String companyName = (String) session.getAttribute("companyname");
        if (companyName == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        // Get job details
        JobPosting job = jobService.getJobById(jobId);
        
        // Verify job belongs to logged in company
        if (job == null || !job.getCompany().getName().equals(companyName)) {
            mv.setViewName("redirect:/company/viewjobs");
            return mv;
        }
        
        mv.addObject("job", job);
        mv.setViewName("editjob");
        return mv;
    }


@PostMapping("/job/update/{jobId}")
public ModelAndView updateJob(@PathVariable("jobId") int jobId, 
                            HttpServletRequest request, 
                            HttpSession session) {
    ModelAndView mv = new ModelAndView();
    
    try {
        String companyName = (String) session.getAttribute("companyname");
        if (companyName == null) {
            mv.setViewName("redirect:/company/companysessionexpiry");
            return mv;
        }
        
        JobPosting existingJob = jobService.getJobById(jobId);
        if (existingJob == null || !existingJob.getCompany().getName().equals(companyName)) {
            mv.setViewName("redirect:/company/viewjobs");
            return mv;
        }
        
        // Update job details
        existingJob.setJobTitle(request.getParameter("jobTitle"));
        existingJob.setJobType(request.getParameter("jobType"));
        existingJob.setJobLocation(request.getParameter("jobLocation"));
        existingJob.setSkillsRequired(request.getParameter("skillsRequired"));
        existingJob.setSalaryRange(request.getParameter("salaryRange"));
        existingJob.setEducationLevel(request.getParameter("educationLevel"));
        existingJob.setJobDescription(request.getParameter("jobDescription"));
        
        String expRequired = request.getParameter("experienceRequired");
        if (expRequired != null && !expRequired.trim().isEmpty()) {
            existingJob.setExperienceRequired(Integer.parseInt(expRequired));
        }
        
        // Parse and update dates
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        String lastDateStr = request.getParameter("lastDateToApply");
        if (lastDateStr != null && !lastDateStr.isEmpty()) {
            existingJob.setLastDateToApply(dateFormat.parse(lastDateStr));
        }
        
        // Update the job posting
        jobService.updateJob(existingJob);
        
        mv.setViewName("redirect:/company/viewjobs?updated=true");
        return mv;
        
    } catch (Exception e) {
        mv.setViewName("redirect:/company/job/edit/" + jobId + "?error=true");
        return mv;
    }
}

@PostMapping("/job/delete/{jobId}")
public ModelAndView deleteJob(@PathVariable("jobId") int jobId, HttpSession session) {
    ModelAndView mv = new ModelAndView();
    
    String companyName = (String) session.getAttribute("companyname");
    if (companyName == null) {
        mv.setViewName("redirect:/company/companysessionexpiry");
        return mv;
    }
    
    JobPosting job = jobService.getJobById(jobId);
    if (job != null && job.getCompany().getName().equals(companyName)) {
        jobService.deleteJob(jobId);
        mv.setViewName("redirect:/company/viewjobs?deleted=true");
    } else {
        mv.setViewName("redirect:/company/viewjobs?error=true");
    }
    
    return mv;
}


@GetMapping("/create-quiz")
public ModelAndView showCreateQuizPage(HttpSession session) {
    ModelAndView mv = new ModelAndView();
    String companyName = (String) session.getAttribute("companyname");
    
    if (companyName == null) {
        mv.setViewName("redirect:/company/companysessionexpiry");
        return mv;
    }
    
    mv.setViewName("company_create_quiz");
    return mv;
}

@PostMapping("/create-quiz")
public ModelAndView createQuiz(HttpServletRequest request, HttpSession session) {
    ModelAndView mv = new ModelAndView();
    
    String companyName = (String) session.getAttribute("companyname");
    if (companyName == null) {
        mv.setViewName("redirect:/company/companysessionexpiry");
        return mv;
    }
    
    Company company = (Company) session.getAttribute("company");
    
    CompanyQuiz quiz = new CompanyQuiz();
    quiz.setCompany(company);
    quiz.setTitle(request.getParameter("quiz_title"));
    quiz.setDescription(request.getParameter("quiz_description"));
    quiz.setDifficulty(request.getParameter("difficulty"));
    quiz.setDuration(Integer.parseInt(request.getParameter("duration")));
    quiz.setCreatedDate(new Date());
    
    session.setAttribute("currentQuiz", quiz);
    
    mv.setViewName("redirect:/company/add-quiz-questions");
    return mv;
}

@GetMapping("/add-quiz-questions")
public ModelAndView showAddQuizQuestionsPage(HttpSession session) {
    ModelAndView mv = new ModelAndView();
    
    CompanyQuiz quiz = (CompanyQuiz) session.getAttribute("currentQuiz");
    if (quiz == null) {
        mv.setViewName("redirect:/company/create-quiz");
        return mv;
    }
    
    mv.setViewName("company_add_quiz_questions");
    return mv;
}

@PostMapping("/add-quiz-questions")
public ModelAndView addQuizQuestions(HttpServletRequest request, HttpSession session) {
    ModelAndView mv = new ModelAndView();
    
    CompanyQuiz quiz = (CompanyQuiz) session.getAttribute("currentQuiz");
    if (quiz == null) {
        mv.setViewName("redirect:/company/create-quiz");
        return mv;
    }
    
    CompanyQuizQuestion question = new CompanyQuizQuestion();
    question.setQuestionText(request.getParameter("question_text"));
    question.setOption1(request.getParameter("option1"));
    question.setOption2(request.getParameter("option2"));
    question.setOption3(request.getParameter("option3"));
    question.setOption4(request.getParameter("option4"));
    question.setCorrectAnswer(request.getParameter("correct_answer"));
    
    quiz.addQuestion(question);
    
    String addMore = request.getParameter("add_more");
    if ("yes".equals(addMore)) {
        mv.setViewName("company_add_quiz_questions");
    } else {
        companyQuizService.saveQuiz(quiz);
        session.removeAttribute("currentQuiz");
        mv.setViewName("redirect:/company/view-quizzes");
    }
    
    return mv;
}

@GetMapping("/view-quizzes")
public ModelAndView viewCompanyQuizzes(HttpSession session) {
    ModelAndView mv = new ModelAndView();
    
    String companyName = (String) session.getAttribute("companyname");
    if (companyName == null) {
        mv.setViewName("redirect:/company/companysessionexpiry");
        return mv;
    }
    
    List<CompanyQuiz> quizzes = companyQuizService.getQuizzesByCompanyName(companyName);
    mv.addObject("quizzes", quizzes);
    mv.setViewName("company_view_quizzes");
    return mv;
}

@PostMapping("/quiz/delete/{quizId}")
public ModelAndView deleteQuiz(@PathVariable("quizId") Long quizId, HttpSession session) {
    ModelAndView mv = new ModelAndView();
    
    String companyName = (String) session.getAttribute("companyname");
    if (companyName == null) {
        mv.setViewName("redirect:/company/companysessionexpiry");
        return mv;
    }
    
    Optional<CompanyQuiz> quizOptional = companyQuizService.getQuizById(quizId);
    
    if (quizOptional.isPresent()) {
        CompanyQuiz quiz = quizOptional.get();
        if (quiz.getCompany().getName().equals(companyName)) {
            companyQuizService.deleteQuiz(quizId);
            mv.setViewName("redirect:/company/view-quizzes?deleted=true");
        } else {
            mv.setViewName("redirect:/company/view-quizzes?error=unauthorized");
        }
    } else {
        mv.setViewName("redirect:/company/view-quizzes?error=notfound");
    }
    
    return mv;
}


}
