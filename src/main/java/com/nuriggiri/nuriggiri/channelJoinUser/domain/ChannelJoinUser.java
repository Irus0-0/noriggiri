package com.nuriggiri.nuriggiri.channelJoinUser.domain;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class ChannelJoinUser {
    private static int sequence;

    private int joinSeqNo; // 조인유저 PK
    private int channelNo; // 채널번호 FK
    private int userNo; // 유저번호 Fk

    public ChannelJoinUser() {
        this.channelNo = ++sequence;
    }

    public ChannelJoinUser(int channelNo, int userNo) {
        this();
        this.channelNo = channelNo;
        this.userNo = userNo;
    }
}


