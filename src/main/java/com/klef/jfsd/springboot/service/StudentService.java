package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.model.Student;

public interface StudentService 
{
	public void saveStudent(Student student);
	public List<Student> getAllStudents();
	public Student checkStudentLogin(String email,String password);
	public boolean existsByEmail(String email);
    public boolean existsByUniversityId(String universityId);
    public List<JobPosting> getAllJobs();
    public JobPosting getJobById(int jobId);
    public Long JobCount();
}
