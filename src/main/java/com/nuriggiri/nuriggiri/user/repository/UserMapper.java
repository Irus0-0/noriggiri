package com.nuriggiri.nuriggiri.user.repository;

import com.nuriggiri.nuriggiri.user.domain.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    //회원가입
    int signUp(User user);

    //회원탈퇴
    int deleteUser(int userNo);

//    //로그인
//    int signIn(User user);
//
//    //로그아웃
//    int signOut(String userId);

    //내 정보 변경
    int modifyUser(User user);

    //내 정보 보기
    int userInfo(User user);

    //중복 아이디 검색
    int searchUserId(String userId);

    //중복 닉네임 검색
    int searchUserNickName(String nickName);


}
