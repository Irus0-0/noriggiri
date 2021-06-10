<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/css/main.css">

	<%@ include file= "../include/static-head.jsp" %>

	<style>
		.col-12 {
			width: 80%;
			margin: 0 auto;
		}
	</style>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<c:if test="${articles.size() <= 0}">
		<p>게시물이 존재하지 않습니다.</p>
	</c:if>

	<c:if test="${articles.size() > 0}">

		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">게시글 목록</h3>

					<div class="card-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="table_search" class="form-control float-right"
								placeholder="Search">

							<div class="input-group-append">
								<button type="submit" class="btn btn-default">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<td>번호</td>
								<td>작성자</td>
								<td>제목</td>
								<td>추천수</td>
								<td>날짜</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articles}">
								<tr>
									<td>${article.boardNo}</td>
									<td>${article.writer}</td>
									<td>
										<a
											href="/board/content${pageMaker.makeParam(pageMaker.criteria.page)}&boardNo=${article.boardNo}&vf=true">${article.title}</a>
									</td>
									<td>${article.recommend}</td>
									<td>${article.regDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>



		<!-- 페이지 영역 -->
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li>
					<a href="/board/list${pageMaker.makeParam(pageMaker.beginPage-1)}">[prev]</a>
				</li>
			</c:if>

			<!-- li*5>a{[$]} -->
			<c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
				<li data-page="${i}"><a href="/board/list${pageMaker.makeParam(i)}">[${i}]</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li>
					<a href="/board/list${pageMaker.makeParam(pageMaker.endPage+1)}">[next]</a>
				</li>
			</c:if>
		</ul>

	</c:if>

	<p>
		<a href="/board/write">게시글 작성하기</a>
	</p>

	<!-- 검색창 영역 -->
	<div class="search">
		<form action="/board/list" id="search-form">

			<input type="hidden" name="amount" value="${pageMaker.criteria.amount}">

			<select name="type">
				<option value="title" ${pageMaker.criteria.type=='title' ? 'selected' : '' }>제목</option>
				<option value="content" ${pageMaker.criteria.type=='content' ? 'selected' : '' }>내용</option>
				<option value="writer" ${pageMaker.criteria.type=='writer' ? 'selected' : '' }>작성자</option>
				<option value="titleContent" ${pageMaker.criteria.type=='titleContent' ? 'selected' : '' }>제목+내용
				</option>
			</select>

			<input type="text" name="keyword" placeholder="검색어를 입력!" value="${pageMaker.criteria.keyword}">

			<button type="submit" class="btn btn-outline-success">검색</button>

		</form>
	</div>

	<%@ include file= "../include/footer.jsp" %>

	<script>
		//현재 위치한 페이지넘버에 클래스 active를 부여하는 함수 정의
		function appendPageActive(curPageNum) {
			const $ul = document.querySelector('.pagination');
			for (let $li of [...$ul.children]) {
				if ($li.dataset.page === curPageNum) {
					$li.classList.add('active');
				}
			}
		}

		(function () {
			appendPageActive('${pageMaker.criteria.page}');
		}());
	</script>

</body>

</html>