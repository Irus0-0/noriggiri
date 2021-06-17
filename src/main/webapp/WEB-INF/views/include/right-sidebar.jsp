<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3 control-sidebar-content">
        <div class="os-viewport os-viewport-native-scrollbars-invisible">
            <div class="os-content mt-3 mb-3">

                <h5>친구 리스트</h5>
                <hr class="mb-2">

                <div class="form-inline friendSearch">
                    <div class="input-group">
                        <label for="search-input">친구 검색!</label>
                        <input id="userNickName" type="hidden" value="${loginUser.nickName}">                        
                        <input id="search-input" type="text" name="nickName" class="form-control form-control-sidebar" placeholder="닉네임 검색">
                        <div class="input-group-append">
                            <button id="search-btn" class="btn btn-sidebar btn-warning bi bi-search">
                                <i class="fas fa-search fa-fw"></i>
                            </button>
                        </div>
                    </div>
                    <!-- 검색결과 -->
                    <div id="search-result"></div>
                    <button id="re-button" type="button" class="btn btn-outline-warning form-control">새로고침</button>
                </div>


                <hr class="mb-2">


                <nav class="friend-nav mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <li class="nav-item menu-open">
                            <a href="#" class="nav-link active">
                                <p>받은 친구요청<i class="right fas fa-angle-left"></i></p>
                            </a>
                            <ul id="target-ul" class="nav nav-treeview">
                                <c:forEach var="TARGET" items="${friendListMap.get('TARGET')}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">${TARGET.nickName}</a>
                                        <button id="accept-btn" class="btn btn-warning btn-xs mr-1" type="button" value="${TARGET.userNo}">수락</button>
                                        <button id="refuse-btn" class="btn btn-warning btn-xs" type="button" value="${TARGET.userNo}">거절</button>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
        
                        <li class="nav-item menu-open">
                            <a href="#" class="nav-link active">
                                <p>친구요청 리스트<i class="right fas fa-angle-left"></i></p>
                            </a>
                            <ul id="requset-ul" class="nav nav-treeview">
                                <c:forEach var="REQUEST" items="${friendListMap.get('REQUEST')}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">${REQUEST.nickName}</a>
                                        <button id="requestCancel-btn" class="btn btn-warning btn-xs" type="button" value="${REQUEST.userNo}">요청 취소</button>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>

                        <li class="nav-item menu-open">
                            <a href="#" class="nav-link active">
                                <p>친구차단 리스트<i class="right fas fa-angle-left"></i></p>
                            </a>
                            <ul id="block-ul" class="nav nav-treeview">

                                <c:forEach var="BLOCK" items="${friendListMap.get('BLOCK')}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">${BLOCK.nickName}</a>
                                        <button id="removeBlockFriend-btn" class="btn btn-warning btn-xs" type="button" value="${BLOCK.userNo}">차단 해제</button>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>                        
                    </ul>
                </nav>


                <hr class="mb-2">


                <!-- 나랑 친구 리스트 -->
                <div id="friendList-div">
                    <ul id="friend-ul">
                        <li class="list-header">나랑 친구 리스트</li>                    
                        <!-- ${friendListMap.get("DUDE")} -->
                        <c:forEach var="DUDE" items="${friendListMap.get('DUDE')}">
                            <li>
                                <a href="#">${DUDE.nickName}</a>
                                <button id="removeFriend-btn" type="button" class="btn btn-warning btn-xs" value="${DUDE.userNo}">친구 삭제</button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>                          


            </div>
        </div>
    </div>
    <!-- /control-sidebar-content -->

</aside>


<!-- 받은 친구요청 -- >
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false">받은 친구요청</button>
                    <ul id="target-ul" class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
                        <c:forEach var="TARGET" items="${friendListMap.get('TARGET')}">
                            <li>
                                <a href="#">${TARGET.nickName}</a>
                                <button id="accept-btn" class="btn btn-warning" type="button" value="${TARGET.userNo}">수락</button>
                                <button id="refuse-btn" class="btn btn-warning" type="button" value="${TARGET.userNo}">거절</button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>


                < !-- 친구요청리스트 -- >
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">친구 요청 리스트</button>
                    <ul id="requset-ul" class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <c:forEach var="REQUEST" items="${friendListMap.get('REQUEST')}">
                            <li>
                                <a href="#">${REQUEST.nickName}</a>
                                <button id="requestCancel-btn" class="btn btn-warning" type="button" value="${REQUEST.userNo}">요청 취소</button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>


                < !-- 친구차단리스트 -- >
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">친구 차단 리스트</button>
                    <ul id="block-ul" class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                        <c:forEach var="BLOCK" items="${friendListMap.get('BLOCK')}">
                            <li>
                                <a href="#">${BLOCK.nickName}</a>
                                <button id="removeBlockFriend-btn" class="btn btn-warning" type="button" value="${BLOCK.userNo}">차단 해제</button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                -->