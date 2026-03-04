package com.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import com.repository.UserRepository;
import com.model.User;
import java.time.LocalDateTime;
import java.util.List;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepo;

    @Override
    public void run(String... args) throws Exception {
        List<User> users = userRepo.findAll();
        for (User u : users) {
            if (u.getPasswordLastChanged() == null) {
                u.setPasswordLastChanged(LocalDateTime.now().minusDays(1)); // set to yesterday
                userRepo.save(u);
            }
        }
    }
}
