package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Admin;

import jakarta.transaction.Transactional;

@Repository
public interface AdminRepository extends JpaRepository<Admin,String>
{
	@Query("select a from Admin a where a.email=?1  and a.password=?2")
	public Admin checkAdminLogin(String email, String password);
	
	@Query("delete from Student s where s.email=?1")
	@Modifying
	@Transactional
	public int deletestudentbyemail(String email);
	
	
	@Query("delete from Company c where c.Email=?1")
	@Modifying
	@Transactional
	public int deleteCompanybyemail(String email);
	
	
	 @Query("SELECT COUNT(a) FROM Admin a WHERE a.email = ?1")
	 public long countByEmail(String email);
}
