package com.cms.dao;

import java.util.List;

import com.cms.model.Role;
import com.cms.model.RoleRight;

public interface IRoleDao {

	public List<Role> listAllRoles();
	public Role findRoleRight(Integer roleId);
	public Role findRoleById(Integer roleId);
	public void upRole(Role role);
	public void deleteRole(Integer roleId);
	public void deleteRoleRight(Integer roleId);
	public void addRole(Role role);
	public void addRoleRight(RoleRight role);
	
	
}
