package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.model.Right;
import com.cms.model.Role;
import com.cms.service.RightService;
import com.cms.service.RoleService;


@Controller
@RequestMapping("/admin/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private RightService rightService;
	

	@RequestMapping("/listAllRoles")
	public String listAllRoles(Model model){
		model.addAttribute("roles", roleService.listAllRoles());
		return "role/listAllRoles";		
	}
	
	@RequestMapping("/edit/{roleId}")
	public String edit(@PathVariable("roleId") Integer roleId, Model model) {
		model.addAttribute("role", roleService.findRoleById(roleId));
		return "role/editRole";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public @ResponseBody void edit(Role role) {
		roleService.upRole(role);		
	}
	
	@RequestMapping(value="/deleteRole/{roleId}",method=RequestMethod.GET)
	public @ResponseBody void deleteRole(@PathVariable("roleId")Integer roleId) {
		roleService.deleteRoleRight(roleId);
		roleService.deleteRole(roleId);
	}
	
	@RequestMapping("/addRole")
	public String addRole(Model model){
		model.addAttribute("role",new Role());
		return "role/addRole";		
	}
	
	@RequestMapping(value="/addRole",method=RequestMethod.POST)
	public @ResponseBody void addRole(Role role) {
		roleService.addRole(role);		
	}
	
	
	
	@RequestMapping("/listRoleRights/{roleId}")
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
		return "role/listRoleRights";
	}
	
	
	
}
