package com.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Service
public class SafeLinkCheckerService {

    @Value("${google.safebrowsing.apiKey}")
    private String apiKey;

    private final RestTemplate restTemplate = new RestTemplate();

    public String checkUrlSafety(String url) {
    	String apiUrl = "https://safebrowsing.googleapis.com/v4/threatMatches:find?key=AIzaSyC9w8cCrmQ9S9EFPxxMMJZzJ2tn-h71lUA";


        Map<String, Object> request = Map.of(
                "client", Map.of("clientId", "secure-password-app", "clientVersion", "1.0"),
                "threatInfo", Map.of(
                        "threatTypes", List.of("MALWARE", "SOCIAL_ENGINEERING", "UNWANTED_SOFTWARE", "POTENTIALLY_HARMFUL_APPLICATION"),
                        "platformTypes", List.of("ANY_PLATFORM"),
                        "threatEntryTypes", List.of("URL"),
                        "threatEntries", List.of(Map.of("url", url))
                )
        );

        Map response = restTemplate.postForObject(apiUrl, request, Map.class);

        if (response != null && !response.isEmpty()) {
            return "⚠️ This link is unsafe!";
        } else {
            return "✅ Safe link.";
        }
    }
}
