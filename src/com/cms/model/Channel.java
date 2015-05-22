package com.cms.model;

public class Channel implements Comparable<Channel> {

	private int channelId;
	private String name;
	private String sn;
	private String url;
	private int sort;
	private int status;
	private int pchannelId;

	public int getPchannelId() {
		return pchannelId;
	}

	public void setPchannelId(int pchannelId) {
		this.pchannelId = pchannelId;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getSn() {
		return sn;
	}

	public int getChannelId() {
		return channelId;
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public int getSort() {
		return sort;
	}

	@Override
	public int compareTo(Channel o) {
		return this.getSort() - o.getSort();
	}

	@Override
	public String toString() {
		return "Channel [channelId=" + channelId + ", name=" + name + ", sn="
				+ sn + ", url=" + url + ", sort=" + sort + ", status=" + status
				+ ", pchannelId=" + pchannelId + "]";
	}

	
	
}
