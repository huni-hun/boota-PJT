package com.ssafy.happyhouse.jwt.repository;
import com.ssafy.happyhouse.jwt.entity.Auth;
import com.ssafy.happyhouse.jwt.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AuthRepository extends JpaRepository<Auth, Long> {
    Optional<Auth> findByUserId(Long userId);
    Optional<Auth> findById(Long authId);
}