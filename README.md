# Placex - Placement Interaction System

## Overview

Placex is a comprehensive Placement Interaction System designed to streamline the placement process for students, companies, and administrators. Built using modern web technologies, it provides an efficient platform for managing placements, company interactions, and student data.

## Features

- **Admin Panel:** Manage students, companies, and job postings with advanced controls.
- **Student Dashboard:** View job opportunities, apply for positions, and track application status.
- **Company Portal:** Register, post job openings, and manage candidate applications.
- **Self-Registration with Approval:** Companies can self-register with admin approval.
- **Session Management:** Secure authentication and session handling.
- **Database Integration:** Persistent storage for student, company, and job data.
- **Responsive UI:** Built with modern frontend technologies for an intuitive experience.

## Tech Stack

### Frontend

- **HTML, CSS, Bootstrap, Tailwind CSS** – Styling and responsiveness
- **JavaScript, jQuery** – Dynamic interactions
- **JSP (JavaServer Pages)** – Server-side rendering

### Backend

- **Spring Boot** – Backend framework for API and business logic
- **Spring Security** – User authentication and authorization
- **JPA, Hibernate** – ORM for database interactions
- **MySQL** – Relational database for storing data

## Installation and Setup

### Prerequisites

- JDK 11+
- Apache Tomcat (for JSP rendering)
- MySQL Server
- Maven
- IDE (Eclipse/IntelliJ)

### Steps

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/klu-2200030106/PIS.git
   cd pis
   ```
2. **Configure Database:**
   - Update `application.properties` with your MySQL credentials.
3. **Build and Run:**
   ```sh
   mvn clean install
   mvn spring-boot:run
   ```
4. **Deploy on Tomcat:**
   - Generate a WAR file and deploy it to Tomcat.
5. **Access the Application:**
   - Open `http://localhost:8080` in your browser.

## Usage

### Admin

- Log in with admin credentials
- Approve/reject company registrations
- Manage students and job postings

### Students

- Register and log in
- View and apply for job opportunities

### Companies

- Register and await admin approval
- Post job openings and review applications

## Future Enhancements

- Integration with third-party APIs for resume parsing
- AI-based job recommendations
- Advanced reporting and analytics

## Contributing

Contributions are welcome! Feel free to submit issues and pull requests.

## License

This project is licensed under the MIT License.

