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
        <%@include file="../include/sub-sidebar.jsp" %>


        <!-- main content wrapper -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">${channel.channelName}</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="../home.jsp">메인홈</a></li>
                                <li class="breadcrumb-item"><a href="/channel/chMain">채널메인</a></li>
                                <li class="breadcrumb-item active">${channel.channelName}</li>
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
                                    <h5 class="card-title">${channel.channelName} INFO</h5>

                                    <ul class="ch-info">
                                        <li><span>#채널번호: </span>${channel.channelNo}</li>
                                        <li><span>#채널이름: </span>${channel.channelName}</li>
                                        <li><span>#채널관리자: </span>${channel.adminUserNo} (현재 유저번호. 추후 유저닉네임으로 변경하기)</li>
                                        <li><span>#채널정보: </span>${channel.channelInfo}</li>
                                        <li><span>#채널참여자: </span>(아직 기능 구현전)</li>
                                    </ul>

                                    <a class="btn btn-outline-secondary btn-xs" href="/channel/modCh?channelNo=${channel.channelNo}">채널 수정</a>
                                    <a class="btn btn-outline-secondary btn-xs" href="/channel/delete?channelNo=${channel.channelNo}">채널 삭제</a>

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