package com.cms.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.auth.AuthClass;
import com.cms.auth.AuthMethod;
import com.cms.dto.TreeDto;
import com.cms.model.Article;
import com.cms.model.Attach;
import com.cms.model.Channel;
import com.cms.model.Page;
import com.cms.model.User;
import com.cms.service.ArticleService;
import com.cms.service.AttachService;
import com.cms.service.ChannelService;

@AuthClass(name="文章管理")
@Controller
@RequestMapping("/admin/article")
public class ArticleController {

	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private ArticleService articleService;
	
	@AuthMethod(rightUrl = "article_add", rightName = "添加文章")
	@RequestMapping("/addArticle")
	public String addArticle(Model model) {
		List<TreeDto<Channel>> channelTrees = channelService.listAllChannels();
		model.addAttribute("channelTrees", channelTrees);
		model.addAttribute("article", new Article());
		return "article/addArticle";
	}
	
	@RequestMapping(value="/addArticle",method=RequestMethod.POST)
	@ResponseBody
	public String addArticle(Article article,HttpServletRequest request) {
		if (!StringUtils.hasLength(article.getContent())) {
			return "";
		}
		
		//文章缩略图
		String thumb = request.getParameter("thumb");
		if (!StringUtils.hasLength(thumb)) {
			String ctx = request.getRequestURL().substring(0,request.getRequestURL().indexOf("admin"));
			article.setThumb(ctx +"resources/imgs/default_thumb.jpg");
		}
		
		//文章概要
		String summary = request.getParameter("content");
		if (StringUtils.hasLength(summary)) {
			int length = article.getContent().length();
			if (length > 120) {
				length = 120;				
			}
			article.setSummary(summary.substring(0, length));
		}
		
		//文章标示
		String asn = new Date().getTime()+"";
		article.setAsn(asn);
		String attachsStr = request.getParameter("attachs");
		
		
		if (StringUtils.hasLength(attachsStr)) {
			if (attachsStr.contains("|")) {
				String[] attachSns = attachsStr.split("\\|");
				for(String attachSn : attachSns){
					Attach attach = attachService.findAttachBySn(attachSn); 
					if (attach!=null) {
						attach.setAsn(asn);
						attachService.upAttach(attach);
					}
				}
			}else {
				Attach attach = attachService.findAttachBySn(attachsStr); 
				if (attach!=null) {
					attach.setAsn(asn);
					attachService.upAttach(attach);
				}
			}
		}
		
		//文章时间
		article.setCreateDate(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		
		articleService.addArticle(article);
		return "article/listAllArticles";
		
	}


	//后台文章列表
	@AuthMethod(rightUrl = "article_list", rightName = "文章列表")
	@RequestMapping("/listAllArticles")
	public String listAllArticles(String pageNoStr, Model model,HttpSession session) {
		int pageNo = 1;
		int pageSize = 13;

		try {
			pageNo = Integer.parseInt(pageNoStr);
		} catch (Exception e) {
			pageNo = 1;
		}

		Page<Article> pageArticle = new Page<Article>(pageNo, pageSize);
		
		pageArticle.setList(articleService.listPageArticle(pageArticle));
		pageArticle.setTotalNum(articleService.totalNum());
		model.addAttribute("pageArticle", pageArticle);
		
		return "article/listAllArticles";
	}
	
	
	//编辑文章页面
	@AuthMethod(rightUrl = "article_edit", rightName = "编辑文章")
	@RequestMapping("/update/{articleId}")
	public String edit(@PathVariable("articleId") Integer articleId, Model model) {
		Article article = articleService.findArticleById(articleId);
		List<TreeDto<Channel>> channelTrees = channelService.listAllChannels();
		model.addAttribute("channelTrees", channelTrees);
		model.addAttribute("article", article);
		return "article/editArticle";
	}

	//编辑文章POST
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public @ResponseBody void edit(Article article,HttpServletRequest request) {
		//文章概要
		String summary = request.getParameter("content");
		if (StringUtils.hasLength(summary)) {
			int length = article.getContent().length();
			if (length > 120) {
				length = 120;				
			}
			article.setSummary(summary.substring(0, length));
		}
		articleService.editArticle(article);
	}
	
	// 删除文章
	@RequestMapping(value="/delete/{articleId}")
	public void delete(@PathVariable("articleId") Integer articleId) {
		articleService.deleteArticle(articleId);
	}
	
	
	//前台文章列表
	@AuthMethod(rightUrl = "article_list", rightName = "文章列表")
	@RequestMapping("/listAllArticles2")
	public String listAllArticles2(String pageNoStr, Model model,HttpSession session) {
		int pageNo = 1;
		int pageSize = 13;

		try {
			pageNo = Integer.parseInt(pageNoStr);
		} catch (Exception e) {
			pageNo = 1;
		}

		Page<Article> pageArticle = new Page<Article>(pageNo, pageSize);
		
		pageArticle.setList(articleService.listPageArticle(pageArticle));
		pageArticle.setTotalNum(articleService.totalNum());
		model.addAttribute("pageArticle", pageArticle);
		
		return "article/listAllArticles";
		
	}
	
	

}
