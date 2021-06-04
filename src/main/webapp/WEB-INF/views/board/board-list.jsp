<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>

<body>
	<h1>NURIGGIRI 게시판</h1>
	<h2>게시글 목록</h2>

	<div class="amount">
		<a href="/board/board-list${pageMaker.makeParam(pageMaker.criteria.page, 10)}">10</a>
		<a href="/board/board-list${pageMaker.makeParam(pageMaker.criteria.page, 20)}">20</a>
		<a href="/board/board-list${pageMaker.makeParam(pageMaker.criteria.page, 30)}">30</a>
	</div>

	<table border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>조회수</td>
			<td>비고</td>
		</tr>


		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.boardNo}</td>s
				<td>${board.writer}</td>
				<td>
					<a href="/board/board-content?boardNo=${board.boardNo}">${board.title}</a>
				</td>
				<!-- <td>${article.viewCnt}</td> -->
				<td>
					<!-- <c:if test="${article.writer == loginUser.account || loginUser.auth == 'ADMIN'}"> -->
					<a href="#">[삭제]</a>
					<!-- </c:if> -->
				</td>
			</tr>
		</c:forEach>

		<!-- 페이지 영역 -->
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li>
					<a href="/board/board-list${pageMaker.makeParam(pageMaker.beginPage-1)}">[prev]</a>
				</li>
			</c:if>

			<!-- li*5>a{[$]} -->
			<c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
				<li data-page="${i}"><a href="/board/board-list${pageMaker.makeParam(i)}">[${i}]</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li>
					<a href="/board/board-list${pageMaker.makeParam(pageMaker.endPage+1)}">[next]</a>
				</li>
			</c:if>
		</ul>

	</table>
</body>

</html>