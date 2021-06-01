<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Document</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .hide{
            display: none;
        }
    </style>
</head>

<body>

    <form class="abc" action="/sign/up" method="post">
        <p id="signInput">
            # Id: <input type="text" id="userId" name="userId"><br>
            <!-- <button type="button" id="idcheck">아이디 중복확인</button> <br> -->
            <div class="hide">사용가능!</div>
            <div class="hide">사용불가!</div>
            # Pw: <input type="text" name="userPw"><br>
            # NickName: <input type="text" id="nickName" name="nickName"><br>
            <input type="submit" value="등록">
        </p>
    </form>

    <script>
        $('#userId').on('blur', e => {
            const userId = $('#userId').val();
            console.log(userId);

            const reqInfo = {
                method: 'post',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify({
                    userId: userId
                })
            };
            fetch('/sign/up/'+ userId, reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === '중복없음') {
                        alert('사용가능!');
                    }else{
                        alert('중복됨!');
                    }
                })
        });

    </script>

</body>

</html>