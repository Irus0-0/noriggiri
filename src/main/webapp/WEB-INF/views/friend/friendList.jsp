<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>

<body>

    <c:forEach var="article" items="${friendList}">
        
            <td>유저번호: ${article.userNo}</td>
            <td>닉네임: ${article.nickName}</td>

    </c:forEach>

</body>

</html>