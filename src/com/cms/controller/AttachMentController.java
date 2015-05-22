package com.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cms.constant.ImgTypes;
import com.cms.model.Attach;
import com.cms.service.AttachService;

@Controller
@RequestMapping("/admin/attach")
public class AttachMentController {

	@Autowired
	private AttachService attachService;
	
	@RequestMapping("/upload")
	@ResponseBody
	public Attach upload(MultipartFile attach, HttpSession session) throws IOException {
		String upPath = session.getServletContext().getRealPath("/resources/upload/files");
		String thumbsPath = session.getServletContext().getRealPath("/resources/upload/thumbs");
		
		
		String extName = FilenameUtils.getExtension(attach
				.getOriginalFilename());

		Attach attTemp = new Attach();
		String sn = new Date().getTime()+"";
		attTemp.setSn(sn);
		attTemp.setNewName(sn + "." + extName);
		attTemp.setOldName(attach.getOriginalFilename());

		boolean isImg = ImgTypes.imgType.contains(extName);
		
		// 设置缩略图
		if (isImg) {
			attTemp.setType("普通图片");
			attTemp.setImg(true);
			
			// 存储缩略图
			Thumbnails.of(attach.getInputStream()).size(130, 90).keepAspectRatio(false).
			toFile(thumbsPath+"/" + attTemp.getNewName() );
			
			
			// 压缩图片大小并存储
			Thumbnails.of(attach.getInputStream()).size(450, 450).
			toFile(upPath+"/" + attTemp.getNewName() );
			
		} else {
			attTemp.setType("文档类型");
			attTemp.setImg(false);
		}
		
		
		// 存储附件
		if (!isImg) {
			File f = new File(upPath+"/"+attTemp.getNewName());
			FileUtils.copyInputStreamToFile(attach.getInputStream(), f);
		}
		
		
		attachService.addAttach(attTemp);
		
		return attTemp;
		
	}
	
	@RequestMapping("/bangbros")
	@ResponseBody
	public String bangbros(MultipartFile attach, HttpSession session) throws IOException {
		
		String upPath = session.getServletContext().getRealPath("/resources/imgs/carousels");
		

		String extName = FilenameUtils.getExtension(attach
				.getOriginalFilename());
		
		String sn = new Date().getTime()+"";
		
		// 存储缩略图
		Thumbnails.of(attach.getInputStream()).size(704, 220).keepAspectRatio(false).
		toFile(upPath+"/" + sn+"."+extName );
		
		
		return sn+"."+extName;
	}

}
