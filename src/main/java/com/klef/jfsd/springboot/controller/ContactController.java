package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.klef.jfsd.springboot.service.EmailService;

@RestController
public class ContactController {
    @Autowired
    private EmailService emailService;

    @PostMapping("/submit-contact")
    public ResponseEntity<String> submitContactForm(
        @RequestParam String name, 
        @RequestParam String email, 
        @RequestParam String subject, 
        @RequestParam String message
    ) {
        try {
            emailService.sendContactFormEmail(name, email, subject, message);
            return ResponseEntity.ok("Message sent successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Error sending message: " + e.getMessage());
        }
    }
}
