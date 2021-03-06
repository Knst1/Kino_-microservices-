package ru.rsoi.cinemaservice.service;

import org.springframework.security.core.userdetails.User;

import java.util.Optional;

public interface TokenService {

    String login(String username, String password);
    Optional<User> findByToken(String token);
}
