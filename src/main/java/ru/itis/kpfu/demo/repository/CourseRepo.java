package ru.itis.kpfu.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.model.Guide;

public interface CourseRepo extends JpaRepository<Course, Long> {
    @Transactional
    void deleteByName(String name);
}
