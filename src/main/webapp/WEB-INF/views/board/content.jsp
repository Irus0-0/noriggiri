<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <title>Document</title>

   <%@ include file="../include/static-head.jsp" %>

</head>

<body>
    <div class="container">
        <div class="row">
           <div class="offset-md-1 col-md-10">
              <h1>${board.boardNo}번 게시물 내용</h1>
  
              <p>
                 # 글번호: ${article.boardNo}<br>
                 # 작성자: ${article.writer}<br>
                 # 제목: ${article.title}<br>
                 # 내용: <br>
                 <textarea rows="5" cols="30" disabled>${article.content}</textarea>
              </p>

              <a href="/board/list?page=${criteria.page}&type=${criteria.type}&keyword=${criteria.keyword}&amount=${criteria.amount}">글
                 목록보기</a>&nbsp;
  
              <!-- <c:if test="${article.writer == loginUser.account || loginUser.auth == 'ADMIN'}"> -->
                 <a href="#">글 수정하기</a>
              <!-- </c:if> -->
           </div>
        </div>
</body>
</html>