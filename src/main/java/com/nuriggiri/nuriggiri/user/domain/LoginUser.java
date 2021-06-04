package com.nuriggiri.nuriggiri.user.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class LoginUser {
    private String userId; //유저아이디
    private String userPw; //유저비밀번호
    private boolean autoLogin; //유저 권한

}
