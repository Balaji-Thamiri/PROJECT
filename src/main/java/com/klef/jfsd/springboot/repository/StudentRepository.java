package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, String> {
    // JpaRepository provides basic CRUD methods
	@Query("select s from Student s where s.email=?1  and s.password=?2")
	public Student checkStudentLogin(String email,String password);
	public boolean existsByUniversityId(String universityId);
	
	   @Query("update Student s set s.status=?1 where s.email=?2")
	   @Modifying // DML Operation
	   @Transactional //to enable auto commit
	   public int updatestudentstatus(String status,String email);

	   @Query("SELECT s FROM Student s WHERE s.email = ?1")
	   public Student findByEmail(String email);
	   
	   public Long countByStatus(String status);
	   public Long countByStatusIn(List<String> statuses);
}
