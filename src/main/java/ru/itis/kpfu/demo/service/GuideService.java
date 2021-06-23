package ru.itis.kpfu.demo.service;

import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.model.Guide;

import java.util.List;

public interface GuideService {
    List<Guide> getAllGuides(Course course);
    Boolean addNewGuide(String name, Course course);
}
