<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
        <h5>우측 사이드바</h5>
        <p>메세지 보기나 친구목록 같은거 넣으면 좋을듯</p>
        <div>검색창 만들어줘야함</div>


        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                친구요청리스트

            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                DOM 만들어서 넣어줘야함
                ${friendListMap.get("REQUEST")}
            </ul>

            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                    친구차단리스트

                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                    DOM 만들어서 넣어줘야함
                    ${friendListMap.get("BLOCK")}
                </ul>
            </div>

            <div>
                나랑 친구인 리스트
                DOM 으로 넣어줘야함
                ${friendListMap.get("DUDE")}
            </div>
        </div>

    </div>
</aside>