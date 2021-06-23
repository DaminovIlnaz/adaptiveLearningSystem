package ru.itis.kpfu.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.itis.kpfu.demo.model.Course;
import ru.itis.kpfu.demo.model.StudentStateInTheCourse;
import ru.itis.kpfu.demo.model.User;
import ru.itis.kpfu.demo.repository.StudentStateInTheCourseRepo;
import ru.itis.kpfu.demo.service.StudentStateInTheCourseService;

@Controller
public class StudentStateInTheCourseController {

    private StudentStateInTheCourseService service;

    public StudentStateInTheCourseController(StudentStateInTheCourseService service) {
        this.service = service;
    }

    @GetMapping("/guide")
    public String getGuidePage(
            ModelMap model,
            @RequestParam("courseId") Long courseId,
            @RequestParam("userId") Long userId

    ){
        StudentStateInTheCourse studentStateInTheCourse = service.getStudentStateInTheCourse(courseId,userId);
        model.addAttribute("state", studentStateInTheCourse);
        return "guide";
    }

    @GetMapping("/startGuide/{studentStateInTheCourse}")
    public String startCourse(
            @ModelAttribute("model") ModelMap model,
            StudentStateInTheCourse studentStateInTheCourse,
            RedirectAttributes attributes
    ){
        service.startGuide(studentStateInTheCourse);
        attributes.addAttribute("courseId", studentStateInTheCourse.getCourse().getId());
        attributes.addAttribute("userId", studentStateInTheCourse.getUser().getId());
        return "redirect:/guide";
    }

    @GetMapping("/startFirstTest/{studentStateInTheCourse}")
    public String startFirstTest(
            @ModelAttribute("model") ModelMap model,
            StudentStateInTheCourse studentStateInTheCourse,
            RedirectAttributes attributes
    ){
        service.startFirstTest(studentStateInTheCourse);
        attributes.addAttribute("courseId", studentStateInTheCourse.getCourse().getId());
        attributes.addAttribute("userId", studentStateInTheCourse.getUser().getId());
        return "redirect:/guide";
    }


}
