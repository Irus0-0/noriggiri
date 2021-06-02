package com.nuriggiri.nuriggiri.channel.domain;

import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@ToString
public class Channel {
    private static int sequence;

    private int channelNo; //채널번호 PK
    private String channelName; //채널이름
    private String channelInfo; //채널 설명
    private List<User> joinUser; //채널 참여 유저
    private int adminUserNo; //채널 관리자 (생성한 유저 아이디)
    private String channelPw; //채널 접속시 필요한 패스워드
    private Date creationDate; //채널 생성일
//    private String dbName; // 테이블 네임 생성 생각중

    public Channel() {
        this.channelNo = ++sequence;
    }

    public Channel(String channelName, String channelInfo ,String channelPw) {
        this();
        this.channelName = channelName;
        this.channelInfo = channelInfo;
        this.channelPw = channelPw;
    }

}
