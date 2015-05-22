package com.cms.controller;

import java.util.List;
import java.util.ListResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.TreeDto;
import com.cms.model.Channel;
import com.cms.model.Page;
import com.cms.model.User;
import com.cms.service.ChannelService;
import com.cms.service.UserService;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Controller
@RequestMapping("/admin/spider")
public class SpiderController {
	
	@Autowired
	private ChannelService channelService;

	@RequestMapping("/addParser")
	public String addParser(Model model){
		List<TreeDto<Channel>> channelTrees = channelService.listAllChannels();
		model.addAttribute("channelTrees", channelTrees);
	
		
		return "spider/addSpider";
	}
	

}
