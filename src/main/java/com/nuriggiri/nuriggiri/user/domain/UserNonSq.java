package com.nuriggiri.nuriggiri.user.domain;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserNonSq {
    private int userNo; //유저번호
    private String userId; //유저아이디
    private String userPw; //유저비밀번호
    private String nickName; //닉네임
    private Date regDate; //가입일
}
