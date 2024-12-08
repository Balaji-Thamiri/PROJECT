package com.klef.jfsd.springboot.service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Company;
import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CompanyRepository;
import com.klef.jfsd.springboot.repository.JobApplicationRepository;
import com.klef.jfsd.springboot.repository.JobPostingRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;

	 @Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	private JobPostingRepository jobPosting;
	
	@Autowired
	private JobApplicationRepository jobapp;
	 
	@Override
	public Admin checkadminLogin(String email, String pwd) {
		// TODO Auto-generated method stub
		return adminRepository.checkAdminLogin(email, pwd);
	}


	@Override
	public List<Student> getAllStudents() {
		// TODO Auto-generated method stub
		 return studentRepository.findAll();
	}


	@Override
	public String updatestudentstatus(String status, String email) {
		// TODO Auto-generated method stub
		int n=studentRepository.updatestudentstatus(status, email);
		if(n>0)
		{
			return "Student Updated Sucessfully";
		}
		else
		{
			return "Student not found";
		}
	}


	@Override
	public Long studentcount() {
		// TODO Auto-generated method stub
		return studentRepository.count();
	}


	@Override
	public String deletestudent(String email) {
		// TODO Auto-generated method stub
		adminRepository.deletestudentbyemail(email);
		return "Student Deleted Sucessfully";
	}

	@Override
	public void updateStudent(String email, String firstName, String lastName, String phone, String status) {
	    Student student = studentRepository.findById(email).orElse(null);
	    if (student != null) {
	        student.setFirstName(firstName);
	        student.setLastName(lastName);
	        student.setPhone(phone);
	        student.setEmail(email);
	        student.setStatus(status);
	        studentRepository.save(student);
	    }
	}
	
	@Override
	public Student findStudentByEmail(String email) {
	    return studentRepository.findByEmail(email); // Calls the repository method
	}


	// In AdminService
	@Override
	public Long studentcountAccepted() {
	    return studentRepository.countByStatus("Accepted");
	}


	@Override
	public Long studentcountRejectedOrRegistered() {
	    List<String> statuses = Arrays.asList("Rejected", "Registered");
	    return studentRepository.countByStatusIn(statuses);
	}


	@Override
	public List<Company> getAllCompanies() {
		// TODO Auto-generated method stub
		return companyRepository.findAll();
	}


	@Override
	public Long companycount() {
		// TODO Auto-generated method stub
		return companyRepository.count();
	}


	@Override
	public Long countDistinctCompanyLocations() {
		// TODO Auto-generated method stub
		return companyRepository.countDistinctLocations();
	}


	@Override
	public String deleteCompany(String email) {
		adminRepository.deleteCompanybyemail(email);
		return "Company Deleted Sucessfully";
	}


	@Override
	public String updatecompanystatus(String status, String email) {
		// TODO Auto-generated method stub
		int n=companyRepository.updatecompanystatus(status, email);
		if(n>0)
		{
			return "Company Updated Sucessfully";
		}
		else
		{
			return "Company not found";
		}
	}


	@Override
	public Long companycountAccepted() {
		// TODO Auto-generated method stub
		return companyRepository.countByStatus("Accepted");
	}


	@Override
	public boolean updateAdminPassword(String email, String newPassword) {
		try {
	        Admin admin = adminRepository.findById(email).orElse(null);
	        if (admin == null) {
	            return false;
	        }
	        
	        admin.setPassword(newPassword);
	        adminRepository.save(admin);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	@Override
	public Admin findByEmail(String email) {
	    return adminRepository.findById(email).orElse(null);
	}


	@Override
	public Page<Student> getAllStudents(Pageable pageable) {
		// TODO Auto-generated method stub
		return studentRepository.findAll(pageable);
	}


	@Override
	public Long JobCount() {
		// TODO Auto-generated method stub
		return jobPosting.count();
	}


	@Override
    public Page<Company> getAllCompanies(Pageable pageable) {
        return companyRepository.findAll(pageable);
    }

	
	@Override
	public Page<JobPosting> getAllJobs(Pageable pageable) {
	    return jobPosting.findAll(pageable);
	}

	@Override
	public Long getActiveJobsCount() {
	    Date currentDate = new Date();
	    return jobPosting.countByLastDateToApplyAfter(currentDate);
	}

	@Override
	public void deleteJob(int jobId) {
	    jobPosting.deleteById(jobId);
	}


	@Override
	public Long placedcount() {
		// TODO Auto-generated method stub
	    return jobapp.countByStatus("Selected");
	}
    
	 
	

	
	
	
}
