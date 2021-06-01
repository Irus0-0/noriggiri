package com.nuriggiri.nuriggiri.replyRecommendList.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class ReplyRecommendList {

    private int replyNo; //댓글번호 PK FK
    private int boardNo; //본문번호 FK
    private int userNo; //유저번호 FK
    private String replyRecommendYN; //추천 여부 DEFAULT 'N'

}
