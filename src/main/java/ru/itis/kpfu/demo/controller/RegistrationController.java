package ru.itis.kpfu.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.kpfu.demo.model.Role;
import ru.itis.kpfu.demo.model.User;
import ru.itis.kpfu.demo.repository.UserRepo;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/reg")
    public String registration() {
        return "reg";
    }

    @PostMapping("/reg")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            model.put("message", "User exists!");
            return "reg";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.STUDENT));
        userRepo.save(user);

        return "redirect:/login";
    }
}
