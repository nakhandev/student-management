package com.studentmanagement.repository;

import com.studentmanagement.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

    /**
     * Find students by name containing (case-insensitive)
     * @param name the name to search for
     * @return list of students matching the name
     */
    List<Student> findByNameContainingIgnoreCase(String name);

    /**
     * Find student by email
     * @param email the email to search for
     * @return optional student if found
     */
    Optional<Student> findByEmail(String email);

    /**
     * Find students by course
     * @param course the course to search for
     * @return list of students in the course
     */
    List<Student> findByCourse(String course);

    /**
     * Check if email exists
     * @param email the email to check
     * @return true if email exists, false otherwise
     */
    boolean existsByEmail(String email);

    /**
     * Find students by age range
     * @param minAge minimum age
     * @param maxAge maximum age
     * @return list of students in age range
     */
    List<Student> findByAgeBetween(Integer minAge, Integer maxAge);
}
