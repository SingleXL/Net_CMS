package com.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/")
	@ResponseBody
	public String admin() {
		return "";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "admin/index";
	}
	

}
