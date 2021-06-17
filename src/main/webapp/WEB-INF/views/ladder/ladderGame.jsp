<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!-- head(meta, link) include -->
<%@include file="../include/static-head(ladder).jsp" %>

<body class="hold-transition sidebar-mini layout-footer-fixed">
    <div class="wrapper">

        <!-- header (top navbar) include -->
        <%@include file="../include/header.jsp" %>


        <!-- main sidebar(left menu) include -->
        <%@include file="../include/main-sidebar.jsp" %>


        <!-- 컨텐츠 화면 -->
        <div class="content-wrapper">
            <!-- 상단 페이지 타이틀 -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">미니게임</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <!-- <li class="breadcrumb-item"><a href="#">메인홈</a></li> -->
                                <li class="breadcrumb-item"><i class="fas fa-home"></i> <a href="/channel/chMain">채널
                                        메인</a></li>
                                <li class="breadcrumb-item">CH.${channel.channelNo} [${channel.channelName}]</li>
                                <li class="breadcrumb-item active">사다리타기</li>
                            </ol>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- 메인 화면 -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <!-- lg 12 -->
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">미니게임 - 사다리타기</h5>

                                    <p class="card-text">
                                        미니게임 - 사다리타기 입니다.<br>
                                        참여자 수를 적고 해당 인원이 이름과 벌칙을 적은 다음에<br>
                                        이름 아래 동그라미를 하나씩 눌러서 게임을 진행할 수 있습니다.<br>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">사다리 게임</h5>
                                </div>
                                <div class="card-body">                                    
                                    <!-- <%@include file="./ladder_src/ladder.jsp" %> -->
                                    <!-- <c:import url="ladder.jsp">
                                        
                                    </c:import> -->
                                </div>
                            </div>
                        </div>



                    </div>
                    <!-- /.row -->

                </div><!-- /.container-fluid -->
            </div>
            <!-- 메인 화면 end -->
        </div>
        <!-- // .content-wrapper end -->


        <!-- right sidebar include -->
        <%@include file="../include/right-sidebar.jsp" %>


        <!-- footer include -->
        <%@include file="../include/footer.jsp" %>

    </div>
    <!-- // .wrapper end -->


    <script src="/ladder_src/ladder.js"></script>

    <!-- script include -->
    <%@include file="../include/script.jsp" %>
</body>

</html>