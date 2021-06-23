package ru.itis.kpfu.demo.service.impl;

import org.springframework.stereotype.Service;
import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.model.StudentStateInTheCourse;
import ru.itis.kpfu.demo.model.User;
import ru.itis.kpfu.demo.repository.CourseRepo;
import ru.itis.kpfu.demo.repository.StudentStateInTheCourseRepo;
import ru.itis.kpfu.demo.repository.UserRepo;
import ru.itis.kpfu.demo.service.StudentStateInTheCourseService;

import java.util.Optional;

@Service
public class StudentStateInTheCourseServiceImpl implements StudentStateInTheCourseService {

    private StudentStateInTheCourseRepo studentStateInTheCourseRepo;
    private UserRepo userRepo;
    private CourseRepo courseRepo;

    public StudentStateInTheCourseServiceImpl(
            StudentStateInTheCourseRepo studentStateInTheCourseRepo,
            UserRepo userRepo,
            CourseRepo courseRepo) {
        this.studentStateInTheCourseRepo = studentStateInTheCourseRepo;
        this.userRepo = userRepo;
        this.courseRepo = courseRepo;
    }

    @Override
    public StudentStateInTheCourse getStudentStateInTheCourse(Long courseId, Long userId) {
        StudentStateInTheCourse studentStateInTheCourse = studentStateInTheCourseRepo.getStudentStateInTheCourse(courseId, userId);
        if (studentStateInTheCourse == null){

            Optional<User> existedUser = userRepo.findById(userId);
            if (!existedUser.isPresent()) {
                throw new IllegalArgumentException("User not found");
            }
            User user = existedUser.get();

            Optional<Course> existedCourse = courseRepo.findById(courseId);
            if (!existedCourse.isPresent()) {
                throw new IllegalArgumentException("User not found");
            }
            Course course = existedCourse.get();

            studentStateInTheCourse = StudentStateInTheCourse.builder()
                    .course(course)
                    .user(user)
                    .state(-1)
                    .build();
            studentStateInTheCourseRepo.save(studentStateInTheCourse);
        }
        return studentStateInTheCourse;
    }

    @Override
    public void startGuide(StudentStateInTheCourse studentStateInTheCourse) {
        studentStateInTheCourse.setState(0);
        studentStateInTheCourseRepo.save(studentStateInTheCourse);
    }

    @Override
    public void finishGuide(StudentStateInTheCourse studentStateInTheCourse) {
        studentStateInTheCourse.setState(1);
        studentStateInTheCourseRepo.save(studentStateInTheCourse);
    }

    @Override
    public void startFirstTest(StudentStateInTheCourse studentStateInTheCourse) {
        studentStateInTheCourse.setState(2);
        studentStateInTheCourseRepo.save(studentStateInTheCourse);
    }


}
