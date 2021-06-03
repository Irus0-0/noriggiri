<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .hide {
            display: none;
        }
    </style>
</head>

<body>

    <form action="/sign/in" id="signInForm" method="post">
        # Id: <input type="text" id="userId" name="userId"><br>
        # Pw: <input type="text" id="userPw" name="userPw"><br>
        <button type="submit"> 로그인 임시 버튼</button>
        <input type="button" id="signin-btn" value="로그인">
        <input type="checkbox" id="signing-btn" name="useCookie" value="로그인유지">

    </form>

</body>

<script>



</script>

</html>