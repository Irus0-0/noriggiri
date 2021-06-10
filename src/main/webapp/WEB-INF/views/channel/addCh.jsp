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

                                    <form action="/channel/addCh" method="POST">
                                        <input type="hidden" name="channelNo" value="${channel.channelNo}">

                                    <ul class="ch-info">
                                        <li>
                                            <label for="channelNo">#채널번호: </label>
                                            <input type="text" name="channelNo">
                                        </li>
                                        <li>
                                            <label for="channelName">#채널이름: </label>
                                            <input type="text" name="channelName">
                                        </li>
                                        <li>
                                            <label for="adminUserNo">#채널관리자: </label>
                                            <input type="text" name="adminUserNo">
                                        </li>
                                        <li>
                                            <label for="channelInfo">#채널정보: </label>
                                            <input type="text" name="channelInfo">
                                        </li>
                                        <li>
                                            <label for="joinUser">#채널참여자: </label>
                                            <input type="text" name="joinUser">
                                        </li>
                                    </ul>

                                    <div class="list-btn">
                                        <button type="submit" class="btn">완료</button>
                                        <a class="btn" href="/channel/viewCh?channelNo">취소</a>
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