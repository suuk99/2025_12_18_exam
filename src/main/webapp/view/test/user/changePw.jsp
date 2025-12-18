<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<body>
	<script>
		const pwForm = function(form) {
			form.newPw.value = form.newPw.value.trim();
			form.pwChk.value = form.pwChk.value.trim();
			
			if(form.newPw.value.length == 0) {
				alert('새로운 비밀번호를 입력하세요.');
				form.newPw.focus();
				return false;
			}
			
			if(form.pwChk.value.length == 0) {
				alert('비밀번호 확인을 입력하세요.');
				form.pwChk.focus();
				return false;
			}
			
			if(form.newPw.value != form.pwChk.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.pwChk.focus();
				return false;
			}
			return true;
			
		}
	</script>
	
	<section>
		<div class="box">
			<form action="/test/user/doChange" method="post" onsubmit="return pwForm(this);">
				<div class="area">
					<div class="info-area">
						<div>${sessionScope.loginUserId }님</div>
						<div><input type="password" name="newPw" placeholder="새 비밀번호"/></div>
						<div><input type="password" name="pwChk" placeholder="비밀번호 확인"/></div>
					</div>
					
					<div class="btn-area">
						<button type="button" onclick="location.href='/test/home/main'">홈으로</button>
						<button type="submit">비밀번호 변경</button>
					</div>										
				</div>
			</form>
		</div>
	</section>
</body>
</html>