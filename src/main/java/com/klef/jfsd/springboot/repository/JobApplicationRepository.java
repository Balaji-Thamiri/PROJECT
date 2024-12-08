package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.springboot.model.JobApplication;
import java.util.List;

@Repository
public interface JobApplicationRepository extends JpaRepository<JobApplication, Long> {
    List<JobApplication> findByStudentEmail(String studentEmail);
    boolean existsByStudentEmailAndJobName(String studentEmail, String jobName);
    List<JobApplication> findByCompanyName(String companyName);
    
    @Query("SELECT COUNT(ja) FROM JobApplication ja WHERE ja.companyName = :companyName")
    Long countByCompanyName(@Param("companyName") String companyName);
    
    @Query("SELECT COUNT(ja) FROM JobApplication ja WHERE ja.status = :status")
    Long countByStatuss(@Param("status") String status);
    
	   public Long countByStatus(String status);

}