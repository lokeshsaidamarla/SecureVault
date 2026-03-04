package com.repository;

import com.model.PasswordHistory;
import com.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface PasswordHistoryRepository extends JpaRepository<PasswordHistory, Long> {

    // ✅ Add this line — it finds the latest 3 password history records for a user
    List<PasswordHistory> findTop3ByUserOrderByIdDesc(User user);
}
