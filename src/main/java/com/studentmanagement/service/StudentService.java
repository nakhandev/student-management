package com.studentmanagement.service;

import com.studentmanagement.model.Student;
import com.studentmanagement.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class StudentService {

    private final StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    /**
     * Create a new student
     * @param student the student to create
     * @return the created student
     * @throws RuntimeException if email already exists
     */
    public Student createStudent(Student student) {
        if (studentRepository.existsByEmail(student.getEmail())) {
            throw new RuntimeException("Student with email " + student.getEmail() + " already exists");
        }
        return studentRepository.save(student);
    }

    /**
     * Get all students
     * @return list of all students
     */
    @Transactional(readOnly = true)
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    /**
     * Get student by ID
     * @param id the student ID
     * @return optional student if found
     */
    @Transactional(readOnly = true)
    public Optional<Student> getStudentById(Long id) {
        return studentRepository.findById(id);
    }

    /**
     * Update an existing student
     * @param id the student ID
     * @param studentDetails the updated student details
     * @return the updated student
     * @throws RuntimeException if student not found or email already exists
     */
    public Student updateStudent(Long id, Student studentDetails) {
        Student student = studentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Student not found with id: " + id));

        // Check if email is being changed and if new email already exists
        if (!student.getEmail().equals(studentDetails.getEmail()) &&
            studentRepository.existsByEmail(studentDetails.getEmail())) {
            throw new RuntimeException("Student with email " + studentDetails.getEmail() + " already exists");
        }

        student.setName(studentDetails.getName());
        student.setEmail(studentDetails.getEmail());
        student.setAge(studentDetails.getAge());
        student.setCourse(studentDetails.getCourse());

        return studentRepository.save(student);
    }

    /**
     * Delete a student by ID
     * @param id the student ID
     * @throws RuntimeException if student not found
     */
    public void deleteStudent(Long id) {
        if (!studentRepository.existsById(id)) {
            throw new RuntimeException("Student not found with id: " + id);
        }
        studentRepository.deleteById(id);
    }

    /**
     * Find students by name
     * @param name the name to search for
     * @return list of matching students
     */
    @Transactional(readOnly = true)
    public List<Student> findStudentsByName(String name) {
        return studentRepository.findByNameContainingIgnoreCase(name);
    }

    /**
     * Find student by email
     * @param email the email to search for
     * @return optional student if found
     */
    @Transactional(readOnly = true)
    public Optional<Student> findStudentByEmail(String email) {
        return studentRepository.findByEmail(email);
    }

    /**
     * Find students by course
     * @param course the course to search for
     * @return list of students in the course
     */
    @Transactional(readOnly = true)
    public List<Student> findStudentsByCourse(String course) {
        return studentRepository.findByCourse(course);
    }

    /**
     * Find students by age range
     * @param minAge minimum age
     * @param maxAge maximum age
     * @return list of students in age range
     */
    @Transactional(readOnly = true)
    public List<Student> findStudentsByAgeRange(Integer minAge, Integer maxAge) {
        return studentRepository.findByAgeBetween(minAge, maxAge);
    }

    /**
     * Check if student exists by ID
     * @param id the student ID
     * @return true if exists, false otherwise
     */
    @Transactional(readOnly = true)
    public boolean existsById(Long id) {
        return studentRepository.existsById(id);
    }
}
