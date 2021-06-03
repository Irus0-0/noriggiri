package com.nuriggiri.nuriggiri.user.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@ToString
public class User {
    private static int sequence;

    private int userNo; //유저번호
    private String userId; //유저아이디
    private String userPw; //유저비밀번호
    private String nickName; //닉네임
    private Date regDate; //가입일



    public User(String userId, String userPw, String nickName) {

        this.userId = userId;
        this.userPw = userPw;
        this.nickName = nickName;
    }


//    public void setUserPw(String userPw) {
//        this.userPw = new BCryptPasswordEncoder().encode(userPw);
//    }
}

