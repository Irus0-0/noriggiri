package com.nuriggiri.nuriggiri.user.repository;

import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {
    //회원가입
    void signUp(User user);

    //회원탈퇴
    int deleteUser(int userNo);

    //내 정보 변경
    int modifyUser(User user);

    //유저 정보 보기
    User userInfo(String userId);

    //중복 아이디 검색
    int searchUserId(String userId);

    //중복 닉네임 검색
    int searchUserNickName(String nickName);

    //쿠키값 저장
    void saveKeepLogin(Map<String, Object> datas);

    //세션 아이디로 유저 검색하기
    User sessionSearchUser(String sessionId);

    //비밀번호 찾기- 비밀번호 변경
    void pwSearchChange(String userPw);

}
