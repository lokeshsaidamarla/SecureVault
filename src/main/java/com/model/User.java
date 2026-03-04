package com.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "users") 
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String password;

    private String fullName;
    private String email;
    private String phone;
  // e.g. Admin, Employee, Manager

    private LocalDateTime passwordLastChanged;
    
    @Lob
    @Column(columnDefinition = "LONGTEXT")
    private String faceImage;


    public String getFaceImage() {
		return faceImage;
	}
	public void setFaceImage(String faceImage) {
		this.faceImage = faceImage;
	}
	// Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }


    public LocalDateTime getPasswordLastChanged() { return passwordLastChanged; }
    public void setPasswordLastChanged(LocalDateTime passwordLastChanged) { this.passwordLastChanged = passwordLastChanged; }
}
