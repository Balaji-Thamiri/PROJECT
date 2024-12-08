package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "job_posting")
public class JobPosting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int jobId;

    @Column(name = "job_title", nullable = false)
    private String jobTitle;

    @Column(name = "job_posting_date", nullable = false)
    private Date jobPostingDate;

    @Column(name = "last_date_to_apply", nullable = false)
    private Date lastDateToApply;

    @ManyToOne
    @JoinColumn(name = "company_name", referencedColumnName = "name", nullable = false)
    private Company company; // Company object

    @Column(name = "job_type", nullable = false)
    private String jobType;

    @Column(name = "skills_required", nullable = false)
    private String skillsRequired;

    @Column(name = "job_location")
    private String jobLocation;

    @Column(name = "salary_range")
    private String salaryRange;

    @Column(name = "experience_required")
    private Integer experienceRequired;

    @Column(name = "education_level")
    private String educationLevel;

    @Column(name = "job_description")
    private String jobDescription;

    // Getters and Setters

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Date getJobPostingDate() {
        return jobPostingDate;
    }

    public void setJobPostingDate(Date jobPostingDate) {
        this.jobPostingDate = jobPostingDate;
    }

    public Date getLastDateToApply() {
        return lastDateToApply;
    }

    public void setLastDateToApply(Date lastDateToApply) {
        this.lastDateToApply = lastDateToApply;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public String getSkillsRequired() {
        return skillsRequired;
    }

    public void setSkillsRequired(String skillsRequired) {
        this.skillsRequired = skillsRequired;
    }

    public String getJobLocation() {
        return jobLocation;
    }

    public void setJobLocation(String jobLocation) {
        this.jobLocation = jobLocation;
    }

    public String getSalaryRange() {
        return salaryRange;
    }

    public void setSalaryRange(String salaryRange) {
        this.salaryRange = salaryRange;
    }

    public Integer getExperienceRequired() {
        return experienceRequired;
    }

    public void setExperienceRequired(Integer experienceRequired) {
        this.experienceRequired = experienceRequired;
    }

    public String getEducationLevel() {
        return educationLevel;
    }

    public void setEducationLevel(String educationLevel) {
        this.educationLevel = educationLevel;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }
}
