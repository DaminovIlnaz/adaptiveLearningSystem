package ru.itis.kpfu.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.model.Guide;
import ru.itis.kpfu.demo.model.StudentStateInTheCourse;
import ru.itis.kpfu.demo.repository.CourseRepo;
import ru.itis.kpfu.demo.service.CourseService;
import ru.itis.kpfu.demo.service.GuideService;

@Controller
public class CourseControllerAdmin {

    private GuideService guideService;
    private CourseRepo courseRepo;

    public CourseControllerAdmin(GuideService guideService,CourseRepo courseRepo) {
        this.guideService = guideService;
        this.courseRepo = courseRepo;
    }

    @GetMapping("/editCourse/{course}")
    public String editGuide(
            @ModelAttribute("model") ModelMap model,
            Course course,
            RedirectAttributes attributes
    ){
        System.out.println("Это состояние");
        model.addAttribute("course", courseRepo.findById(course.getId()));
        return "admin/editCourse";
    }

    @PostMapping("/addGuide/{course}")
    public String addGuide(
            ModelMap model,
            @RequestParam String name,
            Course course
    ){
        guideService.addNewGuide(name,course);
        return "redirect:/editCourse/" + course.getId();
    }

}
