package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="student_table")
public class Student {
	@Id
    @Column(name = "email", nullable = false, length = 100)
    private String email;
	
	@Column(name = "university_name", nullable = false, length = 20)
    private String universityname;
	

    @Column(name = "university_id", nullable = false, unique = true,length = 20)
    private String universityId;

    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;

    @Column(name = "phone", nullable = false, length = 15)
    private String phone;

    @Column(name = "date_of_birth", nullable = false, length = 10)
    private String dateOfBirth;

    @Column(name = "gender", nullable = false, length = 10)
    private String gender;

    @Column(name = "degree", nullable = false, length = 50)
    private String degree;

    @Column(name = "branch", nullable = false, length = 50)
    private String branch;

    @Column(name = "cgpa", nullable = false)
    private double cgpa;

    @Column(name = "graduation_year", nullable = false)
    private int graduationYear;

    @Column(name = "password", nullable = false, length = 100)
    private String password;

    @Lob
    @Column(name = "profile_image")
    private byte[] profileImage;

    @Lob
    @Column(name = "base64_image", columnDefinition = "LONGTEXT")
    private String base64Image;

    @Column(name = "image_type", length = 50)
    private String imageType;
    
    // Getters and Setters

    
    @Column(name="status",nullable=false,length = 50)
    private String status;
    
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    
    public String getUniversityname() {
        return universityname;
    }

    public void setUniversityname(String universityname) {
        this.universityname = universityname;
    }

    public String getUniversityId() {
        return universityId;
    }

    public void setUniversityId(String universityId) {
        this.universityId = universityId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public double getCgpa() {
        return cgpa;
    }

    public void setCgpa(double cgpa) {
        this.cgpa = cgpa;
    }

    public int getGraduationYear() {
        return graduationYear;
    }

    public void setGraduationYear(int graduationYear) {
        this.graduationYear = graduationYear;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(byte[] profileImage) {
        this.profileImage = profileImage;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public String getImageType() {
        return imageType;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }
    public String getStatus() {
    	return status;
    }
     public void setStatus(String status) {
    	this.status = status;
    }
}
