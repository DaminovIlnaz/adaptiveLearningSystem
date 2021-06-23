package ru.itis.kpfu.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.kpfu.demo.model.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
