package com.cms.dao;

import java.util.List;

import com.cms.model.Channel;

public interface IChannelDao {

	public List<Channel> listAllChannels();
	public Channel findChannelBySn(String sn);
	public Channel findChannelById(Integer id);
	
	public void addChannel(Channel channel);
	public void editChannel(Channel channel);
	public void deleteChannel(String sn);
	public void deleteChildChannel(Integer id);
	
	
	public void stopChilds(Integer pid);
	
	
}
