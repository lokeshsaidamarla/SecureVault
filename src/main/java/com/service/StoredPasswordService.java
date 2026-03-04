package com.service;

import com.model.StoredPassword;
import com.model.User;
import com.repository.StoredPasswordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class StoredPasswordService {

    @Autowired
    private StoredPasswordRepository repo;

    public void addPassword(User user, String siteName, String siteUrl, String siteUsername, String sitePassword) {
        StoredPassword sp = new StoredPassword();
        sp.setUser(user);
        sp.setSiteName(siteName);
        sp.setSiteUrl(siteUrl);
        sp.setSiteUsername(siteUsername);
        sp.setSitePassword(sitePassword); // later encrypt
        sp.setCreatedAt(LocalDateTime.now());
        repo.save(sp);
    }

    public List<StoredPassword> getPasswords(User user) {
        return repo.findByUser(user);
    }

    public void deletePassword(Long id) {
        repo.deleteById(id);
    }

    public StoredPassword getById(Long id) {
        return repo.findById(id).orElse(null);
    }

    public void updatePassword(StoredPassword sp) {
        repo.save(sp);
    }
}
