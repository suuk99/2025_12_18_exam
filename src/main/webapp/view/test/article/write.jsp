<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<script>
		const writeForm = function(form) {
			form.title.value = form.title.value.trim();
			form.content.value = form.content.value.trim();
			
			if(form.title.value.length == 0) {
				alert('제목을 입력하세요');
				form.title.focus();
				return false;
			}
			
			if(form.content.value.length == 0) {
				alert('내용을 입력하세요');
				form.content.focus();
				return false;
			}
			return true;
		}	
	</script>
	
	<section>
		<div class="box">
			<form action="/test/article/doWrite" method="post" onsubmit="return writeForm(this);">
				<div class="area">
					<div class="info-area">
						<div class="info"><input type="text" name="title" placeholder="제목을 입력해주세요."/></div>
						<div class="info"><textarea name="content" placeholder="내용을 입력해주세요."></textarea></div>
					</div>
						
					<div class="btn-area">
						<button type="button" onclick="location.href='/test/home/main'">홈으로</button>
						<button type="submit">등록</button>
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>