package com.ssafy.happyhouse.jwt.dto;

import lombok.Getter;

@Getter
public class UserRequest {
    private String userId;
    private String userPw;
}