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

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">${article.boardNo}번 게시물 수정</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <form id="quickForm" action="/board/modify" method="post">
                                    <input type="hidden" name="boardNo" value="${article.boardNo}">
                                    <input type="hidden" name="vf" value="false">

                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="boardWriter">작성자</label>
                                            <input type="hidden" name="writer" value="${article.writer}">
                                            <input type="text" class="form-control" id="boardWriter"
                                                value="${article.writer}">
                                        </div>
                                        <div class="form-group">
                                            <label for="boardTitle">제목</label>
                                            <input type="text" name="title" class="form-control" id="boardTitle" value="${article.title}">
                                        </div>
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea class="form-control" rows="10" name="content" id="summernote">${article.content}</textarea>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer d-flex justify-content-center">
                                        <button type="submit" class="btn btn-warning">수정</button>
                                        <button type="button" class="btn btn-warning" id="list-btn">글 목록보기</button>
                                    </div>
                                </form>

                            </div><!-- /.card -->
                        </div><!-- /.col -->

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


    <script> //board/modify
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