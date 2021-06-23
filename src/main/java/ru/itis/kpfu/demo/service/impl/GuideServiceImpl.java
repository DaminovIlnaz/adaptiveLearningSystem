package ru.itis.kpfu.demo.service.impl;

import org.springframework.stereotype.Service;
import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.model.Guide;
import ru.itis.kpfu.demo.repository.GuideRepo;
import ru.itis.kpfu.demo.service.GuideService;

import java.util.List;

@Service
public class GuideServiceImpl implements GuideService {

    private GuideRepo guideRepo;

    public GuideServiceImpl(GuideRepo guideRepo) {
        this.guideRepo = guideRepo;
    }

    @Override
    public List<Guide> getAllGuides(Course course) {
        return guideRepo.getAllByCourse(course);
    }

    @Override
    public Boolean addNewGuide(String name, Course course) {
        guideRepo.save(
                Guide.builder()
                        .name(name)
                        .course(course)
                        .build()
        );
        return true;
    }


}
