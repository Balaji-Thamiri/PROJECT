package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class CompanyQuiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    private String title;
    private String description;
    private Date createdDate;
    private String difficulty; // Easy, Medium, Hard
    private Integer duration; // Quiz duration in minutes
    private Boolean isActive = true;

    @OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<CompanyQuizQuestion> questions = new ArrayList<>();

    // Add a method to add questions to the quiz
    public void addQuestion(CompanyQuizQuestion question) {
        questions.add(question);
        question.setQuiz(this);
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Company getCompany() { return company; }
    public void setCompany(Company company) { this.company = company; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Date getCreatedDate() { return createdDate; }
    public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    public Integer getDuration() { return duration; }
    public void setDuration(Integer duration) { this.duration = duration; }
    public Boolean getActive() { return isActive; }
    public void setActive(Boolean active) { isActive = active; }
    public List<CompanyQuizQuestion> getQuestions() { return questions; }
    public void setQuestions(List<CompanyQuizQuestion> questions) { this.questions = questions; }
}