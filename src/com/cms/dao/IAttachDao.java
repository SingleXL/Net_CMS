package com.cms.dao;

import com.cms.model.Attach;

public interface IAttachDao {
	
	public Attach findAttachBySn(String sn);
	public void addAttach(Attach attach);
	public void upAttach(Attach attach);
	
}
