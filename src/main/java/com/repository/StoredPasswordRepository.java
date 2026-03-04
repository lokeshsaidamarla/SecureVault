package com.repository;

import com.model.StoredPassword;
import com.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StoredPasswordRepository extends JpaRepository<StoredPassword, Long> {
    List<StoredPassword> findByUser(User user);
}
