package com.cms.dao;

import java.util.List;

import com.cms.model.Article;
import com.cms.model.Page;

public interface IArticleDao {
	
	// 模糊查询
//	public List<Article> findByChannelAndTitle(String channelSn,String title);
	
	
	public Article findArticleById(Integer articleId);
	public void addArticle(Article article);
	public List<Article> listPageArticle(Page<Article> pageArticle);
	public List<Article> listPageArticle1(Page<Article> pageArticle);
	public Integer totalNum();
	public void editArticle(Article article);
	public void deleteArticle(Integer articleId);
	public List<Article> randomArticles();	
	public List<Article> lastArticles();
	
}
