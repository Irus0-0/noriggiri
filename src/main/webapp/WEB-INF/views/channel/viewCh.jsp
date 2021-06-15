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
                            <h1 class="m-0">CH.${channel.channelNo} [${channel.channelName}]</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <!-- <li class="breadcrumb-item"><a href="../home.jsp">메인홈</a></li> -->
                                <li class="breadcrumb-item"><i class="fas fa-home"></i> <a href="/channel/chMain">채널 메인</a></li>
                                <li class="breadcrumb-item active">CH.${channel.channelNo} [${channel.channelName}]</li>
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
                                    <h5 class="card-title">CH.${channel.channelNo} [${channel.channelName}] 채널 정보</h5>

                                    <ul class="ch-info">
                                        <li><span>#채널번호: </span>${channel.channelNo}</li>
                                        <li><span>#채널이름: </span>${channel.channelName}</li>
                                        <li><span>#채널관리자: </span>${userInfo.nickName}</li>
                                        <li><span>#채널정보: </span>${channel.channelInfo}</li>
                                        <li><span>#채널참여자: </span>

                                            <!-- <c:forEach var="joinUser" items="${joinUserList}">
                                                <span class="joinNick">${joinUser.nickName}</span>
                                            </c:forEach> -->

                                        </li>
                                    </ul>

                                    <c:if test="${channel.adminUserNo == loginUser.userNo}">
                                        <a class="btn btn-outline-warning btn-xs"
                                            href="/channel/modCh?channelNo=${channel.channelNo}">채널 수정</a>
                                        <a class="btn btn-outline-warning btn-xs"
                                            href="/channel/delete?channelNo=${channel.channelNo}">채널 삭제</a>
                                    </c:if>

                                    <a class="btn btn-outline-warning btn-xs"
                                        href="/channelJoinUser/exitCh/${channel.channelNo}">채널 나가기</a>

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
                                    <a href="/board/list" class="btn btn-primary">기능 들어가기</a>
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