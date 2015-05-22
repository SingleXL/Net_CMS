package com.cms.model;

import java.util.List;

//用户角色
public class Role {

	private Integer roleId;
	private String roleName;
	private String roleValue;  // 默认超级管理员  -1
	private String roleDesc;

	private boolean selected;
	
	public boolean isSelected() {
		return selected;
	}


	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	List<Right> rights;

	
	public Role() {
	}

	
	public Role(Integer id) {
		this.roleId = id;
	}
	
	
	
	
	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public List<Right> getRights() {
		return rights;
	}

	public void setRights(List<Right> rights) {
		this.rights = rights;
	}

	public Integer getId() {
		return roleId;
	}

	public void setId(Integer id) {
		this.roleId = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleValue() {
		return roleValue;
	}

	public void setRoleValue(String roleValue) {
		this.roleValue = roleValue;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	@Override
	public boolean equals(Object obj) {
		return this.getId() == ((Role)obj).getId();
	}
	
}
