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


        <!-- 컨텐츠 화면 -->
        <div class="content-wrapper">
            <!-- 상단 페이지 타이틀 -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">CHANNEL MAIN</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <!-- <li class="breadcrumb-item"><a href="#">메인홈</a></li> -->
                                <li class="breadcrumb-item active"><i class="fas fa-home"></i> 채널 메인</li>
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
                                    <h5 class="card-title">로그인 후 첫 화면</h5>

                                    <p class="card-text">
                                        전체 채널 리스트 보기 화면<br>
                                        만들어진 모든 채널들 보이게 하기<br>
                                    </p>

                                    <a href="/channel/addCh" class="btn btn-outline-warning btn-xs">채널 생성</a>
                                </div>
                            </div>
                        </div>

                        <!-- 채널 카드 -->
                        <%-- 생성된 채널 개수가 0개일 경우 목록대신 "채널이 존재하지 않습니다." 출력 --%>
                        <c:if test="${list.size() <= 0}">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <span class="no-channel">채널이 존재하지 않습니다.</span>
                                    </div>
                                </div>
                            </div>
                        </c:if>


                        <c:if test="${list.size() > 0}">
                            <%-- 컨트롤러가 가져온 채널 데이터를 반복하여 출력. --%>
                            <c:forEach var="channel" items="${list}">
                                <div class="col-lg-4">
                                    <div class="card card-primary card-outline">
                                        <div class="card-header">
                                            <h5 class="m-0">CH.${channel.channelNo} [${channel.channelName}]</h5>
                                        </div>
                                        <div class="card-body">
                                            <h6 class="card-title"><span>#채널관리자: </span>${channel.adminUserNo}의 닉네임찾아넣기
                                            </h6>

                                            <p class="card-text">${channel.channelInfo}</p>
                                            <!-- <a href="/channel/viewCh?channelNo=${channel.channelNo}"
                                                class="btn btn-warning">채널참여</a> -->
                                                <a class="btn btn-warning" href="/channelJoinUser/joinCh/${channel.channelNo}">채널참여</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </div>
                    <!-- /.row -->

                    <!-- 페이지 영역 -- >
                    <div class="row">                        
                        <ul class="pagination pagination-sm m-0 float-right">
                            <c:if test="${pageMaker.prev}">
                                <li class="page-item"><a class="page-link"
                                        href="/board/list${pageMaker.makeParam(pageMaker.beginPage-1)}">«</a></li>
                            </c:if>
                            <c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
                                <li class="page-item" data-page="${i}"><a
                                        href="/board/list${pageMaker.makeParam(i)}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${pageMaker.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/board/list${pageMaker.makeParam(pageMaker.endPage+1)}">»</a></li>
                            </c:if>
                        </ul>
                    </div>-->

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


    <!-- script include -->
    <%@include file="../include/script.jsp" %>
</body>

</html>