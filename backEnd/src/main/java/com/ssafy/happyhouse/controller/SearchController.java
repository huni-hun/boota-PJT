package com.ssafy.happyhouse.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@CrossOrigin(origins = { "*" }, maxAge = 6000)
public class SearchController {
	@RequestMapping("/search")
	public String search() {
		return "search";
	}
	
}
