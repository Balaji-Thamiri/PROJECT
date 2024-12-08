package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentQuizAttempt;

public interface StudentQuizAttemptRepository extends JpaRepository<StudentQuizAttempt, Long> {
    List<StudentQuizAttempt> findByStudent(Student student);
}
