<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../index.html" class="brand-link">
        <img src="../dist/img/logo.png" alt="Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">누리끼리</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="../dist/img/ssong6735.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">${loginUser.nickName}</a>
            </div>

            <div class="info-btn">
<%--                <button type="button" onclick="location.href='/sign/detail'" class="btn btn-outline-secondary btn-xs">--%>
<%--                    내정보--%>
<%--                </button>--%>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#userInfo-modal">
                    내정보
                </button>
                <button type="button" id="signOut-btn" class="btn btn-secondary btn-xs">로그아웃</button>
            </div>
        </div>
       

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="채널 검색" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
                <li class="nav-item menu-open">
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            채널 목록
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-header">내가 생성한 채널</li>
                        <li class="nav-item">
                            <a href="#" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>활성 채널</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>비활성 채널</p>
                            </a>
                        </li>
                        <li class="nav-header">내가 참여한 채널</li>

                        <c:forEach var="channel" items="${list}">
                            <li class="nav-item" data-num="${channel.channelNo}">
                                <a href="/channel/viewCh?channelNo=${channel.channelNo}" class="nav-link">
                                    <!-- <a href="/channel/viewCh" class="nav-link"> -->
                                    <i class="far fa-grin"></i>
                                    <p>${channel.channelName}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
    <%--        내정보 모달--%>
    <div class="modal fade" id="userInfo-modal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">${loginUser.nickName}님의 정보</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        # 유저ID: ${loginUser.userId}<br>
                        # 닉네임: ${loginUser.nickName}<br>
                        # 가입일: <fmt:formatDate pattern="YYYY년 MM월 dd일 HH시" value="${loginUser.regDate}" /><br>
                    </p>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
    <script>
        //로그아웃 버튼 클릭이벤트
        $('#signOut-btn').on('click', e => {
            let checkLogout = confirm("로그아웃 하시겠습니까?");
            if (checkLogout) {
                location.href = '/sign/out'
            }
        });
    </script>
</aside>