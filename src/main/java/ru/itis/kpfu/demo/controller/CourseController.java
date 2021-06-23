package ru.itis.kpfu.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.itis.kpfu.demo.service.CourseService;

@Controller
public class CourseController {

    private CourseService courseService;

    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/courses")
    public String getCoursePage(
            Model model
    ){
        model.addAttribute("courses", courseService.getAllCourses());
        return "course";
    }

    @PostMapping("/addNewCourse")
    public String addNewCourse(
            @ModelAttribute("model") ModelMap model,
            @RequestParam String name,
            @RequestParam String description
            ){
        courseService.addNewCourse(name, description);
        return "redirect:/courses";
    }

    @PostMapping("/deleteCourse")
    public String deleteCourse(
            @ModelAttribute("model") ModelMap model,
            @RequestParam String name
    ){
        courseService.deleteCourse(name);
        return "redirect:/courses";
    }

}
