package com.cms.service;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.cms.dao.IChannelDao;
import com.cms.dto.TreeDto;
import com.cms.model.Channel;

@Service
public class ChannelService {

	@Autowired
	private IChannelDao iChannelDao;

	public List<TreeDto<Channel>> listAllChannels() {

		List<TreeDto<Channel>> channelTrees = new LinkedList<TreeDto<Channel>>();

		List<Channel> channels = iChannelDao.listAllChannels();

		TreeDto<Channel> treeDto = null;
		
		// 排序父类
		Collections.sort(channels);
		

		// 遍历 parent
		for (Channel parent : channels) {
			// 剔除url栏目
			if (StringUtils.hasLength(parent.getUrl())) {
				continue;
			}
			
			if (parent.getPchannelId() == 0 ) {
				treeDto = new TreeDto<Channel>();
				treeDto.setParent(parent);
				channelTrees.add(treeDto);
			}
		}

		// 遍历 child
		for (Channel child : channels) {
			// 剔除url栏目
			if (StringUtils.hasLength(child.getUrl())) {
				continue;
			}
			
			int pchannelId = child.getPchannelId();
			for (TreeDto<Channel> treeDto2 : channelTrees) {
				if (treeDto2.getParent().getChannelId() == pchannelId) {
					treeDto2.getChilds().add(child);
				}
			}
		}


		// 排序子类
		for (TreeDto<Channel> treeDto2 : channelTrees) {
			Collections.sort(treeDto2.getChilds());
		}

		return channelTrees;
	}

	public Channel findChannelBySn(String sn) {
		return iChannelDao.findChannelBySn(sn);
	}
	
	public Channel findChannelById(Integer id) {
		return iChannelDao.findChannelById(id);
	}

	public void addChannel(Channel channel) {
		iChannelDao.addChannel(channel);
	}

	public void editChannel(Channel channel) {
		iChannelDao.editChannel(channel);
	}

	public void deleteChannel(String sn) {
		iChannelDao.deleteChannel(sn);
	}
	public void deleteChildChannel(Integer id) {
		iChannelDao.deleteChildChannel(id);
	}

	
	public void stopChilds(Integer pid) {
		iChannelDao.stopChilds(pid);
	}
	
	
	
	
}
