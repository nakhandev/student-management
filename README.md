<!-- ⚡ Student Management System - REST API ⚡ -->

<h1 align="center">🎓 Student Management System</h1>
<h3 align="center">A CRUD-based REST API built with <span style="color:#6DB33F;">Spring Boot</span>, <span style="color:#00758F;">MySQL</span>, and <span style="color:#E76F00;">Java</span></h3>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/Java-17+-E76F00?style=for-the-badge&logo=openjdk&logoColor=white">
    <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/Java-17+-F89820?style=for-the-badge&logo=openjdk&logoColor=black">
    <img alt="Java Badge" src="https://img.shields.io/badge/Java-17+-E76F00?style=for-the-badge&logo=openjdk&logoColor=white">
  </picture>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/Spring%20Boot-3.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
    <source media="(prefers-color-scheme: light)" srcset="https://img.shields.io/badge/Spring%20Boot-3.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=black">
    <img alt="Spring Boot Badge" src="https://img.shields.io/badge/Spring%20Boot-3.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
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

---

## 🧩 Overview

A **modern RESTful API** for managing student records — featuring full **CRUD operations**, advanced **data validation**, and **centralized error handling**.  
Built for clean architecture, scalability, and real-world backend learning.

---

## ⚙️ Features

- 📝 **Create** – Add new student records  
- 🔍 **Read** – Retrieve single or all students  
- 🛠️ **Update** – Modify existing student details  
- ❌ **Delete** – Remove a student by ID  
- 🧠 **Validation** – Strong field-level input validation  
- ⚡ **Exception Handling** – Global error responses  
- 🔄 **RESTful Design** – Intuitive endpoints & structure  

---

## 🧱 Tech Stack

| Tech | Role |
|------|------|
| ☕ **Java 17+** | Core language |
| 🌿 **Spring Boot** | REST framework |
| 🧮 **MySQL** | Database |
| 🧰 **Maven** | Build automation |
| 🧪 **Postman / cURL** | API testing |

---

## 📂 Project Structure
```bash
student-management-system/
├── controller/     # REST Controllers
├── service/        # Business Logic Layer
├── repository/     # Data Access Layer
├── model/          # JPA Entities
├── exception/      # Global Exception Handlers
└── resources/
    ├── application.properties
    └── data.sql (optional)
```

---

## ⚡ Setup & Run

### 🔧 1. Clone the repo
```bash
git clone https://github.com/nakhandev/student-management.git
cd student-management-system
```

### 🗄️ 2. Configure Database (`application.properties`)
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/student_db
spring.datasource.username=root
spring.datasource.password=yourpassword
spring.jpa.hibernate.ddl-auto=update
```

### ▶️ 3. Run the App
```bash
mvn spring-boot:run
```
> Runs on: **http://localhost:8080**

---

## 📡 API Endpoints

| Method | Endpoint | Description |
|--------|-----------|-------------|
| `POST` | `/api/students` | ➕ Add new student |
| `GET` | `/api/students` | 📋 View all students |
| `GET` | `/api/students/{id}` | 🔍 Get student by ID |
| `PUT` | `/api/students/{id}` | ✏️ Update student |
| `DELETE` | `/api/students/{id}` | 🗑️ Delete student |

---

## 🧾 Example JSON Request
```json
{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "age": 22,
  "course": "Computer Science"
}
```

---

## ⚠️ Error Response Example
```json
{
  "timestamp": "2025-10-14T12:45:32Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Email must not be empty",
  "path": "/api/students"
}
```

---

## 🚀 Future Enhancements

- 🔒 JWT Authentication & Role-based Access  
- 📘 Swagger API Documentation  
- 🧠 Redis Caching  
- 🐳 Docker Containerization  

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
