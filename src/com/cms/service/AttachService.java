package com.cms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.IAttachDao;
import com.cms.model.Attach;

@Service
public class AttachService {

	
	@Autowired
	private IAttachDao iAttachDao;
	
	public Attach findAttachBySn(String sn) {
		return iAttachDao.findAttachBySn(sn);
	}

	public void addAttach(Attach attach) {
		iAttachDao.addAttach(attach);
	}

	public void upAttach(Attach attach) {
		iAttachDao.upAttach(attach);
	}

	
}
