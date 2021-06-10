package com.nuriggiri.nuriggiri.friend.domain;

import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class FriendList {

    private int userNo;
    private int targetNo;
    private Relation relationship;

    //친구목록에 사용
    private String userId;
    private String nickName;


}
