package com.cms.model;

public class Attach {
	private String asn;
	public String getAsn() {
		return asn;
	}

	public void setAsn(String asn) {
		this.asn = asn;
	}

	private String newName;
	private String oldName;
	private String sn;
	private String type;
	private boolean isImg;

	public boolean isImg() {
		return isImg;
	}

	public void setImg(boolean isImg) {
		this.isImg = isImg;
	}


	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getSn() {
		return sn;
	}

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public String getOldName() {
		return oldName;
	}

	public void setOldName(String oldName) {
		this.oldName = oldName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Attachment [attachId=" + asn + ", newName=" + newName
				+ ", oldName=" + oldName + ", type=" + type + ", isImg="
			;
	}

}
