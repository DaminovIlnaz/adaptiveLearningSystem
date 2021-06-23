package ru.itis.kpfu.demo.service.impl;

import org.springframework.stereotype.Service;
import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.repository.CourseRepo;
import ru.itis.kpfu.demo.service.CourseService;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    private CourseRepo courseRepo;

    public CourseServiceImpl(CourseRepo courseRepo) {
        this.courseRepo = courseRepo;
    }

    @Override
    public Boolean addNewCourse(String name, String  description){
        courseRepo.save(
                Course.builder()
                .name(name)
                .description(description)
                .build()
        );
        return true;
    }

    @Override
    public Boolean deleteCourse(String name){
        courseRepo.deleteByName(name);
        return true;
    }

    @Override
    public List<Course> getAllCourses() {
        return courseRepo.findAll();
    }
}
