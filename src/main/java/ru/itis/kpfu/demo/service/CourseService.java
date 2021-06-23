package ru.itis.kpfu.demo.service;

import ru.itis.kpfu.demo.model.Course;

import java.util.List;

public interface CourseService {

    List<Course> getAllCourses();
    Boolean addNewCourse(String name, String  description);
    Boolean deleteCourse(String name);
}
