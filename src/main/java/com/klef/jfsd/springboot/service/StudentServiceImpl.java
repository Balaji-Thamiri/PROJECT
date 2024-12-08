package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.JobPostingRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{

	   @Autowired
	    private StudentRepository studentRepository;
	   
	   @Autowired
	   private JobPostingRepository jobpostingRepository;
	   
	@Override
	public void saveStudent(Student student) {
		// TODO Auto-generated method stub
		studentRepository.save(student);
	}

    @Override
    public List<Student> getAllStudents() { // Implement the method
        return studentRepository.findAll(); // Fetch all students from the repository
    }

	@Override
	public Student checkStudentLogin(String email, String password) {
		// TODO Auto-generated method stub
		return studentRepository.checkStudentLogin(email, password);
	}

	@Override
    public boolean existsByEmail(String email) {
        return studentRepository.existsById(email);
    }

    @Override
    public boolean existsByUniversityId(String universityId) {
        return studentRepository.existsByUniversityId(universityId);
    }

	@Override
	public List<JobPosting> getAllJobs() {
		// TODO Auto-generated method stub
		return jobpostingRepository.findAll();
	}

	@Override
	public JobPosting getJobById(int jobId) {
	    return jobpostingRepository.findById(jobId).orElse(null);
	}
	

	@Override
	public Long JobCount() {
		// TODO Auto-generated method stub
		return jobpostingRepository.count();
	}
	
	
}
