<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!-- 필수 스크립트 -->
<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>



<!-- 페이지별 삽입 스크립트 -->
<script> //main-sidebar (유저정보+채널리스트)
    //로그아웃 버튼 클릭이벤트
    $('#signOut-btn').on('click', e => {
        let checkLogout = confirm("로그아웃 하시겠습니까?");
        if (checkLogout) {
            location.href = '/sign/out'
        }
    });
</script>


<script>//right-sidebar (친구기능)
    $(function () {
        //새로고침 기능 펑션
        function processReBtn() {
            const reqInfo = {
                method: 'GET', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/friendListMap', reqInfo)
                .then(res => res.json())
                .then(stringListMap => {
                    console.log(stringListMap.REQUEST);

                    makeFriendListDOM(stringListMap);

                })
        }
        $('#re-button').on('click', e => {
            console.log("re버튼 클릭됨");
            processReBtn();
        });

        //검색 버튼
        $('#search-btn').on('click', e => {
            e.preventDefault();
            console.log("검색버튼 눌림");
            if ($('#search-input').val() === "") {
                let tag = '';
                tag += "<div>잘못된 닉네임</div>";
                $('#search-result').html(tag);
                return;
            }
            const reqInfo = {
                method: 'POST', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/searchFriend' + $('#search-input').val(), reqInfo)
                .then(res => res.json())
                .then(infoNick => {
                    console.log("infoNick 데이터 " + infoNick);
                    makeSearchResult(infoNick);
                });

        })

        // 친구수락
        $('#target-ul').on('click','#accept-btn', e => {
            e.preventDefault();
            const reqInfo = {
                method: 'POSt', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/friendAccept' + $('#accept-btn').val(), reqInfo)
                .then(res => res.text())
                .then(txt => {
                    processReBtn();
                });
        });

        //친구거절
        $('#target-ul').on('click','#refuse-btn', e => {
            e.preventDefault();
            const reqInfo = {
                method: 'DELETE', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/refuseFriend' + $('#accept-btn').val(), reqInfo)
                .then(res => res.text())
                .then(txt => {
                    processReBtn();
                });
        });


        //친구요청 취소
        $('#requset-ul').on('click', '#requestCancel-btn' , e => {
            e.preventDefault();
            console.log("친구요청 취소 로그");
            const reqInfo = {
                method: 'delete', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/refuseFriend' + $('#requestCancel-btn').val(), reqInfo)
                .then(res => res.text())
                .then(txt => {
                    processReBtn();
                });
        });

        //친구삭제
        $('#friendList-div').on('click','#removeFriend-btn', e => {
            e.preventDefault();
            const reqInfo = {
                method: 'delete', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/removeFriend' + $('#removeFriend-btn').val(), reqInfo)
                .then(res => res.text())
                .then(txt => {
                    processReBtn();
                });
        });

        //친구 차단 해제 - 관계 삭제
        $('#block-ul').on('click', '#removeBlockFriend-btn', e => {
            e.preventDefault();
            const reqInfo = {
                method: 'delete', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/removeBlockFriend' + $('#removeBlockFriend-btn').val(), reqInfo)
                .then(res => res.text())
                .then(txt => {
                    processReBtn();
                });
        });

        //친추 요청
        $('#search-result').on('click', '#friend-btn', e => {
            e.preventDefault();
            console.log("친추버튼눌림");
            const reqInfo = {
                method: 'POST', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/addFriend' + $('#friend-btn').val(), reqInfo)
                .then(res => res.text())
                .then(txt => {
                    processReBtn();
                });

        })



        //DOM
        function makeSearchResult(infoNick) {
            let tag = '';
            tag += "<div><a href='#'>";
            if (infoNick == null) {
                tag += '';
            } else if (infoNick.nickName === $('#userNickName').val()) {
                tag += "본인입니다.</a></div>";
            } else {
                tag += infoNick.nickName + "</a>" +
                    "<button id='friend-btn' class='btn btn-warning btn-xs' type='button' value='" + infoNick.userNo + "'>친구 요청</button></div>";
            }
            $('#search-result').html(tag);
        }

        function makeFriendListDOM(stringListMap) {
            let tag = '';
            // 친구 요청 취소
            for (let REQUEST of stringListMap.REQUEST) {
                tag += "<li class='nav-item'><a class='nav-link' href='#'>" + REQUEST.nickName + "</a>" +
                    "<button id='requestCancel-btn' class='btn btn-warning btn-xs' type='button' value='" + REQUEST.userNo + "'>요청 취소</button></li>";
            }
            $('#requset-ul').html(tag);

            //친구삭제
            // tag = '나랑 친구 리스트';
            tag = '<li class="list-header">나랑 친구 리스트</li>';
            for (let DUDE of stringListMap.DUDE) {
                tag += "<li><a href='#'>" + DUDE.nickName + "</a>" +
                    "<button id='removeFriend-btn' class='btn btn-warning btn-xs' type='button' value='" + DUDE.userNo + "'>친구 삭제</button></li>";
            }
            // $('#friendList-div').html(tag);
            $('#friend-ul').html(tag);

            //차단
            tag = '';
            for (let BLOCK of stringListMap.BLOCK) {
                tag += "<li class='nav-item'><a class='nav-link' href='#'>" + BLOCK.nickName + "</a>" +
                    " <button id='removeBlockFriend-btn' class='btn btn-warning btn-xs' type='button' value='" + BLOCK.userNo + "'>차단 해제</button></li>";
            }
            $('#block-ul').html(tag);

            //친구수락
            tag = '';
            for (let TARGET of stringListMap.TARGET) {
                tag += "<li class='nav-item'><a class='nav-link' href='#'>" + TARGET.nickName + "</a>" +
                    "<button id='accept-btn' class='btn btn-warning btn-xs mr-1' type='button' value='" + TARGET.userNo + "'>수락</button>" +
                    "<button id='refuse-btn' class='btn btn-warning btn-xs' type='button' value='" + TARGET.userNo + "'>거절</button></li>";
            }
            $('#target-ul').html(tag);

        }

        // function makeFriendListDOM(stringListMap) {
        //     let tag = '';
        //     for (let DUDE of stringListMap.get('DUDE')) {
        //         tag += "<div> <a href='#'>" + REQUEST.nickName + "</a> <a href='#'>요청 취소</a></div>";
        //     }
        //     $('#friendList-div').html(tag);
        // }


    });
</script>



