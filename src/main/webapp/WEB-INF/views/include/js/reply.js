<script>
      // 댓글 처리 JS
      $(function () {
         //원본글 번호
         const boardNo = '${article.boardNo}';

         //날짜 포맷 변환 함수
         function formatDate(datetime) {
            //문자열 날짜 데이터를 날짜객체로 변환
            const dateObj = new Date(datetime);
            // console.log(dateObj);
            //날짜객체를 통해 각 날짜 정보 얻기
            let year = dateObj.getFullYear();
            let month = dateObj.getMonth() + 1;
            let day = dateObj.getDate();
            let hour = dateObj.getHours();
            let minute = dateObj.getMinutes();

            //오전, 오후 시간체크
            let ampm = '';
            if (hour < 12 && hour >= 6) {
               ampm = '오전';
            } else if (hour >= 12 && hour < 21) {
               ampm = '오후';
               if (hour !== 12) {
                  hour -= 12;
               }
            } else if (hour >= 21 && hour <= 24) {
               ampm = '밤';
               hour -= 12;
            } else {
               ampm = '새벽';
            }

            //숫자가 1자리일 경우 2자리로 변환
            (month < 10) ? month = '0' + month: month;
            (day < 10) ? day = '0' + day: day;
            (hour < 10) ? hour = '0' + hour: hour;
            (minute < 10) ? minute = '0' + minute: minute;

            return year + "-" + month + "-" + day + " " + ampm + " " + hour + ":" + minute;

         }

         //댓글 페이지 태그 생성 배치함수
         function makePageInfo(pageInfo) {
            let tag = "";

            const begin = pageInfo.beginPage;
            const end = pageInfo.endPage;

            //이전 버튼 만들기
            if (pageInfo.prev) {
               tag += "<li class='page-item'><a class='page-link page-active' href='" + (begin - 1) +
                  "'>이전</a></li>";
            }

            //페이지 번호 리스트 만들기
            for (let i = begin; i <= end; i++) {
               const active = (pageInfo.criteria.page === i) ? 'page-active' : '';
               tag += "<li class='page-item'><a class='page-link page-custom " + active + "' href='" + i + "'>" +
                  i + "</a></li>";
            }

            //다음 버튼 만들기
            if (pageInfo.next) {
               tag += "<li class='page-item'><a class='page-link page-active' href='" + (end + 1) +
                  "'>다음</a></li>";
            }

            //태그 삽입하기
            $(".pagination").html(tag);
         }

         //댓글 태그 생성, 배치 함수
         function makeReplyListDOM(replyMap) {
            let tag = '';

            for (let reply of replyMap.replyList) {
               tag += "<div id='replyContent' class='card-body' data-replyId='" + reply.replyNo + "'>" +
                  "    <div class='row user-block'>" +
                  "       <span class='col-md-3'>" +
                  "         <b>" + reply.nickName + "</b>" +
                  "       </span>" +
                  "       <span class='offset-md-6 col-md-3 text-right'><b>" + formatDate(reply.regDate) +
                  "</b></span>" +
                  "    </div><br>" +
                  "    <div class='row'>" +
                  "       <div class='col-md-6'>" + reply.content + "</div>" +
                  "       <div class='offset-md-2 col-md-4 text-right'>" +
                  "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' href='#replyModifyModal' data-toggle='modal'>수정</a>&nbsp;" +
                  "         <a id='replyDelBtn' class='btn btn-sm btn-outline-dark' href='#'>삭제</a>" +
                  "       </div>" +
                  "    </div>" +
                  " </div>";
            }

            //만든 태그를 댓글목록 안에 배치
            $('#replyData').html(tag);
            //댓글 수 배치
            $('#replyCnt').text(replyMap.count);

            //페이지 태그 배치
            makePageInfo(replyMap.pageInfo);

         }

         //댓글 목록 비동기 요청처리 함수
         function getReplyList(page) {
            fetch('/api/v1/reply/' + boardNo + "/" + page)
               .then(res => res.json())
               .then(replyMap => {
                  console.log(replyMap);
                  makeReplyListDOM(replyMap);
               });
         }

         //페이지 첫 진입시 비동기로 댓글목록 불러오기
         getReplyList(1);

         //페이지 버튼 클릭 이벤트
         $('.pagination').on('click', 'li a', e => {
            e.preventDefault();
            getReplyList(e.target.getAttribute('href'));
         });

         //댓글 등록 버튼 클릭 이벤트
         $('#replyAddBtn').on('click', e => {

            //서버로 댓글 내용을 전송해서 DB에 저장
            const reqInfo = {
               method: 'POST', //요청 방식
               headers: { //요청 헤더 내용
                  'content-type': 'application/json'
               },
               //서버로 전송할 데이터 (JSON)
               body: JSON.stringify({
                  boardNo: boardNo,
                  content: $('#newReplyText').val(),
                  nickName: $('#newReplyWriter').val()
               })
            };
            fetch('/api/v1/reply', reqInfo)
               .then(res => res.text())
               .then(msg => {
                  if (msg === 'insertSuccess') {
                     getReplyList(1);
                     $('#newReplyText').val('');
                     $('#newReplyWriter').val('');
                  } else {
                     alert('댓글 등록에 실패했습니다.');
                  }
               })
         });

         //댓글 수정버튼 클릭 이벤트
         const $modal = $('#replyModifyModal');
         $('#replyData').on('click', '#replyModBtn', e => {
            //console.log("수정버튼 클릭!");
            //모달 띄우기
            $modal.modal('show');

            //기존 댓글내용 가져오기
            const originText = e.target.parentNode.previousElementSibling.textContent;
            // console.log(originText);

            $('#modReplyText').val(originText);

            //모달이 열릴때 모달안에 댓글번호 넣어놓기
            const replyId = e.target.parentNode.parentNode.parentNode.dataset.replyid;
            // console.log(replyId);

            $('#modReplyId').val(replyId);
         });

         //모달창 닫기 이벤트
         $('.modal-header button, .modal-footer button:last-child').on('click', e => {
            $modal.modal('hide');
         });

         //댓글 수정 요청 이벤트
         $('#replyModBtn').on('click', e => {
            //댓글 번호
            const replyId = $('#modReplyId').val();
            //수정된 댓글 내용
            const replyText = $('#modReplyText').val();
            //console.log("댓글번호:", replyId);
            //console.log("댓글내용:", replyText);

            const reqInfo = {
               method: 'PUT',
               headers: {
                  'content-type': 'application/json'
               },
               body: JSON.stringify({
                  replyNo: replyId,
                  content: replyText
               })
            };
            fetch('/api/v1/reply/' + replyId, reqInfo)
               .then(res => res.text())
               .then(msg => {
                  if (msg === 'modSuccess') {
                     $modal.modal('hide');
                     getReplyList(1);
                  } else {
                     alert("댓글 수정에 실패했습니다.");
                  }
               })
         });

         //댓글 삭제 비동기 요청 이벤트
         $("#replyData").on("click", "#replyDelBtn", e => {
            const replyId = e.target.parentNode.parentNode.parentNode.dataset.replyid;
            //console.log("삭제 버튼 클릭! : " + replyId);
            if (!confirm("진짜로 삭제할거니??")) {
               return;
            }
            const reqInfo = {
               method: 'DELETE'
            };
            fetch('/api/v1/reply/' + replyId, reqInfo)
               .then(res => res.text())
               .then(msg => {
                  if (msg === 'delSuccess') {
                     getReplyList(1);
                  } else {
                     alert("댓글 삭제에 실패했습니다.");
                  }
               })
         });
      });
   </script>