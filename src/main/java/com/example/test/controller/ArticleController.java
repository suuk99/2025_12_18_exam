package com.example.test.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test.dto.Article;
import com.example.test.service.ArticleService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ArticleController {
	
	private ArticleService articleService;
	
	public ArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@GetMapping("/test/article/write")
	public String writeArticle() {
		return "test/article/write";
	}
	
	@PostMapping("/test/article/doWrite")
	@ResponseBody
	public String doWrite(HttpSession session, String title, String content) {
		
		String writer = (String) session.getAttribute("loginUserName");
		
		this.articleService.insertArticle(title, content, writer);
		return "<script>alert('게시글이 등록되었습니다.'); location.href='/test/article/list';</script>";
	}
	
	@GetMapping("/test/article/list")
	public String showList(Model model) {
		
		List<Article> articles = this.articleService.getArticleList();
		
		model.addAttribute("articles", articles);
		return "test/article/list";
	}
	
	@GetMapping("/test/article/detail")
	public String showDetail(Model model, int id) {
		
		Article article = this.articleService.getArticleId(id);
		
		model.addAttribute("article", article);
		return "test/article/detail";
	}
}
