package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.JobApplication;
import java.util.List;

public interface JobApplicationService {
    JobApplication saveApplication(JobApplication application);
    JobApplication getApplicationById(Long id);
    List<JobApplication> getAllApplications();
    List<JobApplication> getApplicationsByStudentEmail(String studentEmail);
    void deleteApplication(Long id);
    boolean hasStudentAppliedToJob(String studentEmail, String jobName);
    void updateApplicationStatus(Long id, String status);
    List<JobApplication> getApplicationsByCompanyName(String companyName);

}