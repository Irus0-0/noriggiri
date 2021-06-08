<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file= "../include/static-head.jsp" %>
</head>

<body>

	<h1>게시글 등록</h1>

	<form action="/board/write" method="post">
		<p>
			<input type="hidden" name="writer" value="${loginUser.account}">
			# 작성자: <input class="form-control" type="text" value="${loginUser.name}" disabled><br>
			# 제목: <input type="text" name="title"><br>
			# 내용: <br>
			<textarea rows="5" cols="30" name="content"></textarea>
			<br>
			<input type="submit" value="등록">
		</p>
	</form>

	<a href="/board/list">글 목록보기</a>

</body>

</html>