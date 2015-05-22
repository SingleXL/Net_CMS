package com.cms.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cms.dto.TreeDto;
import com.cms.model.Channel;
import com.cms.service.ChannelService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	private ChannelService channelService;
	
	
	@RequestMapping("/index")
	public String index(Model model,HttpSession session){
		
		// 频道
		List<TreeDto<Channel>> channelTrees = channelService.listAllChannels();
		model.addAttribute("channelTrees", channelTrees);
		
		// 轮播图片
		List<String> imgs = new ArrayList<String>();
		String carouselPath =  session.getServletContext().getRealPath("/resources/imgs/carousels");
		Collection<File> carousels = FileUtils.listFiles(new File(carouselPath), null, false);
		Iterator<File> fIterator = carousels.iterator();
		while(fIterator.hasNext()){
			File file = fIterator.next();
			imgs.add(file.getName());
		}
		model.addAttribute("carousels", imgs);
		
		// 文章
		
		
		
		
		return "index";
	}
	
}
