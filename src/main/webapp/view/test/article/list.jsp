<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<section>
		<div class="box">
			<div class="area"">
				<div class="name" style="display: flex; justify-content: space-around;">
					<div class="c-name">번호</div>
					<div class="c-name">제목</div>
					<div class="c-name">작성자</div>
					<div class="c-name">작성일</div>
				</div>
				<c:forEach items="${articles }" var="a">
					<div class="info-area" style="display: flex; justify-content: space-around;">
						<div class="info">${a.id }</div>
						<div class="info"><a href="/test/article/detail?id=${a.id }">${a.title }</a></div>
						<div class="info">${a.writer }</div>
						<div class="info">${a.regDate }</div>
					</div>
				</c:forEach>
				<div class="btn-area" style="text-align: center;">
					<button onclick="location.href='/test/home/main'">홈으로</button>
				</div>
			</div>
		</div>
	</section>
</body>
</html>