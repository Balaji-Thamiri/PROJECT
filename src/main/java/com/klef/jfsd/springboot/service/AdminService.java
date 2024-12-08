package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Company;
import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.model.Student;

public interface AdminService 
{
	 public Admin checkadminLogin(String email,String pwd);
	 public List<Student> getAllStudents();
	 public String updatestudentstatus(String status,String email);
     public Long studentcount();
     public String deletestudent(String email);
     public void updateStudent(String email, String firstName, String lastName, String phone, String status);
     public Student findStudentByEmail(String email);
     public Long studentcountAccepted();
     public Long studentcountRejectedOrRegistered();
     public List<Company> getAllCompanies();
     public Long companycount();
     public Long countDistinctCompanyLocations();
     public String deleteCompany(String email);
     public String updatecompanystatus(String status,String email);
     public Long companycountAccepted();
     public  boolean updateAdminPassword(String email, String newPassword);
     public Admin findByEmail(String email);
     public Page<Student> getAllStudents(Pageable pageable);
     public Long JobCount();
     public Page<Company> getAllCompanies(Pageable pageable);  // Add this method
     public Page<JobPosting> getAllJobs(Pageable pageable);
     public Long getActiveJobsCount();
     public void deleteJob(int jobId);
     public Long placedcount();

}
