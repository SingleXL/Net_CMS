package com.cms.dao;

import java.util.List;

import com.cms.model.Attach;

public interface IAttachDao {
	
	public Attach findAttachBySn(String sn);
	public void addAttach(Attach attach);
	public void upAttach(Attach attach);
	public List<Attach> listAttachsbyAsn(String asn);
	
}
