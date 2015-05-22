package com.cms.dao;

import java.util.List;

import com.cms.model.Right;


public interface IRightDao {

	public List<Right> findAllRights();
	public List<Right> findTopRight();
	public Right findRightByUrl(Right r);
	public void addRight(Right r);
	public int getMaxRightPos();
	
	
}
