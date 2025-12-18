<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/common/Common.css" />
<title>로그인</title>
</head>
<body>
	<script>
		const loginForm = function(form) {
			form.loginId.value = form.loginId.value.trim();
			form.pw.value = form.pw.value.trim();
			
			if(form.loginId.value.length == 0) {
				alert('아이디를 입력하세요');
				form.loginId.focus();
				return false;
			}
			
			if(form.pw.value.length == 0) {
				alert('비밀번호를 입력하세요');
				form.pw.focus();
				return false;
			}
			return true;
		}
	</script>
	
	<section>
		<div class="box">
			<form action="/test/user/doLogin" method="post">
				<div class="area">
					<div class="info-area">
						<div class="info"><input type="text" name="loginId" placeholder="아이디"/></div>
						<div class="info"><input type="password" name="pw" placeholder="비밀번호"/></div>
					</div>
					<div class="btn-area">
						<button type="button" onclick="location.href='/test/home/main'">홈으로</button>
						<button type="submit">로그인</button>
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>