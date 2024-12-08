package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.springboot.model.JobApplication;
import com.klef.jfsd.springboot.repository.JobApplicationRepository;

import jakarta.mail.MessagingException;

import java.util.List;

@Service
public class JobApplicationServiceImpl implements JobApplicationService {
    
    @Autowired
    private JobApplicationRepository jobApplicationRepository;
    
    @Autowired
    private EmailService emailService;

    
    @Override
    public JobApplication saveApplication(JobApplication application) {
        return jobApplicationRepository.save(application);
    }
    
    @Override
    public JobApplication getApplicationById(Long id) {
        return jobApplicationRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Application not found"));
    }
    
    @Override
    public List<JobApplication> getAllApplications() {
        return jobApplicationRepository.findAll();
    }
    
    @Override
    public List<JobApplication> getApplicationsByStudentEmail(String studentEmail) {
        return jobApplicationRepository.findByStudentEmail(studentEmail);
    }
    
    @Override
    public void deleteApplication(Long id) {
        jobApplicationRepository.deleteById(id);
    }
    
    @Override
    public boolean hasStudentAppliedToJob(String studentEmail, String jobName) {
        return jobApplicationRepository.existsByStudentEmailAndJobName(studentEmail, jobName);
    }
    
    
    public void updateApplicationStatus(Long id, String status) {
        JobApplication application = jobApplicationRepository.findById(id).orElseThrow();

        // Extract fields directly from JobApplication
        String studentName = application.getStudentName();
        String studentEmail = application.getStudentEmail();
        String companyName = application.getCompanyName();
        String jobTitle = application.getJobName();

        application.setStatus(status);
        jobApplicationRepository.save(application);

        // Send emails based on status
        switch (status.toLowerCase()) {
            case "shortlisted":
            	try {
            	    emailService.sendAssessmentInvitationEmail(studentName, studentEmail, jobTitle);
            	} catch (MessagingException e) {
            	    // Handle the exception, e.g., log the error and/or notify the user
            	    e.printStackTrace();
            	}
                break;
            case "interview scheduled":
            	try {
                emailService.sendInterviewInvitationEmail(studentName, studentEmail, companyName, jobTitle);
            	}
            	catch (MessagingException e) {
            	    // Handle the exception, e.g., log the error and/or notify the user
            	    e.printStackTrace();
            	}
                break;
            case "selected":
            	try {
                emailService.sendSelectionEmail(studentName, studentEmail, jobTitle, companyName);
            	}
            	catch (MessagingException e) {
            	    // Handle the exception, e.g., log the error and/or notify the user
            	    e.printStackTrace();
            	}
                break;
            case "rejected":
            	try {
                emailService.sendRejectionEmail(studentName, studentEmail, jobTitle, companyName);
            	}
            	catch (MessagingException e) {
            	    // Handle the exception, e.g., log the error and/or notify the user
            	    e.printStackTrace();
            	}
                break;
        }
    }


    @Override
    public List<JobApplication> getApplicationsByCompanyName(String companyName) {
        return jobApplicationRepository.findByCompanyName(companyName);
    }
    
}