package com.nuriggiri.nuriggiri.user.repository;

import com.nuriggiri.nuriggiri.user.domain.User;
import org.apache.ibatis.annotations.Mapper;

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


}
