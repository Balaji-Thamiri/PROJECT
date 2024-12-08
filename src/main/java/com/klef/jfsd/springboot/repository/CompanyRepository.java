package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Company;

import jakarta.transaction.Transactional;

import java.util.*;
@Repository
public interface CompanyRepository extends JpaRepository<Company,String>
{
	@Query("select c from Company c  where c.Email=?1 and c.password=?2")
	public Company checkCompanyLogin(String email, String password);
	
	 @Query("update Company c set c.status=?1 where c.Email=?2")
	   @Modifying // DML Operation
	   @Transactional //to enable auto commit
	public int updatecompanystatus(String status,String email);
	
	@Query("SELECT COUNT(DISTINCT c.Location) FROM Company c")
	public Long countDistinctLocations();
	
	 public Long countByStatus(String status);

	 @Query("SELECT c.Name FROM Company c")
	 List<String> findAllCompanyNames();
  
	 
	 

}
