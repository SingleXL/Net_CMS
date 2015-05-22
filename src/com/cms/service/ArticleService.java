package com.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.IArticleDao;
import com.cms.model.Article;
import com.cms.model.Page;

@Service
public class ArticleService{

	@Autowired
	private IArticleDao iArticleDao;
	
	public Article findArticleById(Integer articleId) {
		return iArticleDao.findArticleById(articleId);
	}

	public void addArticle(Article article) {
		iArticleDao.addArticle(article);
	}
	
	
	public void editArticle(Article article) {
		iArticleDao.editArticle(article);
	}

	public List<Article> listPageArticle(Page<Article> pageArticle) {
		return iArticleDao.listPageArticle(pageArticle);
	}

	public Integer totalNum() {
		return iArticleDao.totalNum();
	}

	public void deleteArticle(Integer articleId) {
		iArticleDao.deleteArticle(articleId);		
	}
	
	
	
}
