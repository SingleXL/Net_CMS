package com.cms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.model.Right;
import com.cms.model.Role;
import com.cms.model.RoleRight;
import com.cms.service.RightService;
import com.cms.service.RoleService;

@Controller
@RequestMapping("/admin/right")
public class RightController {
	@Autowired
	private RightService rightService;
	
	@Autowired
	private RoleService roleService;

	@RequestMapping("/listAllRights")
	public String findAllRights(Model model){
		List<Right> rights = rightService.findAllRights();		
		model.addAttribute("rights", rights);
		return "right/listAllRights";
	}
	
	@RequestMapping("/allocRight")
	public String allocRight(Model model){
		List<Role> roles = roleService.listAllRoles();
		model.addAttribute("roles", roles);
		return "right/allocRight";
	}
	
	
	@RequestMapping("/editRight/{roleId}")
	public String editRight(@PathVariable("roleId") Integer roleId,Model model){
		
		Role role = roleService.findRoleRight(roleId);
		List<Right> rights = rightService.findAllRights();	
		
		List<Right> roleRights = role.getRights();
		for(Right right: roleRights){
			int pos = rights.indexOf(right);
			Right temp = rights.get(pos);
			temp.setChecked(true);
		}
		
		model.addAttribute("roleId", roleId);
		model.addAttribute("rights", rights);
		return "right/editRight";
	}
	
	@RequestMapping(value="/editRight",method=RequestMethod.POST)
	public @ResponseBody void editRight(HttpServletRequest request){
		
		
		String roleId = request.getParameter("roleId");
		String rightsStr = request.getParameter("rights");
		String[] rights = rightsStr.split("\\|");
		RoleRight rr = new RoleRight();
		
		//先清除以前的权限
		roleService.deleteRoleRight(Integer.parseInt(roleId));
		
		//更新现在的
		for(String right:rights){
			rr.setRight(new Right(Integer.parseInt(right)));
			rr.setRole(new Role(Integer.parseInt(roleId)));
			roleService.addRoleRight(rr);
		}
		
	}
	
}
