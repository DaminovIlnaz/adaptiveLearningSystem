package ru.itis.kpfu.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.model.Guide;

import java.util.List;

public interface GuideRepo extends JpaRepository<Guide, Long> {
    List<Guide> getAllByCourse(Course course);

}
