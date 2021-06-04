package com.nuriggiri.nuriggiri.user.service;

import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private static final int SUCCESS = 1;


    private final UserMapper userMapper;

    //회원가입
   public void signUp(User user) {
        String rowPw = user.getUserPw();
        user.setUserPw(new BCryptPasswordEncoder().encode(rowPw));
        userMapper.signUp(user);
    }

    //회원탈퇴
    public boolean deleteUser(int userNo) {
       return userMapper.deleteUser(userNo) == SUCCESS;
    }

    //내 정보 변경
    public boolean modifyUser(User user) {
       return userMapper.modifyUser(user) == SUCCESS;
    }

    //유저 정보 보기
    public User userInfo(String userId) {
        return userMapper.userInfo(userId);
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
        if(dbUser != null) {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            if(encoder.matches(inputUser.getUserPw(), dbUser.getUserPw())) {
                //비번 통과
                return "success";
            } else {
                //비밀번호 불일치
                return "pwFail";
            }
        }else {
            //아이디 없음
            return "idFail";
        }
    }
}
