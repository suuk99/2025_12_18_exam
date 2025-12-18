package com.example.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.test.dao.ArticleDao;
import com.example.test.dto.Article;

@Service
public class ArticleService {

	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	public void insertArticle(String title, String content, String writer) {
		this.articleDao.insertArticle(title, content, writer);
	}

	public List<Article> getArticleList() {
		return this.articleDao.getArticleList();
	}

	public Article getArticleId(int id) {
		return this.articleDao.getArticleId(id);
	}
}
