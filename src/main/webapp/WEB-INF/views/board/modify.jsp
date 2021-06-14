<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>

	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	<style>
		.modify-board {
			width: 80%;
			margin: 0 auto;
			display: block;
		}

		.card-footer {
			float: left;
			margin-right: 5px;
		}
	</style>
</head>

<body>
	<form id="quickForm" action="/board/modify" method="post">
		<input type="hidden" name="boardNo" value="${article.boardNo}">
		<input type="hidden" name="vf" value="false">
		<div class="modify-board">
			<h2>${article.boardNo}번 게시물 수정</h2>
			<div class="card-body">
				<div class="form-group">
					<label for="exampleInputEmail1">작성자</label>
					<input type="text" name="writer" class="form-control" id="exampleInputEmail1"
						value="${article.writer}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">제목</label>
					<input type="text" name="title" class="form-control" id="exampleInputPassword1"
						value="${article.title}">
				</div>
				<textarea id="summernote" name="content">${article.content}</textarea>
				<div class="card-footer">
					<button type="submit" class="btn btn-warning">수정</button>
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

			//목록버튼
			$('#list-btn').on('click', e => {
				location.href='/board/list';
			});
		});
	</script>

</body>

</html>