<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<section>
		<div class="box">
			<div class="area">
				<div class="area-b">
					<c:if test="${sessionScope.loginUserId == null }">
						<div><a href="/test/user/login">로그인</a></div>
						<div><a href="/test/user/join">회원가입</a></div>
					</c:if>
					
					<c:if test="${sessionScope.loginUserId != null }">
						<div>환영합니다 ${sessionScope.loginUserName }님!</div>
						<div><a href="/test/user/logout">로그아웃</a></div>
						<div><a href="/test/article/write">글쓰기</a></div>
						<div><a href="/test/user/changePw">비밀번호 변경</a></div>
					</c:if>
					
					<div><a href="/test/article/list">게시글 목록</a></div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>