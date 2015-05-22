package com.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.IRoleDao;
import com.cms.model.Role;
import com.cms.model.RoleRight;

@Service("roleService")
public class RoleService {
	@Autowired 
	private IRoleDao iRoleDao;

	public List<Role> listAllRoles() {
		return iRoleDao.listAllRoles();
	}
	public Role findRoleRight(Integer roleId) {
		return iRoleDao.findRoleRight(roleId);
	}
	
	public Role findRoleById(Integer roleId){
		return iRoleDao.findRoleById(roleId);
	}
	
	public void upRole(Role role){
		iRoleDao.upRole(role);
	}
	
	public void deleteRole(Integer roleId){
		iRoleDao.deleteRole(roleId);
	}
	public void deleteRoleRight(Integer roleId){
		iRoleDao.deleteRoleRight(roleId);
	}
	
	public void addRole(Role role) {
		iRoleDao.addRole(role);		
	}
	
	
	public void addRoleRight(RoleRight role){
		iRoleDao.addRoleRight(role);
	}
	
}
