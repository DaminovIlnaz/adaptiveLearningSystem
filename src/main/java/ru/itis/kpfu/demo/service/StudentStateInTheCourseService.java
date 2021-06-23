package ru.itis.kpfu.demo.service;

import ru.itis.kpfu.demo.model.StudentStateInTheCourse;
import ru.itis.kpfu.demo.repository.StudentStateInTheCourseRepo;

public interface StudentStateInTheCourseService {
    StudentStateInTheCourse getStudentStateInTheCourse(Long courseId, Long UserId);
    void startGuide(StudentStateInTheCourse studentStateInTheCourse);
    void finishGuide(StudentStateInTheCourse studentStateInTheCourse);
    void startFirstTest(StudentStateInTheCourse studentStateInTheCourse);
}
