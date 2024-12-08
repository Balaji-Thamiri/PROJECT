package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.CompanyQuiz;
import com.klef.jfsd.springboot.repository.CompanyQuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CompanyQuizService {
    @Autowired
    private CompanyQuizRepository companyQuizRepository;

    public CompanyQuiz saveQuiz(CompanyQuiz quiz) {
        return companyQuizRepository.save(quiz);
    }

    public List<CompanyQuiz> getQuizzesByCompanyName(String companyName) {
        return companyQuizRepository.findByCompanyName(companyName);
    }

    public Optional<CompanyQuiz> getQuizById(Long quizId) {
        return companyQuizRepository.findById(quizId);
    }

    public void deleteQuiz(Long quizId) {
        companyQuizRepository.deleteById(quizId);
    }
    
    
    public List<CompanyQuiz> getAllActiveQuizzes() {
        return companyQuizRepository.findAllActiveQuizzes();
    }
}