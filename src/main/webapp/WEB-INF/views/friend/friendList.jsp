<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css"> -->
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" defer></script>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>

    <c:forEach var="article" items="${friendList}">

            <td>유저번호: ${article.userNo}</td>
            <td>닉네임: ${article.nickName}</td>
        <br>
    </c:forEach>

    <form action="/friendList" id="friendForm" method="POST">
        <input type="hidden" id="targetNo" name="targetNo" value="4">

        <button id="addFriend-btn" class="btn btn-primary">친구요청</button>
    </form>

    <script>
        $(function () {

            $('#addFriend-btn').on('click', e => {

                const reqInfo = {
                    method: 'POST', //요청 방식
                    headers: { //요청 헤더 내용
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        targetNo: $('#targetNo').value()
                    })
                };

                fetch('/friendList' ,reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if(msg === 'friendAddSuccess') {
                            alert('친구요청에 성공하셨습니다');
                        }
                        else{
                            alert('친구추가에 실패하셨습니다')
                        }
                    });

            })

        })
    </script>

    
</body>

</html>