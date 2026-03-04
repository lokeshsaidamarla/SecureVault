package com.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="password_history")
public class PasswordHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String oldPassword;

    private LocalDateTime changedAt;

    @ManyToOne
    @JoinColumn(name="user_id",nullable = false)
    private User user;

    public PasswordHistory() {
        this.changedAt = LocalDateTime.now();
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getOldPassword() { return oldPassword; }
    public void setOldPassword(String oldPassword) { this.oldPassword = oldPassword; }

    public LocalDateTime getChangedAt() { return changedAt; }
    public void setChangedAt(LocalDateTime changedAt) { this.changedAt = changedAt; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}
