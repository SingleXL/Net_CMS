package com.cms.model;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cms.service.RoleService;

//用户
public class User {

	private Integer userId;
	private String name;
	private String nickname;
	private String pass;
	private String email;
	private long[] rightSum;

	private Map<String, Right> map = new HashMap<String, Right>();

	public User(int parseInt) {
		this.userId = parseInt;
	}

	public User() {
	}

	public Map<String, Right> getMap() {
		return map;
	}

	public void setMap(Map<String, Right> map) {
		this.map = map;
	}

	public long[] getRightSum() {
		return rightSum;
	}

	public void setRightSum(long[] rightSum) {
		this.rightSum = rightSum;
	}

	List<Role> roles = new LinkedList<Role>();
	private boolean superAdmin;

	public boolean isSuperAdmin() {
		return superAdmin;
	}

	public void setSuperAdmin(boolean superAdmin) {
		this.superAdmin = superAdmin;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNickname() {
		return nickname;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getUserId() {
		return userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/*
	 * 计算总和
	 */
	public void calculateRightSum(RoleService roleService) {
		int pos = 0;
		long code = 0;
		for (Role role : roles) {
			// 判断超级管理员
			if ("-1".equals(role.getRoleValue())) {
				this.superAdmin = true;
				roles = null;// 去除 User类里面与role的绑定 减小存放进Session的User的大小
				return;
			}
			role = roleService.findRoleRight(role.getId());

			for (Right r : role.getRights()) {
				pos = r.getRightPos();// 权限位
				code = r.getRightCode();// 权限码
				rightSum[pos] = rightSum[pos] | code; // 或运算叠加权限 （01101 | 10000=
														// 11101）
			}
		}
		roles = null;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", nickname="
				+ nickname + ", pass=" + pass + ", email=" + email
				+ ", rightSum=" + Arrays.toString(rightSum) + ", roles="
				+ roles + ", superAdmin=" + superAdmin + "]";
	}

	// 判断是否有权限
	public boolean hasRight(String url) {
		
		//开发时开启
		return true;
		
//		Right r = map.get(url);
//		if (r != null) {
//			int pos = r.getRightPos();
//			long code = r.getRightCode();
//			long ret = rightSum[pos] & code;
//			// 权限总和与当前权限不等于0说明有权限（11101 & 00100=11101 有）
//			// 权限总和与当前权限不等于0说明有权限（11101 & 00010=00000没 有）
//
//			return !(ret == 0);
//		} else {
//			return false;
//		}
	}

}
