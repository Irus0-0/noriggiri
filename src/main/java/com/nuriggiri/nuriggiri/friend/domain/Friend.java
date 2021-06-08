package com.nuriggiri.nuriggiri.friend.domain;

import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Friend {

    private int userNo;
    private int targetNo;
    private String relationship;

}
