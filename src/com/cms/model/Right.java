package com.cms.model;

public class Right {

	private Integer rightId;
	private String rightName = "未命名";
	private String rightUrl;
	private String category; 
	private boolean checked;
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Integer getRightId() {
		return rightId;
	}

	public void setRightId(Integer rightId) {
		this.rightId = rightId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	private int rightPos; // 权限位
	private long rightCode;// 权限码,1<<n

	public Right() {
	}
	
	public Right(Integer id) {
		this.rightId = id;
	}

	public Right(String rightName, String rightUrl) {
		this.rightName = rightName;
		this.rightUrl = rightUrl;
	}
	
	public Right(String rightName, String rightUrl,String category) {
		this.category = category;
		this.rightName = rightName;
		this.rightUrl = rightUrl;
	}

	public Integer getId() {
		return rightId;
	}

	public void setId(Integer id) {
		this.rightId = id;
	}

	public String getRightName() {
		return rightName;
	}

	public void setRightName(String rightName) {
		this.rightName = rightName;
	}

	public String getRightUrl() {
		return rightUrl;
	}

	public void setRightUrl(String rightUrl) {
		this.rightUrl = rightUrl;
	}

	public int getRightPos() {
		return rightPos;
	}

	public void setRightPos(int rightPos) {
		this.rightPos = rightPos;
	}

	public long getRightCode() {
		return rightCode;
	}

	public void setRightCode(long rightCode) {
		this.rightCode = rightCode;
	}
	
	@Override
	public boolean equals(Object obj) {
		return this.getId() == ((Right)obj).getId();
	}

	@Override
	public String toString() {
		return "Right [rightId=" + rightId + ", checked=" + checked + "]";
	}

	
	
	

}
