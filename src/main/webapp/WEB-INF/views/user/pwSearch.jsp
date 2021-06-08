<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>

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

    <body class="hold-transition register-page">
        <div class="register-box">
            <div class="register-logo">
                <a href="/"><b>누리</b>끼리</a>
            </div>

            <div class="card">
                <div class="card-body register-card-body">
                    <p class="login-box-msg">비밀번호 찾기</p>

                    <form action="/sign/pwSearch" id="signUpForm" method="post">
                        <span id="idChk"></span>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <span id="nickChk"></span>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <!-- 아이콘 변경 필요 -->
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                            <!-- /.col -->
                            <div class="row">
                                <div class="col-8">
                                    <div class="icheck-primary">
                                        
                                        <label for="agreeTerms">
                                         
                                        </label>
                                    </div>
                                </div>
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">찾기</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                </div>
                <!-- /.form-box -->
            </div><!-- /.card -->
        </div>
        <!-- /.register-box -->

    </body>

</html>