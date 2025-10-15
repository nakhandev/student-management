<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=28&pause=1000&color=00C0FF&center=true&vCenter=true&width=435&lines=Student+Management+System;Version+1.0.0+(V1)" alt="Typing SVG" />
</p>

# 🎓 Student Management System

A modern RESTful API for managing student records — featuring full CRUD operations, advanced data validation, and centralized error handling.
Built for clean architecture, scalability, and real-world backend learning.

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/Java-11+-E76F00?style=for-the-badge&logo=openjdk&logoColor=white">
    <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/Java-11+-F89820?style=for-the-badge&logo=openjdk&logoColor=black">
    <img alt="Java Badge" src="https://img.shields.io/badge/Java-11+-E76F00?style=for-the-badge&logo=openjdk&logoColor=white">
  </picture>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/Spring%20Boot-2.7.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
    <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/Spring%20Boot-2.7.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=black">
    <img alt="Spring Boot Badge" src="https://img.shields.io/badge/Spring%20Boot-2.7.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
  </picture>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
    <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/MySQL-8.0-F29111?style=for-the-badge&logo=mysql&logoColor=black">
    <img alt="MySQL Badge" src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  </picture>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/REST-API-00599C?style=for-the-badge&logo=swagger&logoColor=white">
    <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/REST-API-008FCC?style=for-the-badge&logo=swagger&logoColor=black">
    <img alt="REST API Badge" src="https://img.shields.io/badge/REST-API-00599C?style=for-the-badge&logo=swagger&logoColor=white">
  </picture>
</p>

## 🧩 Overview

A comprehensive Student Management System built with Spring Boot that provides a complete REST API for managing student information. The system features robust validation, error handling, and follows best practices for scalable backend development.

## ⚙️ Features

- ✅ **Create** – Add new student records with validation
- 🔍 **Read** – Retrieve single or multiple students with filtering options
- ✏️ **Update** – Modify existing student details
- 🗑️ **Delete** – Remove students by ID
- 🧠 **Validation** – Comprehensive field-level input validation
- ⚡ **Exception Handling** – Global error responses with detailed messages
- 🔄 **RESTful Design** – Intuitive endpoints & proper HTTP status codes
- 🔍 **Search & Filter** – Find students by name, email, course, or age range

## 🧱 Tech Stack

| Technology | Role |
|------------|------|
| ☕ Java 11+ | Core programming language |
| 🌿 Spring Boot 2.7.x | REST API framework |
| 🗄️ MySQL 8.0 | Relational database |
| 🧰 Maven | Build automation |
| ✅ Jakarta Validation | Input validation |
| 🏗️ Spring Data JPA | Data access layer |

## 📂 Project Structure

```
student-management/
├── controller/          # REST Controllers (@RestController)
│   └── StudentController.java
├── service/            # Business Logic Layer (@Service)
│   └── StudentService.java
├── repository/         # Data Access Layer (@Repository)
│   └── StudentRepository.java
├── model/             # JPA Entities & DTOs
│   └── Student.java
├── exception/         # Global Exception Handlers
│   ├── GlobalExceptionHandler.java
│   └── ResourceNotFoundException.java
├── config/            # Configuration classes (future use)
└── resources/
    ├── application.properties
    └── data.sql
```

## ⚡ Quick Start

### 🔧 Prerequisites

- Java 11 or higher
- MySQL 8.0 or higher
- Maven 3.6 or higher

### 🗄️ Database Setup

1. **Create MySQL Database**
   ```sql
   CREATE DATABASE student_db;
   ```

2. **Update Database Configuration** (in `application.properties`)
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/student_db
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   ```

### ▶️ Run the Application

```bash
# Clone the repository
git clone https://github.com/nakhandev/student-management.git
cd student-management

# Build and run the application
mvn spring-boot:run

# Or run with custom profile
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

**Application will start on:** http://localhost:8080

## 📡 API Endpoints

### Base URL: `http://localhost:8080/api/students`

| Method | Endpoint | Description | Body/Example |
|--------|----------|-------------|-------------|
| **POST** | `/api/students` | ➕ Create new student | JSON |
| **GET** | `/api/students` | 📋 Get all students | - |
| **GET** | `/api/students/{id}` | 🔍 Get student by ID | - |
| **PUT** | `/api/students/{id}` | ✏️ Update student | JSON |
| **DELETE** | `/api/students/{id}` | 🗑️ Delete student | - |
| **GET** | `/api/students/search?name={name}` | 🔍 Search by name | - |
| **GET** | `/api/students/email/{email}` | 📧 Get by email | - |
| **GET** | `/api/students/course/{course}` | 📚 Get by course | - |
| **GET** | `/api/students/age?min={min}&max={max}` | 📊 Get by age range | - |

### 🧾 Request/Response Examples

#### Create Student
```bash
POST /api/students
Content-Type: application/json

{
  "name": "Md Nawab Ali Khan",
  "email": "nakdev.nakhan@example.com",
  "age": 22,
  "course": "Computer Science"
}
```

#### Update Student
```bash
PUT /api/students/1
Content-Type: application/json

{
  "name": "Updated Name",
  "email": "updated.email@example.com",
  "age": 23,
  "course": "Software Engineering"
}
```

#### Search Students
```bash
GET /api/students/search?name=nakhan
GET /api/students/course/Computer%20Science
GET /api/students/age?min=20&max=25
```

### ⚠️ Error Response Format

```json
{
  "error": "Validation Failed",
  "timestamp": "2025-10-14T12:45:32Z",
  "status": 400,
  "message": "Bad Request",
  "details": {
    "email": "Email should be valid",
    "age": "Age must be at least 18"
  },
  "path": "/api/students"
}
```

## 🧪 Testing the API

### Using cURL

```bash
# Create a student
curl -X POST http://localhost:8080/api/students \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test Student",
    "email": "test@example.com",
    "age": 20,
    "course": "Computer Science"
  }'

# Get all students
curl http://localhost:8080/api/students

# Get student by ID
curl http://localhost:8080/api/students/1

# Update student
curl -X PUT http://localhost:8080/api/students/1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Updated Student",
    "email": "updated@example.com",
    "age": 21,
    "course": "Information Technology"
  }'

# Delete student
curl -X DELETE http://localhost:8080/api/students/1
```

### Using Postman

1. Import the collection or create requests manually
2. Set base URL to `http://localhost:8080`
3. Use the endpoints listed above
4. Test all CRUD operations

## 🔧 Configuration

### Application Properties

```properties
# Server Configuration
server.port=8080

# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/student_db
spring.datasource.username=root
spring.datasource.password=yourpassword

# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

# Logging
logging.level.com.studentmanagement=DEBUG
```

## 🚀 Advanced Features

### Search & Filtering
- **By Name**: `/api/students/search?name=John`
- **By Email**: `/api/students/email/john@example.com`
- **By Course**: `/api/students/course/Computer%20Science`
- **By Age Range**: `/api/students/age?min=18&max=25`

### Validation Rules
- **Name**: 2-100 characters, not blank
- **Email**: Valid email format, unique
- **Age**: 18-100 years old
- **Course**: 2-100 characters, not blank

## 🔒 Security Considerations

> **Note**: This is a prototype version. For production use, consider adding:
- JWT Authentication
- Role-based access control (RBAC)
- Input sanitization
- Rate limiting
- API versioning

## 🐛 Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Verify MySQL is running
   - Check database credentials in `application.properties`
   - Ensure database exists

2. **Port Already in Use**
   ```bash
   # Find process using port 8080
   lsof -i :8080
   # Kill the process
   kill -9 <PID>
   ```

3. **Compilation Errors**
   ```bash
   mvn clean compile
   mvn spring-boot:run
   ```

## 📊 Monitoring

- **Application Health**: `GET /actuator/health`
- **Application Info**: `GET /actuator/info`
- **Database Console**: Enable H2 console for debugging (if using H2)

## 🚀 Future Enhancements

- 🔒 JWT Authentication & Authorization
- 📘 Swagger/OpenAPI Documentation
- 🧠 Redis Caching Layer
- 🐳 Docker Containerization
- 📝 API Versioning Strategy
- 📊 Metrics and Monitoring
- 🧪 Comprehensive Test Suite


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](../../issues).

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---
## 🧑‍💻 Author

**[MD Nawab Ali Khan](https://github.com/nakhandev)**  
💼 *Java Backend Developer | Open Source Enthusiast*  

<p align="center">
  <a href="https://github.com/nakhandev">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/GitHub-nakhandev-181717?style=for-the-badge&logo=github&logoColor=white">
      <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/GitHub-nakhandev-F0F0F0?style=for-the-badge&logo=github&logoColor=black">
      <img alt="GitHub Profile" src="https://img.shields.io/badge/GitHub-nakhandev-181717?style=for-the-badge&logo=github&logoColor=white">
    </picture>
  </a>
  <a href="https://nakhandev.github.io">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/🌐%20Portfolio-nakhandev.github.io-0078D7?style=for-the-badge">
      <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/🌐%20Portfolio-nakhandev.github.io-0A66C2?style=for-the-badge">
      <img alt="Portfolio Link" src="https://img.shields.io/badge/🌐%20Portfolio-nakhandev.github.io-0078D7?style=for-the-badge">
    </picture>
  </a>
</p>

---

<p align="center">✨ Built with ❤️ using <b>Java + Spring Boot</b> ✨</p>

⭐ **If you found this project helpful, please give it a star!** ⭐

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
