package com.nuriggiri.nuriggiri.user.service;

import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private static final int SUCCESS = 1;


    private final UserMapper userMapper;

    //회원가입
   public boolean signUp(User user) {
        return userMapper.signUp(user) == SUCCESS;
    }

    //회원탈퇴
    public boolean deleteUser(int userNo) {
       return userMapper.deleteUser(userNo) == SUCCESS;
    }

    //내 정보 변경
    public boolean modifyUser(User user) {
       return userMapper.modifyUser(user) == SUCCESS;
    }

    //내 정보 보기
    public boolean userInfo(User user) {
       return userMapper.userInfo(user) == SUCCESS;
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


}
