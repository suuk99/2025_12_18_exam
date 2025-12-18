<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<script>
		const joinForm = function(form) {
			form.loginId.value = form.loginId.value.trim();
			form.pw.value = form.pw.value.trim();
			form.pwChk.value = form.pwChk.value.trim();
			form.name.value = form.name.value.trim();
			
			if(form.loginId.value.length == 0) {
				alert('아이디를 입력하세요');
				form.loginId.focus();
				return false
			}
			
			if(form.pw.value.length == 0) {
				alert('비밀번호를 입력하세요');
				form.pw.focus();
				return false
			}
			
			if(form.pwChk.value.length == 0) {
				alert('비밀번호 확인을 입력하세요');
				form.pwChk.focus();
				return false
			}
			
			if(form.pw.value != form.pwChk.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.pwChk.focus();
				return false;
			}
			
			if(form.name.value.length == 0) {
				alert('이름을 입력하세요');
				form.name.focus();
				return false
			}
			
			return true;
		}
	</script>
	
	<section>
		<div class="box">
			<form action="/test/user/doJoin" method="post" onsubmit="return joinForm(this);">
				<div class="area">
					<div class="info-area">
						<div class="info"><input type="text" name="loginId" placeholder="아이디" /></div>
						<div class="info"><input type="password" name="pw" placeholder="비밀번호" /></div>
						<div class="info"><input type="password" name="pwChk" placeholder="비밀번호 확인" /></div>
						<div class="info"><input type="text" name="name" placeholder="이름" /></div>
					</div>
					<div class="btn-area">
						<button type="button" onclick="location.href='/test/home/main'">홈으로</button>
						<button type="submit">가입하기</button>
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>