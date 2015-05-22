package com.cms.controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.model.Right;
import com.cms.model.User;
import com.cms.service.RightService;
import com.cms.service.RoleService;
import com.cms.service.UserService;

@Controller
@RequestMapping
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private RightService rightService;
	
	@Autowired
	private RoleService roleService;

	@SuppressWarnings("unchecked")
	@RequestMapping("/login")
	public @ResponseBody String login(HttpServletRequest request,
			HttpSession session) {
		
		String name = request.getParameter("user");
		User user = userService.findUserRoleByName("admin");

		// 初始化权限总和数组
		int maxRightPos = rightService.getMaxRightPos();
		user.setRightSum(new long[maxRightPos + 1]);

		// 计算用户的权限总和
		user.calculateRightSum(roleService);
		session.setMaxInactiveInterval(-1);
		
		session.setAttribute("user", user);
		ServletContext sc = request.getServletContext();
		user.setMap((Map<String,Right>)sc.getAttribute("all_rights"));
		
		return "";
	}

}
