package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.MemberSerivce;

@Controller
@RequestMapping("/member")
@CrossOrigin(origins = { "*" }, maxAge = 6000)
public class MemberController {
	
	@Autowired
	MemberSerivce mservice;
	
	@GetMapping("/regist")
	public String regist() {
		return "regist";
	}

	@PostMapping("/regist")
	public String regist(MemberDto member) throws SQLException {
		System.out.println(member.toString());
		if(mservice.regist(member) == true) {
			return "registerResult";
		}else {
			return "registFail";
		}
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "logout";
	}
	
	@PostMapping("/login")
	public String login(String userid, String userpw, HttpSession session) throws SQLException {
		System.out.println(userid);
		MemberDto userinfo = mservice.login(userid, userpw); 
		if(userinfo != null) {
			System.out.println("ok");
			session.setAttribute("loginInfo", userinfo);
			return "loginResult";
		}else {
			return "loginFail";
		}
	}
	
	@GetMapping("/memberinfo")
	public String memberinfo(HttpSession session) {
		MemberDto userInfo = (MemberDto) session.getAttribute("loginInfo");
		
		session.setAttribute("loginInfo", userInfo);
		System.out.println(userInfo.getName());
		return "memberInfo";
	}
	
	@PostMapping("/change")
	public String change(MemberDto member, HttpSession session) throws SQLException {
		if(mservice.update(member) == true) {
			System.out.println("ok");
			session.invalidate();
			return "changeResult";
		}else {
			return "changeFail";
		}
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "delete";
	}
	
	@PostMapping("/delete")
	public String delete(HttpSession session) throws SQLException {
		MemberDto userInfo = (MemberDto) session.getAttribute("loginInfo");
		mservice.delete(userInfo.getId());
		
		session.invalidate();
		return "deleteResult";
	}
}
