<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${article.title }</title>
</head>
<body>
	<section>
		<div class="box">
			<div class="area">
				<div class="info-area">
					<div class="info">제목: ${article.title }</div>
					<div class="info">작성일: ${article.regDate }</div>
					<div class="info">작성자: ${article.writer }</div>
					<div class="info">내용: ${article.content }</div>
				</div>
				<div class="btn-area">
					<button onclick="location.href='/test/article/list'">목록으로</button>
					<button onclick="location.href='/test/home/main'">홈으로</button>
				</div>
			</div>
		</div>
	</section>
</body>
</html>