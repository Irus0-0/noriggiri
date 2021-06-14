<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file= "../include/static-head.jsp" %>

	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	<style>
		.modify-board {
			display: block;
			width: 80%;
			margin: 0 auto;
		}
	</style>

</head>

<body>
	<form id="quickForm" action="/board/write" method="post">
		<div class="modify-board">
			<h2>게시물 등록</h2>
			<div class="card-body clearfix">
				<div class="form-group">
					<label for="exampleInputEmail1">작성자</label>
					<input type="hidden" name="writer" value="${loginUser.nickName}">
					<input type="text" class="form-control" id="exampleInputEmail1" value="${loginUser.nickName}"
						disabled>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">제목</label>
					<input type="text" name="title" class="form-control" id="exampleInputPassword1">
				</div>
				<textarea id="summernote" rows="5" cols="30" name="content"></textarea>
				<div class="card-footer">
					<button type="submit" class="btn btn-warning">게시글 작성</button>
					<button type="button" class="btn btn-warning" id="list-btn">글 목록보기</button>
				</div>
			</div>
		</div>
	</form>

	<script>
		$(function () {
			$('#summernote').summernote({
				height: 300,
				minHeight: null, // set minimum height of editor
				maxHeight: null, // set maximum height of editor
				focus: true // set focus to editable area after initializing summe
			});

			$('#list-btn').on('click', e => {
				location.href='/board/list';
			});
		});
	</script>

</body>

</html>