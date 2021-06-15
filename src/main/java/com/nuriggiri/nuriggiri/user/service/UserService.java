package com.nuriggiri.nuriggiri.user.service;

import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.service.FriendService;
import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import com.nuriggiri.nuriggiri.user.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserService {

    private static final int SUCCESS = 1;


    private final UserMapper userMapper;
    private final FriendService friendService;

    //회원가입
    public void signUp(User user) {
        String rowPw = user.getUserPw();
        user.setUserPw(new BCryptPasswordEncoder().encode(rowPw));
        userMapper.signUp(user);
    }

    //회원탈퇴
    public void deleteUser(int userNo) {
        userMapper.deleteUser(userNo);
    }

    //내 정보 변경
    public boolean modifyUser(User user) {
        return userMapper.modifyUser(user) == SUCCESS;
    }

    //유저 정보 보기
    public User userInfo(String userId) {
        return userMapper.userInfo(userId);
    }
    //유저 정보 보기
    public User userInfoNick(String nickName) {
        return userMapper.userInfoNick(nickName);
    }
    //유저 정보 보기
    public User userInfoNo(int userNo) {
        return userMapper.userInfoNo(userNo);
    }

    //중복 아이디 검색
    public boolean searchUserId(String userId) {
        int checkId = userMapper.searchUserId(userId);
        return checkId < 1;
    }

    //중복 닉네임 검색
    public boolean searchUserNickName(String nickName) {
        int checkNickName = userMapper.searchUserNickName(nickName);
        return checkNickName < 1;
    }

    //로그인 기능
    public String login(LoginUser inputUser) {
        User dbUser = userMapper.userInfo(inputUser.getUserId()); //db에 저장된 유저 정보

        //아이디 있는경우
        if (dbUser != null) {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            if (encoder.matches(inputUser.getUserPw(), dbUser.getUserPw())) {
                //비번 통과
                return "success";
            } else {
                //비밀번호 불일치
                return "pwFail";
            }
        } else {
            //아이디 없음
            return "idFail";
        }
    }

    //자동 로그인 기능
    public void keepLogin(HttpServletRequest request, HttpServletResponse response, String account) {
        //쿠키 생성
        String sessionId = request.getSession().getId(); // 세션 아이디 받아오기 여기서는 loginUser
        Cookie loginCookie = new Cookie("loginCookie", sessionId);
        loginCookie.setPath("/"); //모든경로에서 접근가능
        //쿠키의 수명 설정 30일
        int limitTimeCookie = 60 * 60 * 24 * 30; //초단위로 설정해야하기 때문에  60초/60분/24시간/30일
        loginCookie.setMaxAge(limitTimeCookie);
        //response 를 이용해서 로컬에 쿠키값 전달
        response.addCookie(loginCookie);
        //DB에 자동로그인 값을 저장  DB에 저장된 쿠키와 가져온 쿠키를 비교하여 로그인 하기 위함
        Map<String, Object> loginMap = new HashMap<>();
        loginMap.put("sid", sessionId);
        //로그인 유지시간 변경  쿠키는 초단위로 넣어야하고 데이터베이스에는 날짜로 넣어줘야함
        long expire = System.currentTimeMillis() + (limitTimeCookie * 1000L);
        Date limitDate = new Date(expire);
        loginMap.put("lt", limitDate);
        loginMap.put("acc", account);

        userMapper.saveKeepLogin(loginMap);
    }

    //자동 로그인 해제
    public void logout(String account) {

        Map<String, Object> logoutMap = new HashMap<>();
        logoutMap.put("sid","none");
        logoutMap.put("lt", new Date());
        logoutMap.put("acc", account);
        userMapper.saveKeepLogin(logoutMap);
    }

    //비밀번호 찾기 비밀번호 변경
    public void changePw(String userPw) {
        userMapper.pwSearchChange(userPw);
    }

}
