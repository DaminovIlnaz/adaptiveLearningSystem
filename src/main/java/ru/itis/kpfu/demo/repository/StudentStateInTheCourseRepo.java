package ru.itis.kpfu.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.itis.kpfu.demo.model.StudentStateInTheCourse;

public interface StudentStateInTheCourseRepo extends JpaRepository<StudentStateInTheCourse, Long> {
    @Query("SELECT s FROM StudentStateInTheCourse s WHERE s.course.id = ?1 AND s.user.id = ?2")
    StudentStateInTheCourse getStudentStateInTheCourse(Long courseId, Long UserId);
}
