package com.cms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.model.Page;
import com.cms.model.Right;
import com.cms.model.Role;
import com.cms.model.RoleRight;
import com.cms.model.User;
import com.cms.model.UserRole;
import com.cms.service.RoleService;
import com.cms.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping("/listPageUser")
	public String listPageUser(String pageNoStr, Model model,HttpSession session) {
		int pageNo = 1;
		int pageSize = 13;

		try {
			pageNo = Integer.parseInt(pageNoStr);
		} catch (Exception e) {
			pageNo = 1;
		}

		Page<User> pageUser = new Page<User>(pageNo, pageSize);
		pageUser.setList(userService.listPageUser(pageUser));
		pageUser.setTotalNum(userService.totalNum());
		model.addAttribute("pageUser", pageUser);
		return "user/listAll";

	}

	@RequestMapping("/addUser")
	public String addUser(Model model) {
		model.addAttribute("user", new User());
		return "user/addUser";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public User addUser(@ModelAttribute("user") User user) {
		userService.addUser(user);
		return user;
	}

	@RequestMapping("/delete")
	public String delete() {
		return "";
	}

	@RequestMapping("/update")
	public String update() {
		return "";
	}
	
	
	
	
	@RequestMapping("/allocRole")
	public String allocRole(Model model) {
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "user/allocRole";
	}

	
	
	@RequestMapping(value="/editUserRole/{userId}",method=RequestMethod.GET)
	public String editUserRole(@PathVariable("userId") Integer userId,Model model){
		
		User user = userService.findUserRoleById(userId);
		List<Role> roles = roleService.listAllRoles();
		
		List<Role> userRoles = user.getRoles();
		
		for(Role role: userRoles){
			int pos = roles.indexOf(role);
			Role temp = roles.get(pos);
			temp.setSelected(true);
		}
		
		model.addAttribute("userId", userId);
		model.addAttribute("roles", roles);
		
		return "user/editUserRole";
	}
	
	
	@RequestMapping(value="/editUserRole",method=RequestMethod.POST)
	public @ResponseBody void editUserRole(HttpServletRequest request){
		
		String userId = request.getParameter("userId");
		String rolesStr = request.getParameter("roles");
		String[] roles = rolesStr.split("\\|");
		
		UserRole ur = new UserRole();
		
		//先清除以前的角色
		userService.deleteUserRole(Integer.parseInt(userId));
		
		
		//更新现在的
		for(String role:roles){
			ur.setUser(new User(Integer.parseInt(userId)));
			ur.setRole(new Role(Integer.parseInt(role)) );
			userService.addUserRole(ur);
		}
		
		
	}
	
	
}
