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
            <h1>${article.boardNo}번 게시물 내용</h1>

            <p>
               # 채널번호: ${article.channelNo}<br>
               # 글번호: ${article.boardNo}<br>
               # 작성자: ${article.writer}<br>
               # 작성일: ${article.regDate}<br>
               # 제목: ${article.title}<br>
               # 내용: <br>
               <textarea rows="5" cols="30" disabled>${article.content}</textarea>
            </p>

            <a
               href="/board/list?page=${criteria.page}&type=${criteria.type}&keyword=${criteria.keyword}&amount=${criteria.amount}">글
               목록보기</a>&nbsp;

            <a href="/board/modify?boardNo=${article.boardNo}&vf=false">글 수정하기</a>

            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
               글 삭제하기
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
               aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">게시글 삭제</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        정말로 삭제 하시겠습니까?
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" onclick="remove();">삭제하기</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>

</html>