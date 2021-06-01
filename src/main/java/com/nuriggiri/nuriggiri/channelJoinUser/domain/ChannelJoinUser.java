package com.nuriggiri.nuriggiri.channelJoinUser.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class ChannelJoinUser {
    private int channelNo; //채널번호 PK FK
    private int userNo; //유저번호 Fk


    public ChannelJoinUser(int channelNo, int userNo) {
        this.channelNo = channelNo;
        this.userNo = userNo;
    }
}


