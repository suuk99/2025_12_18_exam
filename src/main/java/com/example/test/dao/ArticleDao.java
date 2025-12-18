package com.example.test.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.test.dto.Article;

@Mapper
public interface ArticleDao {

	@Insert("""
			INSERT INTO article
				SET title = #{title},
					content = #{content},
					writer = #{writer},
					regDate = NOW()
			""")
	public void insertArticle(String title, String content, String writer);

	@Select("""
			SELECT id, title, writer, regdate
				FROM article
				ORDER BY id DESC
			""")
	public List<Article> getArticleList();

	@Select("""
			SELECT * 
				FROM article
				WHERE id = #{id}
			""")
	public Article getArticleId(int id);
}