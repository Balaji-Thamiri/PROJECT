package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.CompanyQuiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyQuizRepository extends JpaRepository<CompanyQuiz, Long> {
    @Query("SELECT q FROM CompanyQuiz q WHERE q.company.Name = :companyName")
    List<CompanyQuiz> findByCompanyName(String companyName);
    
    @Query("SELECT q FROM CompanyQuiz q WHERE q.isActive = true")
    List<CompanyQuiz> findAllActiveQuizzes();
}