package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    private String getEmailHeader() {
        return "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto; background-color: #f4f4f4; padding: 20px;'>" +
               "<div style='background-color: #3498db; color: white; padding: 15px; text-align: center;'>" +
               "<h1>RK Placement Portal</h1></div>" +
               "<div style='background-color: white; padding: 20px;'>";
    }

    private String getEmailFooter() {
        return "</div>" +
               "<div style='text-align: center; background-color: #f1f1f1; padding: 10px; color: #666;'>" +
               "<p>© 2024 RK Placement Portal. All Rights Reserved.</p></div></div>";
    }

    public void sendHtmlMessage(String to, String subject, String htmlBody) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        helper.setFrom("2200030106cseh1@gmail.com");
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(htmlBody, true);
        mailSender.send(message);
    }

    public void sendAssessmentInvitationEmail(String studentName, String studentEmail, String jobRole) throws MessagingException {
        String htmlBody = getEmailHeader() +
            "<h2>Assessment Invitation</h2>" +
            "<p>Dear " + studentName + ",</p>" +
            "<p>Congratulations! You have been shortlisted for the <strong>" + jobRole + "</strong> assessment.</p>" +
            "<p>Please complete the assessment at your earliest convenience.</p>" +
            "<a href='#' style='display: inline-block; background-color: #3498db; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;'>Go to Assessment</a>" +
            getEmailFooter();

        sendHtmlMessage(studentEmail, "Assessment Invitation for " + jobRole, htmlBody);
    }

    public void sendInterviewInvitationEmail(String studentName, String studentEmail, String companyName, String jobRole) throws MessagingException {
        String htmlBody = getEmailHeader() +
            "<h2>Interview Invitation</h2>" +
            "<p>Dear " + studentName + ",</p>" +
            "<p>You have been invited for an interview with <strong>" + companyName + "</strong> for the <strong>" + jobRole + "</strong> position.</p>" +
            "<p>Further details will be communicated soon.</p>" +
            "<div style='text-align: center; margin-top: 20px;'>" +
            "<a href='#' style='display: inline-block; background-color: #2ecc71; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;'>View Interview Details</a>" +
            "</div>" +
            getEmailFooter();

        sendHtmlMessage(studentEmail, "Interview Invitation from " + companyName, htmlBody);
    }

    public void sendSelectionEmail(String studentName, String studentEmail, String jobName, String companyName) throws MessagingException {
        String htmlBody = getEmailHeader() +
            "<h2>Job Offer Congratulations!</h2>" +
            "<p>Dear " + studentName + ",</p>" +
            "<p>Congratulations! You have been <strong>selected</strong> for the <strong>" + jobName + "</strong> position at <strong>" + companyName + "</strong>.</p>" +
            "<p>We are pleased to inform you that you have successfully completed all stages of the recruitment process.</p>" +
            "<div style='text-align: center; margin-top: 20px;'>" +
            "<a href='#' style='display: inline-block; background-color: #27ae60; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;'>View Offer Details</a>" +
            "</div>" +
            getEmailFooter();

        sendHtmlMessage(studentEmail, "Congratulations! Job Offer from " + companyName, htmlBody);
    }

    public void sendRejectionEmail(String studentName, String studentEmail, String jobName, String companyName) throws MessagingException {
        String htmlBody = getEmailHeader() +
            "<h2>Application Status Update</h2>" +
            "<p>Dear " + studentName + ",</p>" +
            "<p>Thank you for your interest in the <strong>" + jobName + "</strong> position at <strong>" + companyName + "</strong>.</p>" +
            "<p>After careful consideration, we regret to inform you that we will not be moving forward with your application at this time.</p>" +
            "<p>We appreciate the time and effort you put into the application process.</p>" +
            getEmailFooter();

        sendHtmlMessage(studentEmail, "Application Status Update for " + jobName, htmlBody);
    }

    public void sendContactFormEmail(String name, String email, String subject, String message) throws MessagingException {
        // Admin Notification Email
        String adminHtmlBody = getEmailHeader() +
            "<h2 align=center>New Contact Form Submission</h2>" +
            "<table style='width: 100%; border-collapse: collapse;'>" +
            "<tr><td style='padding: 10px; border-bottom: 1px solid #ddd;'><strong>Name:</strong></td><td style='padding: 10px; border-bottom: 1px solid #ddd;'>" + name + "</td></tr>" +
            "<tr><td style='padding: 10px; border-bottom: 1px solid #ddd;'><strong>Email:</strong></td><td style='padding: 10px; border-bottom: 1px solid #ddd;'>" + email + "</td></tr>" +
            "<tr><td style='padding: 10px; border-bottom: 1px solid #ddd;'><strong>Subject:</strong></td><td style='padding: 10px; border-bottom: 1px solid #ddd;'>" + subject + "</td></tr>" +
            "<tr><td style='padding: 10px;'><strong>Message:</strong></td><td style='padding: 10px;'>" + message + "</td></tr>" +
            "</table>" +
            getEmailFooter();

        sendHtmlMessage("2200030106cseh1@gmail.com", "New Contact Form Submission: " + subject, adminHtmlBody);

        // User Thank You Email
        String userHtmlBody = getEmailHeader() +
            "<h2 align=center>Thank You for Contacting Us</h2>" +
            "<p>Dear " + name + ",</p>" +
            "<p>Thank you for reaching out to RK Placement Portal!</p>" +
            "<p>We have received your message regarding: <strong>" + subject + "</strong></p>" +
            "<p>Our team will review your inquiry and respond as soon as possible.</p>" +
            "<div style='text-align: center; margin-top: 20px;'>" +
            "<a href='#' style='display: inline-block; background-color: #3498db; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;'>View Support</a>" +
            "</div>" +
            getEmailFooter();

        sendHtmlMessage(email, "Thank You for Contacting RK Placement Portal", userHtmlBody);
    }
}