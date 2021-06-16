<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!-- 필수 스크립트 -->
<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>



<!-- 페이지별 삽입 스크립트 -->
<script> //main-sidebar
    //로그아웃 버튼 클릭이벤트
    $('#signOut-btn').on('click', e => {
        let checkLogout = confirm("로그아웃 하시겠습니까?");
        if (checkLogout) {
            location.href = '/sign/out'
        }
    });
</script>



