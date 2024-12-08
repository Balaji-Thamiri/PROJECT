package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentQuizAttempt;
import com.klef.jfsd.springboot.repository.StudentQuizAttemptRepository;

@Service
public class StudentQuizAttemptService {
    @Autowired
    private StudentQuizAttemptRepository attemptRepository;

    public void saveQuizAttempt(StudentQuizAttempt attempt) {
        attemptRepository.save(attempt);
    }

    public List<StudentQuizAttempt> getQuizAttemptsByStudent(Student student) {
        return attemptRepository.findByStudent(student);
    }
}