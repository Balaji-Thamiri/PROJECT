package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.JobPosting;
import com.klef.jfsd.springboot.repository.JobPostingRepository;

@Service
public class JobServiceImpl implements JobService
{
	@Autowired
	private JobPostingRepository jobRepository;

	@Override
	public void addjob(JobPosting job) {
	    jobRepository.save(job);
	}

	@Override
	public List<JobPosting> getJobsByCompanyName(String companyName) {
		 return jobRepository.findJobsByCompanyName(companyName);
	}
	
	@Override
    public JobPosting getJobById(int jobId) {
        return jobRepository.findById(jobId).orElse(null);
    }

    @Override
    public void updateJob(JobPosting job) {
        jobRepository.save(job);
    }

    @Override
    public void deleteJob(int jobId) {
        jobRepository.deleteById(jobId);
    }
    
}
