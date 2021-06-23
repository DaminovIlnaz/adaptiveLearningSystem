package ru.itis.kpfu.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.Map;

@Controller
public class TestController {

    @GetMapping("/test")
    public String test(){
        System.out.println("Салам епт");
        return "test";
    }

    @GetMapping("/addCompetence")
    public String test2(
            Model model,
            @RequestParam("res") String res,
            @RequestParam("count") Integer count
    ){
        System.out.println(res);
        System.out.println(count);
        return "test";
    }

}
