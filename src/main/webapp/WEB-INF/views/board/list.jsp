<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<!-- head(meta, link) include -->
<%@include file="../include/static-head(board).jsp" %>

<body class="hold-transition sidebar-mini layout-footer-fixed">
	<div class="wrapper">

		<!-- header (top navbar) include -->
		<%@include file="../include/header.jsp" %>


		<!-- main sidebar(left menu) include -->
		<%@include file="../include/main-sidebar.jsp" %>


		<!-- main content wrapper -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">CH.${channel.channelNo} [${channel.channelName}] - No.${article.boardNo} 게시판
							</h1>
						</div><!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<!-- <li class="breadcrumb-item"><a href="../home.jsp">메인홈</a></li> -->
								<li class="breadcrumb-item"><i class="fas fa-home"></i> <a href="/channel/chMain">채널
										메인</a></li>
								<li class="breadcrumb-item">CH.${channel.channelNo} [${channel.channelName}]</li>
								<li class="breadcrumb-item active">No.${article.boardNo} 게시판</li>
							</ol>
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content board-content">
				<div class="container-fluid">
					<div class="row">


						<c:if test="${articles.size() <= 0}">
							<p>게시물이 존재하지 않습니다.</p>
						</c:if>

						<c:if test="${articles.size() > 0}">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">게시글 목록</h3>
									</div>
									<!-- /.card-header -->
									<div class="card-body table-responsive p-0">
										<table class="table table-hover text-nowrap">
											<thead>
												<tr>
													<th width="10%">번호</th>
													<th width="10%">작성자</th>
													<th width="55%">제목</th>
													<th width="10%">추천수</th>
													<th width="15%">날짜</th>
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
															<c:if test="${article.newBoard}">
																<span class="badge rounded-pill bg-danger">new</span>
															</c:if>
														</td>
														<td>${article.recommend}</td>
														<td>
															<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
																value="${article.regDate}" />
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
									<div class="card-footer d-flex justify-content-between">
										<div class="col-lg-4 col-md-6">
											<!-- 검색창 영역 -->
											<div class="search">
												<form class="d-flex" action="/board/list" id="search-form">

													<input type="hidden" name="amount"
														value="${pageMaker.criteria.amount}">

													<select name="type">
														<option value="title" ${pageMaker.criteria.type=='title'
															? 'selected' : '' }>제목
														</option>
														<option value="content" ${pageMaker.criteria.type=='content'
															? 'selected' : '' }>내용
														</option>
														<option value="writer" ${pageMaker.criteria.type=='writer'
															? 'selected' : '' }>
															작성자
														</option>
														<option value="titleContent"
															${pageMaker.criteria.type=='titleContent' ? 'selected' : ''
															}>
															제목+내용
														</option>
													</select>

													<input type="text" name="keyword" placeholder="검색어를 입력!"
														value="${pageMaker.criteria.keyword}">
													<button type="submit" class="btn btn-warning btn-sm">검색</button>
												</form>
											</div>
										</div>

										<div class="col-lg-8 col-md-6 d-flex justify-content-end">
											<button type="button" class="btn btn-warning btn-sm" id="write-btn">글
												작성하기</button>
										</div>
									</div>
								</div>
								<!-- /.card -->
							</div>

							<div class="col-lg-12 d-flex justify-content-center">
								<!-- 페이지 영역 -->
								<ul class="pagination">

									<c:if test="${pageMaker.prev}">
										<li>
											<button type="button" class="btn btn-block btn-warning btn-sm"
												id="prev-btn">이전</button>
										</li>
									</c:if>

									<!-- li*5>a{[$]} -->
									<c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}"
										step="1">
										<li data-page="${i}"><a class="btn btn-block btn-outline-warning btn-sm"
												id="page-btn" href="/board/list${pageMaker.makeParam(i)}">${i}</a></li>
									</c:forEach>

									<c:if test="${pageMaker.next}">
										<li>
											<button type="button" class="btn btn-block btn-warning btn-sm"
												id="next-btn">다음</button>
										</li>
									</c:if>
								</ul>
							</div>
						</c:if>

					</div>
					<!-- /.row -->
				</div><!-- /.container-fluid -->
			</div><!-- /.content -->
		</div>
		<!-- // .content-wrapper end -->


		<!-- right sidebar include -->
		<%@include file="../include/right-sidebar.jsp" %>


		<!-- footer include -->
		<%@include file="../include/footer.jsp" %>

	</div>
	<!-- // .wrapper end -->


	<!-- script include -->
	<%@include file="../include/script(board).jsp" %>


	<script>
		//board/list
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
	</script>
</body>

</html>