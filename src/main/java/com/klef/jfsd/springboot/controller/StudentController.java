package com.klef.jfsd.springboot.controller;


import com.klef.jfsd.springboot.model.CompanyQuiz;
import com.klef.jfsd.springboot.model.CompanyQuizQuestion;
import com.klef.jfsd.springboot.model.JobApplication;
import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentQuizAttempt;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.CompanyQuizService;
import com.klef.jfsd.springboot.service.JobApplicationService;
import com.klef.jfsd.springboot.service.StudentQuizAttemptService;
import com.klef.jfsd.springboot.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    
    @Autowired
    private AdminService adminService;
    
     @Autowired
     private StudentRepository studentRepository;
    
    @Autowired
    private JobApplicationService jobApplicationService;
    
    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired
    private CompanyQuizService companyQuizService;
    
    
    @Autowired
    private StudentQuizAttemptService studentQuizAttemptService;

    private Map<String, String> otpStore = new HashMap<>(); // Store email -> OTP mapping
    private Map<String, LocalDateTime> otpTimestamp = new HashMap<>(); // Store OTP creation time

    

    @GetMapping("studentreg")
    public ModelAndView studentreg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentreg");
        return mv;
    }
    
    
//    @PostMapping("register")
//    public ResponseEntity<?> registerStudent(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
//        Map<String, Object> response = new HashMap<>();
//
//        try {
//            // Retrieve parameters using request.getParameter()
//            String firstName = request.getParameter("firstName");
//            String lastName = request.getParameter("lastName");
//            String universityId = request.getParameter("universityId");
//            String email = request.getParameter("email");
//            String phone = request.getParameter("phone");
//            String dob = request.getParameter("dob");
//            String gender = request.getParameter("gender");
//            String degree = request.getParameter("degree");
//            String branch = request.getParameter("branch");
//            double cgpa = Double.parseDouble(request.getParameter("cgpa"));
//            int graduationYear = Integer.parseInt(request.getParameter("gradYear"));
//            String password = request.getParameter("password");
//
//            // Create a new Student object and set its properties
//            Student student = new Student();
//            student.setFirstName(firstName);
//            student.setLastName(lastName);
//            student.setUniversityId(universityId);
//            student.setEmail(email);
//            student.setPhone(phone);
//            student.setDateOfBirth(dob);
//            student.setGender(gender);
//            student.setDegree(degree);
//            student.setBranch(branch);
//            student.setCgpa(cgpa);
//            student.setGraduationYear(graduationYear);
//            student.setPassword(password);
//
//            // Handle file upload
//            if (!file.isEmpty()) {
//                try {
//                    File tempFile = File.createTempFile("temp", file.getOriginalFilename());
//                    file.transferTo(tempFile);
//
//                    String base64Image = ImageUtil.encodeImageToBase64(tempFile);
//
//                    student.setBase64Image(base64Image);
//                    student.setImageType(file.getContentType());
//
//                    // Delete the temporary file
//                    tempFile.delete();
//                } catch (IOException e) {
//                    response.put("status", "error");
//                    response.put("message", "Error processing the image: " + e.getMessage());
//                    return ResponseEntity.badRequest().body(response);
//                }
//            }
//
//            // Check for existing student with the same email or universityId
//            if (studentService.existsByEmail(student.getEmail())) {
//                response.put("status", "error");
//                response.put("message", "A student with this email already exists.");
//                return ResponseEntity.badRequest().body(response);
//            }
//
//            if (studentService.existsByUniversityId(student.getUniversityId())) {
//                response.put("status", "error");
//                response.put("message", "A student with this university ID already exists.");
//                return ResponseEntity.badRequest().body(response);
//            }
//
//            // Save the student
//            studentService.saveStudent(student);
//
//            response.put("status", "success");
//            response.put("message", "Student registered successfully!");
//            return ResponseEntity.ok(response);
//
//        } catch (NumberFormatException e) {
//            response.put("status", "error");
//            response.put("message", "Invalid number format for CGPA or graduation year.");
//            return ResponseEntity.badRequest().body(response);
//        } catch (Exception e) {
//            response.put("status", "error");
//            response.put("message", "An error occurred during registration: " + e.getMessage());
//            return ResponseEntity.badRequest().body(response);
//        }
//    }
    
    
    @PostMapping("/register")
    public ModelAndView registerStudent(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
        ModelAndView mv = new ModelAndView();
        
        try {
            // Retrieve parameters using request.getParameter()
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String universityname = request.getParameter("universityname");
            String universityId = request.getParameter("universityId");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String degree = request.getParameter("degree");
            String branch = request.getParameter("branch");
            double cgpa = Double.parseDouble(request.getParameter("cgpa"));
            int graduationYear = Integer.parseInt(request.getParameter("gradYear"));
            String password = request.getParameter("password");
            String status = "Registered";
            // Create a new Student object and set its properties
            Student student = new Student();
            student.setFirstName(firstName);
            student.setLastName(lastName);
            student.setUniversityname(universityname);
            student.setUniversityId(universityId);
            student.setEmail(email);
            student.setPhone(phone);
            student.setDateOfBirth(dob);
            student.setGender(gender);
            student.setDegree(degree);
            student.setBranch(branch);
            student.setCgpa(cgpa);
            student.setGraduationYear(graduationYear);
            student.setPassword(password);
            student.setStatus(status);
            // Handle file upload
            if (!file.isEmpty()) {
                try {
                    File tempFile = File.createTempFile("temp", file.getOriginalFilename());
                    file.transferTo(tempFile);

                    String base64Image = ImageUtil.encodeImageToBase64(tempFile);

                    student.setBase64Image(base64Image);
                    student.setImageType(file.getContentType());

                    // Delete the temporary file
                    tempFile.delete();
                } catch (IOException e) {
                    mv.addObject("error", "Error processing the image: " + e.getMessage());
                    mv.setViewName("redirect:/student/studentreg?error=true");
                    return mv;
                }
            }

            // Check for existing student with the same email or universityId
            if (studentService.existsByEmail(student.getEmail())) {
                mv.addObject("error", "A student with this email already exists.");
                mv.setViewName("redirect:/student/studentreg?error=true");
                return mv;
            }

            if (studentService.existsByUniversityId(student.getUniversityId())) {
                mv.addObject("error", "A student with this university ID already exists.");
                mv.setViewName("redirect:/student/studentreg?error=true");
                return mv;
            }

            // Save the student
            studentService.saveStudent(student);

            // Redirect to login page on successful registration
            mv.setViewName("redirect:/student?successful=true");
            return mv;

        } catch (NumberFormatException e) {
            mv.addObject("error", "Invalid number format for CGPA or graduation year.");
            mv.setViewName("redirect:/student/studentreg?error=true");
            return mv;
        } catch (Exception e) {
            mv.addObject("error", "An error occurred during registration: " + e.getMessage());
            mv.setViewName("redirect:/student/studentreg?error=true");
            return mv;
        }
    }
    
    
    
    @GetMapping("/viewall") // New endpoint for viewing all students
    public ModelAndView viewAllStudents() {
        ModelAndView mv = new ModelAndView();
        List<Student> students = studentService.getAllStudents(); // Fetch all students
        mv.addObject("students", students); 
        mv.setViewName("viewallstudents"); 
        return mv;
    }
    
    @GetMapping("studenthome")
    public ModelAndView studenthome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studenthome");
        long jobcount= studentService.JobCount();
        mv.addObject("jc",jobcount);
        long companycount = adminService.companycount();
        mv.addObject("cc",companycount);
        long acceptedCount = adminService.studentcountAccepted();
        mv.addObject("acceptedcount", acceptedCount);
        
        List<JobPosting> topJobs = studentService.getAllJobs().stream()
                .limit(3)
                .collect(Collectors.toList());

mv.addObject("topJobs", topJobs);

        
        return mv;
    }
    
    @GetMapping("")
    public ModelAndView studentlogin()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("studentlogin");
    	return mv;
    }
    
    @PostMapping("/checkstudentlogin")
    public ModelAndView checkstudentlogin(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Student student = studentService.checkStudentLogin(email, password);
        ModelAndView mv = new ModelAndView();

        if (student != null) {
            if ("Accepted".equalsIgnoreCase(student.getStatus())) {
                // Create a session and set the student as an attribute
                HttpSession session = request.getSession();
                session.setAttribute("student", student); // "student" is the session variable

                mv.setViewName("redirect:/student/studenthome?success=true");
            } else if ("Registered".equalsIgnoreCase(student.getStatus()) || "Rejected".equalsIgnoreCase(student.getStatus())) {
                mv.setViewName("redirect:/student?status=true");
            } else {
                mv.setViewName("redirect:/student?error=unknownStatus");
            }
        } else {
            mv.setViewName("redirect:/student?error=loginFailed");
        }

        return mv;
    }

    
    @GetMapping("studentsessionexpiry")
    public ModelAndView studentsessionexpiry()
    {
 	   ModelAndView mv=new ModelAndView();
 	   mv.setViewName("studentsessionexpiry");
 	   return mv;
    }
    
    
    @RequestMapping("/**")
    public String handleInvalidMapping() {
        return "redirect:/student/pagenotfound";
    }
    
    @GetMapping("/pagenotfound")
    public ModelAndView pageNotFound() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Pagenotfound"); // This view should correspond to a 404 page
        return mv;
    }
    
    @GetMapping("studentlogout")
    public void adminlogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("student"); // employee is the session variable

        // Redirect to the admin login page
        response.sendRedirect("/");
    }

    @GetMapping("studentprofile")
    public ModelAndView studentprofile()
    {
    	 ModelAndView mv = new ModelAndView();
         mv.setViewName("studentprofile"); 
         return mv;
    }
    
    @GetMapping("editstudentprofile")
    public ModelAndView editstudentprofile()
    {
    	 ModelAndView mv = new ModelAndView();
         mv.setViewName("editstudentprofile"); 
         return mv;
    }
    
    @PostMapping("/updatestudentprofile")
    public ModelAndView updateStudentProfile(HttpServletRequest request, @RequestParam("file") MultipartFile file, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {
            Student student = (Student) session.getAttribute("student");
            if (student == null) {
                mv.setViewName("redirect:/student/studentsessionexpiry");
                return mv;
            }

            // Retrieve updated information from the request
//            String firstName = request.getParameter("firstName");
//            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");

            // Update the student object
//            student.setFirstName(firstName);
//            student.setLastName(lastName);
            student.setPhone(phone);
            student.setDateOfBirth(dob);
            student.setGender(gender);

            // Handle profile image update
            if (!file.isEmpty()) {
                try {
                    File tempFile = File.createTempFile("temp", file.getOriginalFilename());
                    file.transferTo(tempFile);

                    String base64Image = ImageUtil.encodeImageToBase64(tempFile);

                    student.setBase64Image(base64Image);
                    student.setImageType(file.getContentType());

                    // Delete the temporary file
                    tempFile.delete();
                } catch (IOException e) {
                    mv.addObject("error", "Error processing the image: " + e.getMessage());
                    mv.setViewName("redirect:/student/editstudentprofile?error=true");
                    return mv;
                }
            }

            // Save the updated student
            studentService.saveStudent(student);

            // Update the session attribute
            session.setAttribute("student", student);

            // Redirect to the student profile page
            mv.setViewName("redirect:/student/studentprofile?success=true");
            return mv;
        } catch (Exception e) {
            mv.addObject("error", "An error occurred while updating the profile: " + e.getMessage());
            mv.setViewName("redirect:/student/editstudentprofile?error=true");
            return mv;
        }
    }
    
    @GetMapping("/viewalljobs")
    public ModelAndView viewallJobs()
    {
        ModelAndView mv = new ModelAndView("viewalljobs");
        List<JobPosting> jobs = studentService.getAllJobs();
        mv.addObject("jobs", jobs);
        return mv;
    }
    
    
    @GetMapping("/job/{jobId}")
    public ModelAndView viewJobDetails(@PathVariable("jobId") int jobId, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        // Fetch the job details from the database
        JobPosting job = studentService.getJobById(jobId);

        if (job != null) {
            mv.addObject("job", job);
            mv.setViewName("viewjobdetails");
        } else {
            // Handle the case where the job is not found
            mv.setViewName("redirect:/student/viewalljobs");
        }

        return mv;
    }
    
    @PostMapping("/updatepassword")
    public ModelAndView updatePassword(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        try {
            Student student = (Student) session.getAttribute("student");
            if (student == null) {
                mv.setViewName("redirect:/student/studentsessionexpiry");
                return mv;
            }

            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            // First verify the current password
            if (!student.getPassword().equals(currentPassword)) {
                mv.setViewName("redirect:/student/changestudentpassword?error=currentPassword");
                return mv;
            }

            // Verify new password and confirm password match
            if (!newPassword.equals(confirmPassword)) {
                mv.setViewName("redirect:/student/changestudentpassword?error=mismatch");
                return mv;
            }

            // Update the password
            student.setPassword(newPassword);
            studentService.saveStudent(student);

            // Update session with new password
            session.setAttribute("student", student);

            mv.setViewName("redirect:/student/changestudentpassword?passwordSuccess=true");
            return mv;

        } catch (Exception e) {
            mv.setViewName("redirect:/student/changestudentpassword?error=true");
            return mv;
        }
    }
    
    @GetMapping("changestudentpassword")
    public ModelAndView changePassword() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("changestudentpassword");
        return mv;
    }
    
    
    @GetMapping("/apply/{jobId}")
    public ModelAndView showJobApplicationForm(@PathVariable("jobId") int jobId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }
        
        JobPosting job = studentService.getJobById(jobId);
        if (job == null) {
            mv.setViewName("redirect:/student/viewalljobs");
            return mv;
        }
        
        // Check if student has already applied
        if (jobApplicationService.hasStudentAppliedToJob(student.getEmail(), job.getJobTitle())) {
            mv.setViewName("redirect:/student/viewalljobs?success=true");
            return mv;
        }
        
        mv.addObject("job", job);
        mv.addObject("student", student);
        mv.setViewName("jobapplicationform");
        return mv;
    }

    
    @PostMapping("/submitapplication")
    public ModelAndView submitJobApplication(
            HttpServletRequest request,
            @RequestParam("resume") MultipartFile resumeFile,
            HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        try {
            Student student = (Student) session.getAttribute("student");
            if (student == null) {
                mv.setViewName("redirect:/student/studentsessionexpiry");
                return mv;
            }
            
            JobApplication application = new JobApplication();
            application.setStudentName(student.getFirstName() + " " + student.getLastName());
            application.setStudentEmail(student.getEmail());
            application.setCompanyName(request.getParameter("companyName"));
            application.setJobName(request.getParameter("jobName"));
            application.setPhoneNumber(request.getParameter("phoneNumber"));
            application.setWorkExperience(request.getParameter("workExperience"));
            application.setSkills(request.getParameter("skills"));
            application.setLinkedinProfile(request.getParameter("linkedinProfile"));
            
            if (!resumeFile.isEmpty()) {
                application.setResume(resumeFile.getBytes());
                application.setResumeFileName(resumeFile.getOriginalFilename());
            }
            
            jobApplicationService.saveApplication(application);
            
            mv.setViewName("redirect:/student/myapplications?success=true");
            return mv;
            
        } catch (Exception e) {
            mv.setViewName("redirect:/student/viewalljobs?error=true");
            return mv;
        }
    }

    @GetMapping("/myapplications")
    public ModelAndView viewMyApplications(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }
        
        List<JobApplication> applications = 
            jobApplicationService.getApplicationsByStudentEmail(student.getEmail());
        mv.addObject("applications", applications);
        mv.setViewName("myapplications");
        return mv;
    }

    
    @GetMapping("eventreg")
    public ModelAndView eventreg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("eventreg");
        return mv;
    }
    
    
    @PostMapping("/withdraw/{applicationId}")
    public ModelAndView withdrawApplication(@PathVariable("applicationId") Long applicationId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        // Check if student is logged in
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }
        
        try {
            // Get the application
            JobApplication application = jobApplicationService.getApplicationById(applicationId);
            
            // Verify that this application belongs to the logged-in student
            if (!application.getStudentEmail().equals(student.getEmail())) {
                mv.setViewName("redirect:/student/myapplications?error=unauthorized");
                return mv;
            }
            
            // Delete the application
            jobApplicationService.deleteApplication(applicationId);
            
            mv.setViewName("redirect:/student/myapplications?withdrawn=true");
            return mv;
            
        } catch (Exception e) {
            mv.setViewName("redirect:/student/myapplications?error=true");
            return mv;
        }
    }
    
    @GetMapping("forgotpass")
    public ModelAndView forgotpass() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forgotpassword");
        return mv;
    }
    
    
    @PostMapping("/forgotpassword")
    public ModelAndView forgotPassword(@RequestParam("email") String email) {
        ModelAndView mv = new ModelAndView();
        
        try {
            Student student = studentRepository.findByEmail(email);
            if (student == null) {
                mv.setViewName("redirect:/student?error=emailNotFound");
                return mv;
            }

            // Generate OTP
            String otp = generateOTP();
            
            // Store OTP with timestamp
            otpStore.put(email, otp);
            otpTimestamp.put(email, LocalDateTime.now());

            // Send OTP email
            sendOTPEmail(email, otp);

            // Redirect to OTP verification page
            mv.setViewName("redirect:/student/verifyotp?email=" + email);
            return mv;
            
        } catch (Exception e) {
            mv.setViewName("redirect:/student?error=forgotPasswordError");
            return mv;
        }
    }

    private String generateOTP() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(1000000));
    }

    private void sendOTPEmail(String email, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Password Reset OTP");
        message.setText("Dear Student,\nGreetings from Team  Placement!\n\n" +
                "Your OTP for password reset is: " + otp + 
                "\nThis OTP will expire in 15 minutes.\n\n" +
                "Thank you,\nTeam RK Placement");
        mailSender.send(message);
    }

    @GetMapping("/verifyotp")
    public ModelAndView showVerifyOTP(@RequestParam("email") String email) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("email", email);
        mv.setViewName("verifyotp");
        return mv;
    }
    
    @PostMapping("/verifyotp")
    public ModelAndView verifyOTP(@RequestParam("email") String email, 
                                 @RequestParam("otp") String otp) {
        ModelAndView mv = new ModelAndView();
        
        try {
            // Check if OTP exists and is valid
            String storedOTP = otpStore.get(email);
            LocalDateTime timestamp = otpTimestamp.get(email);
            
            if (storedOTP == null || timestamp == null) {
                mv.setViewName("redirect:/student?error=invalidOTP");
                return mv;
            }
            
            // Check if OTP is expired (15 minutes validity)
            if (ChronoUnit.MINUTES.between(timestamp, LocalDateTime.now()) > 15) {
                otpStore.remove(email);
                otpTimestamp.remove(email);
                mv.setViewName("redirect:/student?error=expiredOTP");
                return mv;
            }
            
            // Verify OTP
            if (!storedOTP.equals(otp)) {
                mv.setViewName("redirect:/student/verifyotp?email=" + email + "&error=invalidOTP");
                return mv;
            }
            
            // OTP verified, redirect to reset password page
            mv.setViewName("redirect:/student/resetpassword?email=" + email + "&token=" + storedOTP);
            return mv;
            
        } catch (Exception e) {
            mv.setViewName("redirect:/student?error=verificationError");
            return mv;
        }
    }

    @GetMapping("/resetpassword")
    public ModelAndView showResetPassword(@RequestParam("email") String email, 
                                        @RequestParam("token") String token) {
        ModelAndView mv = new ModelAndView();
        
        // Verify token is valid
        String storedOTP = otpStore.get(email);
        if (storedOTP == null || !storedOTP.equals(token)) {
            mv.setViewName("redirect:/student?error=invalidToken");
            return mv;
        }
        
        mv.addObject("email", email);
        mv.addObject("token", token);
        mv.setViewName("resetpassword");
        return mv;
    }

    @PostMapping("/resetpassword")
    public ModelAndView resetPassword(@RequestParam("email") String email,
                                    @RequestParam("token") String token,
                                    @RequestParam("newPassword") String newPassword,
                                    @RequestParam("confirmPassword") String confirmPassword) {
        ModelAndView mv = new ModelAndView();
        
        try {
            // Verify token
            String storedOTP = otpStore.get(email);
            if (storedOTP == null || !storedOTP.equals(token)) {
                mv.setViewName("redirect:/student?error=invalidToken");
                return mv;
            }
            
            // Verify passwords match
            if (!newPassword.equals(confirmPassword)) {
                mv.setViewName("redirect:/student/resetpassword?email=" + email + 
                              "&token=" + token + "&error=passwordMismatch");
                return mv;
            }
            
            // Update password
            Student student = studentRepository.findByEmail(email);
            student.setPassword(newPassword);
            studentRepository.save(student);
            
            // Send success email
            sendPasswordResetSuccessEmail(student);
            
            // Clear OTP data
            otpStore.remove(email);
            otpTimestamp.remove(email);
            
            mv.setViewName("redirect:/student?succ=true");
            return mv;
            
        } catch (Exception e) {
            mv.setViewName("redirect:/student?error=resetError");
            return mv;
        }
    }

    private void sendPasswordResetSuccessEmail(Student student) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(student.getEmail());
        message.setSubject("Password Reset Successful");
        message.setText("Dear " + student.getFirstName() + " " + student.getLastName() + ",\n\n" +
                       "Your password has been successfully reset🥳.\n\n" +
                       "If you did not initiate this password reset, please contact our support team immediately.\n\n" +
                       "Best regards,\n" +
                       "Team RK Placement");
        mailSender.send(message);
    }
    
    @GetMapping("/available-quizzes")
    public ModelAndView viewAvailableQuizzes(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }
        
        List<CompanyQuiz> availableQuizzes = companyQuizService.getAllActiveQuizzes();
        mv.addObject("quizzes", availableQuizzes);
        mv.setViewName("student_available_quizzes");
        return mv;
    }
    
    @GetMapping("/start-quiz/{quizId}")
    public ModelAndView showQuizStartForm(@PathVariable("quizId") Long quizId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }
        
        CompanyQuiz quiz = companyQuizService.getQuizById(quizId)
            .orElseThrow(() -> new RuntimeException("Quiz not found"));
        
        mv.addObject("quiz", quiz);
        mv.addObject("student", student);
        mv.setViewName("student_quiz_start_form");
        return mv;
    }
    
    @PostMapping("/take-quiz/{quizId}")
    public ModelAndView takeQuiz(
        @PathVariable("quizId") Long quizId, 
        HttpServletRequest request, 
        HttpSession session
    ) {
        ModelAndView mv = new ModelAndView();
        
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }
        
        CompanyQuiz quiz = companyQuizService.getQuizById(quizId)
            .orElseThrow(() -> new RuntimeException("Quiz not found"));
        
        // Create a quiz attempt record
        StudentQuizAttempt attempt = new StudentQuizAttempt();
        attempt.setStudent(student);
        attempt.setQuiz(quiz);
        attempt.setStartTime(new Date());
        
        // Store the attempt in session for tracking
        session.setAttribute("currentQuizAttempt", attempt);
        
        mv.addObject("quiz", quiz);
        mv.setViewName("student_quiz_page");
        return mv;
    }
    
    @PostMapping("/submit-quiz")
    public ModelAndView submitQuiz(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }

        StudentQuizAttempt attempt = (StudentQuizAttempt) session.getAttribute("currentQuizAttempt");
        if (attempt == null) {
            mv.setViewName("redirect:/student/available-quizzes");
            return mv;
        }

        CompanyQuiz quiz = attempt.getQuiz();
        int correctAnswers = 0;
        int totalQuestions = quiz.getQuestions().size();

        // Enhanced Detailed Logging
        for (CompanyQuizQuestion question : quiz.getQuestions()) {
            String submittedOption = request.getParameter("question_" + question.getId());
            
            // Determine correct option number
            int correctOptionNumber = determineCorrectOptionNumber(question);
            
            // Convert submitted option to integer
            int submittedOptionNumber = submittedOption != null ? 
                Integer.parseInt(submittedOption) : -1;

            // Check if submitted option matches correct option
            if (submittedOptionNumber == correctOptionNumber) {
                correctAnswers++;
            }
        }

        // Score Calculation
        double score = ((double) correctAnswers / totalQuestions) * 100.0;

        // Persist Quiz Attempt
        attempt.setEndTime(new Date());
        attempt.setScore(score);
        attempt.setCorrectAnswers(correctAnswers);
        studentQuizAttemptService.saveQuizAttempt(attempt);

        // Clean Up Session
        session.removeAttribute("currentQuizAttempt");

        // Final Logging
        System.out.println("\n--- Quiz Submission Summary ---");
        System.out.println("Total Questions: " + totalQuestions);
        System.out.println("Correct Answers: " + correctAnswers);
        System.out.println("Final Score: " + score + "%");

        mv.addObject("quiz", quiz);
        mv.addObject("score", score);
        mv.addObject("correctAnswers", correctAnswers);
        mv.addObject("totalQuestions", totalQuestions);
        mv.setViewName("student_quiz_result");

        return mv;
    }
    
    private int determineCorrectOptionNumber(CompanyQuizQuestion question) {
        String correctAnswer = question.getCorrectAnswer().trim();
        if (correctAnswer.equals(question.getOption1())) return 1;
        if (correctAnswer.equals(question.getOption2())) return 2;
        if (correctAnswer.equals(question.getOption3())) return 3;
        if (correctAnswer.equals(question.getOption4())) return 4;
        return -1;
    }
    
    @GetMapping("/quiz-history")
    public ModelAndView viewQuizHistory(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("redirect:/student/studentsessionexpiry");
            return mv;
        }
        
        List<StudentQuizAttempt> quizHistory = studentQuizAttemptService.getQuizAttemptsByStudent(student);
        mv.addObject("quizHistory", quizHistory);
        mv.setViewName("student_quiz_history");
        
        return mv;
    }
    
}
