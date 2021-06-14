<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!-- head(meta, link) include -->
<%@include file="../include/static-head.jsp" %>

<body class="hold-transition sidebar-mini">
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
                            <h1 class="m-0">CHANNEL MAIN</h1>
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
                        <!-- lg 12 -->
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">채널 선택 후 첫 화면</h5>

                                    <p class="card-text">
                                        현재 채널에 추가되어있는 기능들 목록<br>
                                        기능 추가하기 UI<br>
                                    </p>

                                    <!-- <button type="button" class="btn btn-outline-secondary btn-xs" data-toggle="modal"
                                    data-target="#createCh-modal">채널 생성</button> -->
                                    <a href="/channel/addCh" class="btn btn-outline-secondary btn-xs">채널 생성</a>
                                </div>
                            </div>
                        </div>

                        <!-- lg 4 -->
                        <div class="col-lg-4">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">기능이름</h5>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title">ex)게시판 (게시판이름)</h6>

                                    <p class="card-text">기능관련 설명</p>
                                    <a href="#" class="btn btn-primary">기능 들어가기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">기능이름</h5>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title">ex)게시판 (게시판이름)</h6>

                                    <p class="card-text">기능관련 설명</p>
                                    <a href="#" class="btn btn-primary">기능 들어가기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">기능이름</h5>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title">ex)게시판 (게시판이름)</h6>

                                    <p class="card-text">기능관련 설명</p>
                                    <a href="#" class="btn btn-primary">기능 들어가기</a>
                                </div>
                            </div>
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


        <!-- footer include -->
        <%@include file="../include/footer.jsp" %>

    </div>
    <!-- // .wrapper end -->


    <!-- script include -->
    <%@include file="../include/script.jsp" %>
</body>

</html>