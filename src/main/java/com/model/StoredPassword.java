package com.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class StoredPassword {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String siteName;
    private String siteUrl;
    private String siteUsername;
    private String sitePassword; // (we’ll encrypt later)
    private LocalDateTime createdAt;

    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getSiteUrl() {
		return siteUrl;
	}

	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}

	public String getSiteUsername() {
		return siteUsername;
	}

	public void setSiteUsername(String siteUsername) {
		this.siteUsername = siteUsername;
	}

	public String getSitePassword() {
		return sitePassword;
	}

	public void setSitePassword(String sitePassword) {
		this.sitePassword = sitePassword;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    // Getters & Setters
}
