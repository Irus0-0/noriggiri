<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!-- head(meta, link) include -->
<%@include file="../include/static-head.jsp" %>

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
                            <h1 class="m-0">CH.${channel.channelNo} [${channel.channelName}] 채널 수정</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <!-- <li class="breadcrumb-item"><a href="../home.jsp">메인홈</a></li> -->
                                <li class="breadcrumb-item"><a href="/channel/chMain">채널메인</a></li>
                                <li class="breadcrumb-item active">CH.${channel.channelNo} [${channel.channelName}] 채널 수정</li>
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
                                    <h4 class="card-title">CH.${channel.channelNo} [${channel.channelName}] 채널 정보</h4>

                                    <form action="/channel/modCh" method="POST">
                                        <input type="hidden" name="channelNo" value="${channel.channelNo}">

                                    <ul class="ch-info">
                                        <li>
                                            <label for="channelNo">#채널번호: </label>
                                            <input type="text" name="channelNo" value="${channel.channelNo}" disabled>
                                        </li>
                                        <li>
                                            <label for="channelName">#채널이름: </label>
                                            <input type="text" name="channelName" value="${channel.channelName}">
                                        </li>
                                        <li>
                                            <label for="adminUserNo">#채널관리자: </label>
                                            <input type="text" name="adminUserNo" value="${userInfo.nickName}" disabled>
                                        </li>
                                        <li>
                                            <label for="channelInfo">#채널정보: </label>
                                            <input type="text" name="channelInfo" value="${channel.channelInfo}">
                                        </li>
                                        <li>
                                            <label for="channelPw">#채널패스워드: </label>
                                            <input type="password" name="channelPw" value="${channel.channelPw}">
                                        </li>
                                        <!-- <li>
                                            <label for="joinUser">#채널참여자: </label>
                                            <input type="text" name="joinUser" value="(아직 기능 구현전)" disabled>
                                        </li> -->
                                    </ul>

                                    <div class="list-btn justify-content-end">
                                        <button type="submit" class="btn btn-warning">완료</button>
                                        <a class="btn btn-warning" href="/channel/viewCh/${channel.channelNo}">취소</a>
                                    </div>
                                </form>

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