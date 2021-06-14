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
			margin-top: 10px;
			margin: 0 auto;
			width: 80%;
		}

		.pagination {
			width: 21%;
			margin: 0 auto;
			margin-top: 10px;
			list-style: none;
		}

		.pagination>li {
			justify-content: flex-end;
			margin-right: 5px;
		}

		.search {
			width: 30%;
			margin: 0 auto;
		}

		p {
			width: 25%;
			margin-left: 82%;
		}
	</style>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- main sidebar(left menu) include -->
	<%@include file="../include/sub-sidebar.jsp" %>


	<!-- main content wrapper -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">게시판</h1>
					</div><!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">메인홈</a></li>
							<li class="breadcrumb-item active">채널 메인 (현재 페이지)</li>
						</ol>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">


					<c:if test="${articles.size() <= 0}">
						<p>게시물이 존재하지 않습니다.</p>
					</c:if>

					<c:if test="${articles.size() > 0}">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">게시글 목록</h3>
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
									<button type="button" class="btn btn-block btn-danger btn-sm"
										id="prev-btn">이전</button>
								</li>
							</c:if>

							<!-- li*5>a{[$]} -->
							<c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
								<li data-page="${i}"><button type="button" class="btn btn-block btn-warning btn-sm"
										id="page-btn">${i}</button></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li>
									<button type="button" class="btn btn-block btn-danger btn-sm"
										id="next-btn">다음</button>
								</li>
							</c:if>
						</ul>

					</c:if>


					<p>
						<button type="button" class="btn btn-warning" id="write-btn">글 작성하기</button>
					</p>

					<!-- 검색창 영역 -->
					<div class="search">
						<form action="/board/list" id="search-form">

							<input type="hidden" name="amount" value="${pageMaker.criteria.amount}">

							<select name="type">
								<option value="title" ${pageMaker.criteria.type=='title' ? 'selected' : '' }>제목</option>
								<option value="content" ${pageMaker.criteria.type=='content' ? 'selected' : '' }>내용
								</option>
								<option value="writer" ${pageMaker.criteria.type=='writer' ? 'selected' : '' }>작성자
								</option>
								<option value="titleContent" ${pageMaker.criteria.type=='titleContent' ? 'selected' : ''
									}>제목+내용
								</option>
							</select>

							<input type="text" name="keyword" placeholder="검색어를 입력!"
								value="${pageMaker.criteria.keyword}">

							<button type="submit" class="btn btn-danger">검색</button>

						</form>
					</div>




				</div>
				<!-- /.row -->
			</div><!-- /.container-fluid -->
		</div>
		<!-- /.content -->
	</div>
	<!-- // .content-wrapper end -->







	<!-- right sidebar include -->
	<%@include file="../include/right-sidebar.jsp" %>

	<!-- script include -->
	<%@include file="../include/script.jsp" %>


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

		$('#write-btn').on('click', e => {
			location.href = '/board/write';
		});
		$('#prev-btn').on('click', e => {
			location.href = '/board/list${pageMaker.makeParam(pageMaker.beginPage-1)}';
		});
		$('#next-btn').on('click', e => {
			location.href = '/board/list${pageMaker.makeParam(pageMaker.endPage+1)}';
		});
		$('#page-btn').on('click', e => {
			location.href = '/board/list${pageMaker.makeParam(i)}';
		});
	</script>

</body>

</html>