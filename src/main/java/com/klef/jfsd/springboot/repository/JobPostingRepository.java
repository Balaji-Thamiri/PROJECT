package com.klef.jfsd.springboot.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.JobPosting;

@Repository
public interface JobPostingRepository extends JpaRepository<JobPosting,Integer>
{
	 @Query("SELECT j FROM JobPosting j WHERE j.company.Name = ?1")
	 public List<JobPosting> findJobsByCompanyName(String companyName);
	 
	 @Query("SELECT COUNT(j) FROM JobPosting j WHERE j.lastDateToApply > :currentDate")
	 public Long countByLastDateToApplyAfter(Date currentDate);
	 
	 @Query("SELECT COUNT(j) FROM JobPosting j WHERE j.company.Name = :companyName AND j.lastDateToApply > CURRENT_DATE")
	 Long countActiveJobsByCompanyName(@Param("companyName") String companyName);


}
