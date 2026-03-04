package com.service;

import com.model.User;
import com.model.PasswordHistory;
import com.repository.UserRepository;
import com.repository.PasswordHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private PasswordHistoryRepository phRepo;

    public User findByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    // ✅ Add this method
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }

    public void saveUser(User user) {
        userRepo.save(user);
    }

    public void addPasswordHistory(User user, String encodedPassword) {
        PasswordHistory ph = new PasswordHistory();
        ph.setUser(user);
        ph.setOldPassword(encodedPassword);
        phRepo.save(ph);
    }

    public List<PasswordHistory> last3Histories(User user) {
        return phRepo.findTop3ByUserOrderByIdDesc(user);
    }
}
