package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberSerivce {
	@Autowired
	SqlSessionTemplate template;
	
	public MemberDto login(String userid, String userpw) throws SQLException {
		MemberDto member = template.getMapper(MemberMapper.class).selectOne(userid, userpw);
		if(member != null)
			return member;
		else
			return null;
	}
	
	public boolean regist(MemberDto member) throws SQLException {
		if(template.getMapper(MemberMapper.class).insert(member) == 1)
			return true;
		else
			return false;
	}
	
	public boolean delete(String userid) throws SQLException {
		if(template.getMapper(MemberMapper.class).delete(userid) == 1)
			return true;
		else
			return false;
	}
	
	public boolean update(MemberDto member) throws SQLException {
		if(template.getMapper(MemberMapper.class).update(member) == 1)
			return true;
		else
			return false;
	}
}
