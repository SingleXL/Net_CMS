package com.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cms.model.Attach;


@Controller
@RequestMapping("/admin/bangbros")
public class BangbrosController {
	

	@RequestMapping("/listAllBangbros")
	public String listAllbangbros(Model model,HttpSession session){
		
		List<String> imgs = new ArrayList<String>();
		String carouselPath =  session.getServletContext().getRealPath("/resources/imgs/carousels");
		Collection<File> carousels = FileUtils.listFiles(new File(carouselPath), null, false);
		Iterator<File> fIterator = carousels.iterator();
		while(fIterator.hasNext()){
			File file = fIterator.next();
			imgs.add(file.getName());
		}
		
		if (imgs.size() > 1) {
			imgs.remove("default.jpg");			
		}
		
		model.addAttribute("carousels", imgs);
		
		return "bangbros/listAllBangbros";
	}
	
	
	
	@RequestMapping("/save")
	@ResponseBody
	public String bangbros(HttpServletRequest request, HttpSession session) throws IOException {
		String bangs = request.getParameter("bans");
		List<String> bans = new ArrayList<String>();
		bans.add("default.jpg");
		
		if (StringUtils.hasLength(bangs)) {
			if (bangs.contains("|")) {
				String[] attachSns = bangs.split("\\|");
				for(String attachSn : attachSns){
					bans.add(attachSn);
				} 
			}else {
				if (bangs.equals("default.jpg")) {
					
				}else {
					bans.add(bangs);
				}
			}
			
		}
		
		String upPath = session.getServletContext().getRealPath("/resources/imgs/carousels");
		File file = new File(upPath);
		File[] files = file.listFiles();
		for(File file2 : files){
			if (!bans.contains(file2.getName())) {
				file2.delete();
			}
		}
		
		return "";
		
		
	}

	
}
