package ru.itis.kpfu.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.itis.kpfu.demo.model.User;
import ru.itis.kpfu.demo.repository.UserRepo;

import java.io.IOException;
import java.util.*;

@Controller
public class MainController {

    @Autowired
    private UserRepo userRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

//    @GetMapping("/test")
//    public String test(Map<String,
//            Object> model
//    ) {
//        return "test";
//    }


    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        return "course";
    }

    @PostMapping("add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag,
            Map<String, Object> model,
            @RequestParam("file") MultipartFile file
    )throws IOException
    {

        return "course";
    }

}
