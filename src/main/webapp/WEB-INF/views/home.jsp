<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!-- head(meta, link) include -->
<%@include file="../include/header.jsp" %>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- top navbar include -->
        <%@include file="../include/top-navbar.jsp" %>


        <!-- main sidebar(left menu) include -->
        <%@include file="../include/main-sidebar.jsp" %>


        <!-- main content wrapper -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">시작 페이지</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">메인홈</a></li>
                                <li class="breadcrumb-item active">breadcrumb(현재페이지)</li>
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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">공지나 새알림</h5>

                                    <p class="card-text">
                                        공지나 새알림 공지나 새알림 공지나 새알림 공지나 새알림 공지나 새알림 공지나 새알림 공지나 새알림
                                    </p>

                                    <a href="#" class="card-link">링크</a>
                                    <a href="#" class="card-link">기타 링크</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="m-0">채널 이름</h5>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title">채널 부제목</h6>

                                    <p class="card-text">관련 내용 블라블라 ~~~~~~~~~</p>
                                    <a href="#" class="btn btn-primary">채널 입장</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">채널 이름</h5>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title">채널 부제목</h6>

                                    <p class="card-text">관련 내용 블라블라 ~~~~~~~~~</p>
                                    <a href="#" class="btn btn-primary">채널 입장</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">접었다 펼수있는 박스</h3>
                                    <div class="card-tools">
                                        <!-- Collapse Button -->
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                                class="fas fa-minus"></i></button>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    The body of the card
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->

                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">안보이게 닫을수 있는 박스</h3>
                                    <div class="card-tools">
                                        <!-- Remove Button -->
                                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i
                                                class="fas fa-times"></i></button>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    The body of the card
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">전체화면으로 볼수있는 박스</h3>
                                    <div class="card-tools">
                                        <!-- Maximize Button -->
                                        <button type="button" class="btn btn-tool" data-card-widget="maximize"><i
                                                class="fas fa-expand"></i></button>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    The body of the card
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">기본 박스</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    The body of the card
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col-md-6 -->
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