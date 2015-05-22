package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.auth.AuthClass;
import com.cms.auth.AuthMethod;
import com.cms.dto.TreeDto;
import com.cms.model.Channel;
import com.cms.service.ChannelService;
import com.google.gson.Gson;

@AuthClass(name="栏目管理")
@Controller
@RequestMapping("/admin/channel")
public class ChannelController {

	@Autowired
	private ChannelService channelService;

	@AuthMethod(rightUrl = "channel_listAllChannels", rightName = "栏目列表")
	@RequestMapping("/listAllChannels")
	public String listAllChannels(Model model) {
		List<TreeDto<Channel>> channelTrees = channelService.listAllChannels();
		model.addAttribute("channelTrees", channelTrees);
		return "channel/listAllChannels";
	}

	@AuthMethod(rightUrl = "channel_edit", rightName = "编辑栏目")
	@RequestMapping("/edit/{channelSn}")
	public String edit(@PathVariable("channelSn") String channelSn, Model model) {
		Channel channel = channelService.findChannelBySn(channelSn);
		model.addAttribute("channel", channel);
		return "channel/editChannel";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public @ResponseBody void edit(Channel channel) {
		int status = channel.getStatus();
		int pid = channel.getPchannelId();
		
		if (status == 0 && pid ==0) {
			channelService.stopChilds(channel.getChannelId());
		}
		
		if (pid !=0) {
			Channel pChannel = channelService.findChannelById(pid);
			if (pChannel.getStatus() == 0) {
				channel.setStatus(0);
			}
		}
		
		channelService.editChannel(channel);
	}

	@AuthMethod(rightUrl = "channel_addChild", rightName = "添加子栏目")
	@RequestMapping(value = "/addChild/{channelSn}", method = RequestMethod.GET)
	public String addChild(@PathVariable("channelSn") String channelSn,	Model model) {

		Channel parent = channelService.findChannelBySn(channelSn);
		Channel child = new Channel();
		child.setPchannelId(parent.getChannelId());
		child.setStatus(1);
		
		model.addAttribute("pName", parent.getName());
		model.addAttribute("channel", child);
		return "channel/addChildChannel";
	}
	
	@RequestMapping(value = "/addChild", method = RequestMethod.POST)
	@ResponseBody
	public void addChild(Channel channel) {
		channelService.addChannel(channel);
	}
	
	@AuthMethod(rightUrl = "channel_addParentChannel", rightName = "添加父栏目")
	@RequestMapping(value="/addParentChannel",method=RequestMethod.GET)
	public String addParentChannel(Model model) {
		Channel channel = new Channel();
		model.addAttribute("channel", channel);
		return "channel/addParentChannel";
	}
	
	@RequestMapping(value="/addParentChannel" ,method=RequestMethod.POST)
	public @ResponseBody void addParentChannel(Channel channel) {
		channelService.addChannel(channel);
	}

	
	@RequestMapping("/delete/{channelSn}")
	public @ResponseBody void delete(@PathVariable("channelSn") String channelSn) {
		
		Channel channel = channelService.findChannelBySn(channelSn);
		
		if (channel.getPchannelId() == 0) {
			channelService.deleteChildChannel(channel.getChannelId());
		}
		channelService.deleteChannel(channelSn);
		
	}
}
