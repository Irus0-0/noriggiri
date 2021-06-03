package com.nuriggiri.nuriggiri.user.domain;

import lombok.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User {
    private static int sequence;

    private int userNo; //유저번호
    private String userId; //유저아이디
    private String userPw; //유저비밀번호
    private String nickName; //닉네임
    private Date regDate; //가입일
    private Auth auth; //권한



//    public void setUserPw(String userPw) {
//        this.userPw = new BCryptPasswordEncoder().encode(userPw);
//    }
}

