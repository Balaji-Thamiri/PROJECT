package com.klef.jfsd.springboot.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Company;
import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private StudentService studentService;

    @GetMapping("")
    public ModelAndView home() {
        return new ModelAndView("adminlogin");
    }

    @PostMapping("/checkadminlogin")
    public ModelAndView checkadminLogin(HttpServletRequest request) {
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = adminService.checkadminLogin(username, password);
        ModelAndView mv = new ModelAndView();

        if (admin != null) {
        	
        	 HttpSession session = request.getSession();
             session.setAttribute("admin",admin); // "employee" is the session variable
        	
        	
            mv.setViewName("redirect:/admin/home?success=true");
        } else {
            mv.setViewName("redirect:/admin?error=true");
        }

        return mv;
    }

    @GetMapping("/home")
    public ModelAndView adminhome() {
        ModelAndView mv = new ModelAndView("admindashboard");

        long studentCount = adminService.studentcount();
        mv.addObject("count", studentCount);
        long companyCount = adminService.companycount();
        mv.addObject("ccount", companyCount);
        
        long jobCount = adminService.JobCount();
        mv.addObject("jcount", jobCount);
        
        long placedcount = adminService.placedcount();
        mv.addObject("pcount",placedcount);

        return mv;
    }

    @GetMapping("/viewallstudents")
    public ModelAndView viewAllStudents(
        @RequestParam(defaultValue = "0") int page, 
        @RequestParam(defaultValue = "5") int size) {
        
        ModelAndView mv = new ModelAndView("viewallstudents");

        // Retrieve paginated student data
        Page<Student> studentPage = adminService.getAllStudents(PageRequest.of(page, size));
        List<Student> students = studentPage.getContent();

        mv.addObject("students", students);
        mv.addObject("currentPage", page);
        mv.addObject("totalPages", studentPage.getTotalPages());

        long studentCount = adminService.studentcount();
        mv.addObject("count", studentCount);
        long acceptedCount = adminService.studentcountAccepted();
        mv.addObject("acceptedcount", acceptedCount);
        long pendingCount = adminService.studentcountRejectedOrRegistered();
        mv.addObject("pending", pendingCount);

        return mv;
    }


    @GetMapping("/dashboard")
    public ModelAndView dashboard() {
        return new ModelAndView("dashboard-content");
    }

    @GetMapping("/updatestatus")
    public String updateStatus(@RequestParam("status") String status, @RequestParam("email") String email) {
        adminService.updatestudentstatus(status, email);
        return "redirect:/admin/viewallstudents?status=updated";
    }

    @GetMapping("/deletestudent")
    public String deleteStudent(@RequestParam("email") String email) {
        adminService.deletestudent(email);
        return "redirect:/admin/viewallstudents?status=deleted";
    }

    @GetMapping("/editstudent")
    public ModelAndView editStudent(@RequestParam("email") String email) {
        ModelAndView mv = new ModelAndView("editstudent");

        Student student = adminService.findStudentByEmail(email);
        mv.addObject("student", student);

        return mv;
    }

    @PostMapping("/updateStudent")
    public String updateStudent(@RequestParam("email") String email,
                                @RequestParam("firstName") String firstName,
                                @RequestParam("lastName") String lastName,
                                @RequestParam("phone") String phone,
                                @RequestParam("status") String status) {
        adminService.updateStudent(email, firstName, lastName, phone, status);
        return "redirect:/admin/viewallstudents?status=update";
    }

    @GetMapping("/viewallcompanies")
    public ModelAndView viewAllCompanies(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {
        
        ModelAndView mv = new ModelAndView("viewallcompanies");

        // Retrieve paginated company data
        Page<Company> companyPage = adminService.getAllCompanies(PageRequest.of(page, size));
        List<Company> companies = companyPage.getContent();

        mv.addObject("companies", companies);
        mv.addObject("currentPage", page);
        mv.addObject("totalPages", companyPage.getTotalPages());

        // Add existing statistics
        long companyCount = adminService.companycount();
        mv.addObject("ccount", companyCount);
        long acceptedCount = adminService.companycountAccepted();
        mv.addObject("ac", acceptedCount);
        long locationCount = adminService.countDistinctCompanyLocations();
        mv.addObject("lc", locationCount);

        return mv;
        
    }

    @GetMapping("/deletecompany")
    public String deleteCompany(@RequestParam("email") String email) {
        adminService.deleteCompany(email);
        return "redirect:/admin/viewallcompanies?status=deleted";
    }

    @GetMapping("/updatecstatus")
    public String updateCompanyStatus(@RequestParam("status") String status, @RequestParam("email") String email) {
        adminService.updatecompanystatus(status, email);
        return "redirect:/admin/viewallcompanies?status=updated";
    }

    @GetMapping("/addstudent")
    public ModelAndView addStudentForm() {
        return new ModelAndView("addstudent");
    }

    @PostMapping("/add")
    public ModelAndView registerStudent(HttpServletRequest request,
                                        @RequestParam("file") MultipartFile file) {
        ModelAndView mv = new ModelAndView();

        try {
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
            String status = "Accepted";

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

            if (!file.isEmpty()) {
                File tempFile = File.createTempFile("temp", file.getOriginalFilename());
                file.transferTo(tempFile);
                String base64Image = ImageUtil.encodeImageToBase64(tempFile);
                student.setBase64Image(base64Image);
                student.setImageType(file.getContentType());
                tempFile.delete();
            }

            if (studentService.existsByEmail(email)) {
                mv.setViewName("redirect:/admin/addstudent?error=email");
                return mv;
            }

            if (studentService.existsByUniversityId(universityId)) {
                mv.setViewName("redirect:/admin/addstudent?error=universityId");
                return mv;
            }

            studentService.saveStudent(student);
            mv.setViewName("redirect:/admin/viewall?status=add");

        } catch (Exception e) {
            mv.setViewName("redirect:/admin/addstudent?error=true");
        }

        return mv;
    }
    
    @GetMapping("adminsessionexpiry")
    public ModelAndView empsessionexpiry()
    {
 	   ModelAndView mv=new ModelAndView();
 	   mv.setViewName("adminsessionexpiry");
 	   return mv;
    }
    
    @GetMapping("adminlogout")
    public void adminlogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("admin"); // employee is the session variable

        // Redirect to the admin login page
        response.sendRedirect("/");
    }

    @GetMapping("adminprofile")
    public ModelAndView empprofile()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("adminprofile");
      return mv;
    }
    
    @GetMapping("adminprofileupdate")
    public ModelAndView adminprofileupdate()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("adminprofileupdate");
      return mv;
    }
    
    
    
    @PostMapping("/updateprofile")
    public String updateAdminProfile(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Admin currentAdmin = (Admin) session.getAttribute("admin");
            
            if (currentAdmin == null) {
                return "redirect:/admin/adminsessionexpiry";
            }

            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            
            // Verify current password
            Admin admin = adminService.checkadminLogin(currentAdmin.getEmail(), currentPassword);
            if (admin == null) {
                return "redirect:/admin/adminprofileupdate?error=invalidpassword";
            }
            
            // Update password
            boolean updated = adminService.updateAdminPassword(currentAdmin.getEmail(), newPassword);
            
            if (updated) {
                // Update session with new admin details
                Admin updatedAdmin = adminService.findByEmail(currentAdmin.getEmail());
                session.setAttribute("admin", updatedAdmin);
                return "redirect:/admin/home?succ=true";
            } else {
                return "redirect:/admin/adminprofileupdate?error=true";
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/adminprofile?error=true";
        }
    }
    
    
    @GetMapping("/viewalljobs")
    public ModelAndView viewAllJobs(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {
        
        ModelAndView mv = new ModelAndView("viewalljjobs");

        // Create pageable request
        Pageable pageable = PageRequest.of(page, size);
        
        // Get paginated job postings
        Page<JobPosting> jobPage = adminService.getAllJobs(pageable);
        List<JobPosting> jobs = jobPage.getContent();

        mv.addObject("jobs", jobs);
        mv.addObject("currentPage", page);
        mv.addObject("totalPages", jobPage.getTotalPages());

        // Add statistics
        long totalJobs = adminService.JobCount();
        mv.addObject("totalJobs", totalJobs);
        long activeJobs = adminService.getActiveJobsCount(); 
        mv.addObject("activeJobs", activeJobs);
        long totalCompanies = adminService.companycount();
        mv.addObject("totalCompanies", totalCompanies);

        return mv;
    }

    @GetMapping("/deletejob")
    public String deleteJob(@RequestParam("id") int jobId) {
        adminService.deleteJob(jobId);
        return "redirect:/admin/viewalljobs?status=deleted";
    }
   
    
    
    
}
