package com.nuriggiri.nuriggiri.channel.domain;

import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Setter @Getter
public class ModifyChannel {

    private int channelNo; //채널번호 PK
    private String channelName; //채널이름
    private String channelInfo; //채널 설명
    //private List<User> joinUser; //채널 참여 유저
    //private int adminUserNo; //채널 관리자 (생성한 유저 시퀀스넘버)
    private String channelPw; //채널 접속시 필요한 패스워드

}
