<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>누리끼리 signUp</title>

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

<body class="hold-transition register-page">
    <div class="register-box">
        <div class="register-logo">
            <a href="/"><b>누리</b>끼리</a>
        </div>

        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">회원가입</p>

                <form action="/sign/up" id="signUpForm" method="post">
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
                        <input type="email" class="form-control" id="nickName" name="nickName" placeholder="닉네임">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <!-- 아이콘 변경 필요 -->
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <span id="rowPwChk"></span>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" id="rowPw" name="userPw" placeholder="비밀번호">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <span id="pwChk"></span>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" id="repeat-Pw" name="userRPw"
                            placeholder="비밀번호 재확인">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                <label for="agreeTerms">
                                    회원가입 <a href="#">동의</a>
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <input type="button" id="signup-btn" class="btn btn-primary btn-block" value="회원가입">
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <div class="social-auth-links text-center">
                    <p>- OR -</p>
                    <a href="#" class="btn btn-block btn-primary">
                        <i class="fab fa-facebook mr-2"></i>
                        Sign up using Facebook
                    </a>
                    <a href="#" class="btn btn-block btn-danger">
                        <i class="fab fa-google-plus mr-2"></i>
                        Sign up using Google+
                    </a>
                </div>

                <a href="/sign/in" class="text-center">난 이미 아이디가 있지</a>
            </div>
            <!-- /.form-box -->
        </div><!-- /.card -->
    </div>
    <!-- /.register-box -->

    <script>
        //아이디 중복 체크
        $(function () {
            // 대소문자 숫자 4글자 ~ 14글자만 사용가능
            const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
            // 대소문자 숫자 한글 특수문자 - _  4~8글자의 닉네임만 사용가능 
            const getNickCheck = RegExp(/^[a-zA-Z0-9가-힣\_\-]{4,8}$/);
            // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
            const getPwCheck = RegExp(
                /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);

            //정상입력 확인 
            let currectId = false;
            let currectNick = false;
            //비밀번호 한번더 입력
            let currectPw = false;
            //비밀번호
            let currectRowPw = false;

            const $inputId = $('#userId');
            $inputId.on('blur', e => {
                if ($inputId.val().trim() === '') {
                    let currectId = false;
                    $inputId.css('background', 'pink');
                    $('#idChk').html('<b style="color:red; font-size:14px;">[아이디는 필수 정보입니다!]</b>');
                } else if (!getIdCheck.test($inputId.val())) {
                    currectId = false;
                    $inputId.css('background', 'pink');
                    $('#idChk').html('<b style="color:red; font-size:14px;">[영문, 숫자 4~14자로 작성하세요]</b>');
                } else {
                    fetch('/sign/up/idCheck?userId=' + $inputId.val())
                        .then(res => res.text())
                        .then(flag => {
                            console.log(flag);
                            if (flag === 'false') {
                                //중복
                                currectId = false;
                                $inputId.css('background', 'pink');
                                $('#idChk').html(
                                    '<b style="color:red; font-size:14px;">[아이디가 중복 되었습니다]</b>');
                            } else {
                                //중복안됨
                                currectId = true;
                                $inputId.css('background', '#66CDAA');
                                $('#idChk').html(
                                    '<b style="color:green; font-size:14px;">[사용가능한 ID 입니다]</b>'
                                );
                            }
                        });

                }
            })

            // 닉네임 중복체크
            const $inputNick = $('#nickName');

            $inputNick.on('blur', e => {
                if ($inputNick.val().trim() === '') {
                    currectNick = false;
                    $inputNick.css('background', 'pink');
                    $('#nickChk').html(
                        '<b style="color:red; font-size:14px;">[영문 또는 한글로 작성하세요]</b>');
                } 
                // else if (!getNickCheck.test($inputNick.val())) {
                //     currectNick = false;
                //     $inputNick.css('background', 'pink');
                //     $('#nickChk').html(
                //         '<b style="color:red; font-size:14px;">[영문 또는 한글로 작성하세요]</b>');
                // }
                 else {
                    fetch('/sign/up/nickCheck?nickName=' + $inputNick.val())
                        .then(res => res.text())
                        .then(text => {
                            console.log(text);
                            if (text === 'false') {
                                //중복
                                currectNick = false;
                                $inputNick.css('background', 'pink');
                                $('#nickChk').html(
                                    '<b style="color:red; font-size:14px;">[닉네임이 중복 되었습니다]</b>');
                            } else {
                                //중복안됨
                                currectNick = true;
                                console.log($inputNick.val());
                                $inputNick.css('background', '#66CDAA');
                                $('#nickChk').html(
                                    '<b style="color:green; font-size:14px;">[사용가능한 닉네임 입니다]</b>'
                                );
                            }
                        });
                }
            });
            // 패스워드 일치 체크
            const $pwInput = $('#repeat-Pw');
            const $rowPwInput = $('#rowPw');
            $pwInput.on('blur', e => {
                if ($pwInput.val().trim() === '') {
                    currectPw = false;
                    $pwInput.css('background', 'pink');
                    $('#pwChk').html(
                        '<b style="color:red; font-size:14px;">[비밀번호를 입력해주세요]</b>');
                } else {
                    if ($pwInput.val() === $rowPwInput.val()) {
                        currectPw = true;
                        $pwInput.css('background', '#66CDAA');
                        $('#pwChk').html(
                            '<b style="color:green; font-size:14px;">[비밀번호가 같습니다]</b>'
                        );
                    } else {
                        currectPw = false;
                        $pwInput.css('background', 'pink');
                        $('#pwChk').html(
                            '<b style="color:red; font-size:14px;">[비밀번호가 다릅니다]</b>');
                    }
                }
            });
            //비밀번호 pcre 체크
            $rowPwInput.on('blur', e => {
                if ($rowPwInput.val().trim() === '') {
                    currectRowPw = false;
                    $rowPwInput.css('background', 'pink');
                    $('#rowPwChk').html(
                        '<b style="color:red; font-size:14px;">[비밀번호를 입력해주세요]</b>');
                } 
                // else if (!getPwCheck.test($("#rowPw").val()) || $("#rowPw").val()
                //     .length < 8) {
                //     $('#rowPw').css("background-color", "pink");
                //     $('#rowPwChk').html(
                //         '<b style="font-size:14px;color:red;">[특수문자,대소문자,숫자 포함 8자이상]</b>');
                //     currectRowPw = false;
                // }
                 else {
                    $('#rowPw').css("background-color", "#66CDAA");
                    $('#rowPwChk').html(
                        '<b style="font-size:14px;color:green;">[사용가능한 비밀번호 입니다]</b>');
                    currectRowPw = true;
                }
            })






            //회원가입 버튼 클릭 이벤트
            $('#signup-btn').on('click', e => {
                if (currectId && currectNick && currectPw && currectRowPw) {
                    //from node
                    $('#signUpForm').submit(); //수동 submit
                } else {
                    alert("다시 입력해 주세요")
                }

            });



        }); //JQUERY END
    </script>
</body>

</html>