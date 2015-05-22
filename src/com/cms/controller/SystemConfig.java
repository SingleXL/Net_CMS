package com.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/config")
public class SystemConfig {

	// 图片管理
	
	
	
	
	// 链接管理
	@RequestMapping("/link")
	public String link() {

		return "config/links";
	}

	
	

	// 网站简介

	
	
}
