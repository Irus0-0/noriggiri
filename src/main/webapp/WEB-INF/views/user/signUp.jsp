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
        .hide {
            display: none;
        }
    </style>
</head>

<body>

    <form action="/sign/up" id="signUpForm" method="post">
        <p id="signInput">
            <input type="hidden" name="userNo" value="0">
            # Id: <input type="text" id="userId" name="userId">
            <span id="idChk"></span> <br>

            <!-- <button type="button" id="idcheck">아이디 중복확인</button> <br> -->
            # Pw: <input id="rowPw" type="text" name="userPw"><br>
            # repeat_Pw: <input id="repeat-Pw" type="text" name="userRPw"><br>
            <span id="pwChk"></span> <br>
            # NickName: <input type="text" id="nickName" name="nickName">
            <span id="nickChk"></span> <br>
            <input type="button" id="signup-btn" value="등록">
        </p>
    </form>

    <script>
        $(function () {
            const $inputId = $('#userId');

            $inputId.on('blur', e => {
                if ($inputId.val().trim() === '') {
                    $inputId.css('background', 'pink');
                    $('#idchk').htmlhtml(
                        '<b style="color:red; font-size:14px;">[영문, 숫자 4~14자로 작성하세요]</b>');
                } else {

                    fetch('/sign/up/idCheck?userId=' + $inputId.val())
                        .then(res => res.text())
                        .then(flag => {
                            console.log(flag);
                            if (flag === 'false') {
                                //중복
                                $inputId.css('background', 'pink');
                                $('#idChk').html(
                                    '<b style="color:red; font-size:14px;">[아이디가 중복 되었습니다]</b>');
                            } else {
                                //중복안됨
                                $inputId.css('background', 'aqua');
                                $('#idChk').html(
                                    '<b style="color:green; font-size:14px;">[사용가능한 ID 입니다]</b>'
                                );
                            }
                        });

                }
            })

            const $inputNick = $('#nickName');

            $inputNick.on('blur', e => {
                if ($inputNick.val().trim() === '') {
                    $inputNick.css('background', 'pink');
                    $('#nickChk').htmlhtml(
                        '<b style="color:red; font-size:14px;">[영문 또는 한글로 작성하세요]</b>');
                } else {

                    fetch('/sign/up/nickCheck?nickName=' + $inputNick.val())
                        .then(res => res.text())
                        .then(flag => {
                            console.log(flag);
                            if (flag === 'true') {
                                //중복
                                $inputNick.css('background', 'pink');
                                $('#nickChk').html(
                                    '<b style="color:red; font-size:14px;">[닉네임이 중복 되었습니다]</b>');
                            } else {
                                //중복안됨
                                $inputNick.css('background', 'aqua');
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
                    if($pwInput.val() === $rowPwInput.val()) {
                        $pwInput.css('background', 'aqua');
                                $('#pwChk').html(
                                    '<b style="color:green; font-size:14px;">[비밀번호가 같습니다]</b>'
                                );
                    }else {
                        $pwInput.css('background', 'pink');
                                $('#pwChk').html(
                                    '<b style="color:red; font-size:14px;">[비밀번호가 다릅니다]</b>');
                    }
                })





            //회원가입 버튼 클릭 이벤트
            $('#signup-btn').on('click', e => {
                //from node
                $('#signUpForm').submit(); //수동 submit

            });



        }); //JQUERY END
    </script>

</body>

</html>