package com.nuriggiri.nuriggiri.channel.domain;

import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@ToString
public class Channel {
    private static int sequence;

    private int channelNo; //채널번호
    private List<User> joinUser; //조인유저
    private String userId; //생성한 유저 아이디
    private String nickName; //닉네임

}
