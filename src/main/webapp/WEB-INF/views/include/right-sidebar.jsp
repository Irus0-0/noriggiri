<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
        <h5>우측 사이드바</h5>
        <p>메세지 보기나 친구목록 같은거 넣으면 좋을듯</p>
        <div>검색창 만들어줘야함</div>

        <button id="re-button" type="button" class="btn btn-dark form-control">새로고침</button>

        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3"
                data-bs-toggle="dropdown" aria-expanded="false">
                받은 친구요청
            </button>
            <ul id="target-ul" class="dropdown-menu" aria-labelledby="dropdownMenuButton3">

                <c:forEach var="TARGET" items="${friendListMap.get('TARGET')}">
                    <div><a href="#">${TARGET.nickName}</a></div>
                    <button id="accept-btn" type="button" value="${TARGET.userNo}">수락</button>
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
                    <div> <a href="#">${BLOCK.nickName}</a> <a href="#">차단 취소</a></div>
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
        $('#re-button').on('click', e => {
            console.log("re버튼 클릭됨");
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
        });
        // 친구수락
        $('#accept-btn').on('click', e => {
            e.preventDefault();
            const reqInfo = {
                method: 'POSt', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/friendAccept'+$('#accept-btn').val(), reqInfo)
        });
        
        //친구요청 취소
        $('#requestCancel-btn').on('click', e => {
            e.preventDefault();
            const reqInfo = {
                method: 'delete', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/refuseFriend'+$('#requestCancel-btn').val(), reqInfo)
        });

         //친구삭제
         $('#removeFriend-btn').on('click', e => {
            e.preventDefault();
            const reqInfo = {
                method: 'delete', //요청 방식
                headers: { //요청 헤더 내용
                    'content-type': 'application/json'
                }
            };
            fetch('/removeFriend'+$('#removeFriend-btn').val(), reqInfo)
        });



        //DOM
        function makeFriendListDOM(stringListMap) {
            let tag = '';

            for (let REQUEST of stringListMap.REQUEST) {
                tag += "<div> <a href='#'>" + REQUEST.nickName +
                    "<button id='requestCancel-btn' type='button' value='"+REQUEST.userNo+"'>요청 취소</button>";
            }
            $('#requset-Ul').html(tag);


            tag = '나랑 친구 리스트';
            for (let DUDE of stringListMap.DUDE) {
                tag += "<div> <a href='#'>" + DUDE.nickName +
                    "<button id='removeFriend-btn' type='button' value='"+DUDE.userNo+"'>친구 삭제</button>";
            }
            $('#friendList-div').html(tag);

            tag = '';
            for (let BLOCK of stringListMap.BLOCK) {
                tag += "<div> <a href='#'>" + BLOCK.nickName +
                    "</a> <a href='#'>차단 취소</a></div>";
            }
            $('#block-ul').html(tag);

            tag = '';
            for (let TARGET of stringListMap.TARGET) {
                tag += "<div> <a href='#'>" + TARGET.nickName +
                    " <button id='accept-btn' type='button' value='"+ TARGET.userNo +"'>수락</button>";
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