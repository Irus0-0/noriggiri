package com.nuriggiri.nuriggiri.channelJoinUser.domain;

import lombok.*;

@Setter @Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChannelJoinUser {

    private int channelNo; //채널번호 PK FK
    private int userNo; //유저번호 Fk

}


