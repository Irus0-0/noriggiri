<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body>

    <p>
        # 유저ID: ${userInfo.userId}<br>
        # 닉네임: ${userInfo.nickName}<br>
        # 가입일: <fmt:formatDate pattern="YYYY년 MM월 dd일 HH시" value="${userInfo.regDate}" /><br>
        # 유저권한:${userInfo.auth} <br>
    </p>
    



</body>
</html>