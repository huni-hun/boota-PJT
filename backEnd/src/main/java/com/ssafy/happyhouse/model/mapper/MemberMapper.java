package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface MemberMapper {
	public int insert(MemberDto member) throws SQLException; //회원가입
	public MemberDto selectOne(@Param("id") String id, @Param("pw") String password) throws SQLException; //로그인, 로그아웃 
	public int delete(String id) throws SQLException;
	public int update(MemberDto member) throws SQLException;
}
