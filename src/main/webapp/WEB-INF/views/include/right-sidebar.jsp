<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
        <h5>우측 사이드바</h5>
        <p>메세지 보기나 친구목록 같은거 넣으면 좋을듯</p>
        <label for="search-input">친구 검색!</label>
        <input id="userNickName" type="hidden" value="${loginUser.nickName}">
        <input id="search-input" type="text" name="nickName">
        <button id="search-btn" class="bi bi-search"><span class="fas fa-search"></span></button>
        <div id="search-result">

        </div>


        <button id="re-button" type="button" class="btn btn-dark form-control">새로고침</button>

        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3"
                data-bs-toggle="dropdown" aria-expanded="false">
                받은 친구요청
            </button>
            <ul id="target-ul" class="dropdown-menu" aria-labelledby="dropdownMenuButton3">

                <c:forEach var="TARGET" items="${friendListMap.get('TARGET')}">
                    <div><a href="#">${TARGET.nickName}</a>
                        <button id="accept-btn" type="button" value="${TARGET.userNo}">수락</button>
                    </div>
                    <a href='#'>거절</a>
        </div>
        </c:forEach>
        </ul>
    </div>


    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
            data-bs-toggle="dropdown" aria-expanded="false">
            친구요청리스트
        </button>
        <ul id="requset-Ul" class="dropdown-menu" aria-labelledby="dropdownMenuButton1">

            <c:forEach var="REQUEST" items="${friendListMap.get('REQUEST')}">
                <div>
                    <a href="#">${REQUEST.nickName}</a>
                    <button id="requestCancel-btn" type="button" value="${REQUEST.userNo}">요청 취소</button>
                </div>
            </c:forEach>
        </ul>
    </div>

    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2"
            data-bs-toggle="dropdown" aria-expanded="false">
            친구차단리스트
        </button>
        <ul id="block-ul" class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
            <c:forEach var="BLOCK" items="${friendListMap.get('BLOCK')}">
                <div><a href="#">${BLOCK.nickName}</a>
                    <button id="removeBlockFriend-btn" type="button" value="${BLOCK.userNo}">차단 해제</button>
                </div>
            </c:forEach>
        </ul>
    </div>

    <div id="friendList-div">
        나랑 친구 리스트
        <!-- ${friendListMap.get("DUDE")} -->

        <c:forEach var="DUDE" items="${friendListMap.get('DUDE')}">
            <div>
                <a href="#">${DUDE.nickName}</a>
                <button id="removeFriend-btn" type="button" value="${DUDE.userNo}">친구 삭제</button>
            </div>


        </c:forEach>
    </div>
    </div>

    </div>
</aside>
<script>
    $(function () {
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


        //친구요청 취소
        $('#requset-Ul').on('click', '#requestCancel-btn' , e => {
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
                tag += "본인입니다 </a> </div>";
            } else {
                tag += infoNick.nickName + " </a>" +
                    "<button id='friend-btn' type='button' value='" + infoNick.userNo +
                    "'>친구 요청</button> </div>";
            }

            $('#search-result').html(tag);
        }

        function makeFriendListDOM(stringListMap) {
            let tag = '';
            // 친구 요청 취소
            for (let REQUEST of stringListMap.REQUEST) {
                tag += "<div> <a href='#'>" + REQUEST.nickName + "</a>" +
                    "<button id='requestCancel-btn' type='button' value='" + REQUEST.userNo + "'>요청 취소</button> </div>";
            }
            $('#requset-Ul').html(tag);

            //친구삭제
            tag = '나랑 친구 리스트';
            for (let DUDE of stringListMap.DUDE) {
                tag += "<div> <a href='#'>" + DUDE.nickName + "</a>" +
                    "<button id='removeFriend-btn' type='button' value='" + DUDE.userNo + "'>친구 삭제</button> </div>";
            }
            $('#friendList-div').html(tag);

            //차단 
            tag = '';
            for (let BLOCK of stringListMap.BLOCK) {
                tag += "<div> <a href='#'>" + BLOCK.nickName + "</a>" +
                    " <button id='removeBlockFriend-btn' type='button' value='" + BLOCK.userNo + "'>차단 해제</button> </div>";
            }
            $('#block-ul').html(tag);

            //친구수락
            tag = '';
            for (let TARGET of stringListMap.TARGET) {
                tag += "<div> <a href='#'>" + TARGET.nickName + "</a>" +
                    " <button id='accept-btn' type='button' value='" + TARGET.userNo + "'>수락</button> </div>";
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