package com.klef.jfsd.springboot.service;
import java.util.List;
import com.klef.jfsd.springboot.model.JobPosting;
public interface JobService 
{
	public void addjob(JobPosting job);
	public List<JobPosting> getJobsByCompanyName(String companyName);
	public JobPosting getJobById(int jobId);
    public void updateJob(JobPosting job);
    public void deleteJob(int jobId);
}
