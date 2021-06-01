package com.nuriggiri.nuriggiri.reply.domain;

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
public class Reply {
    private static int sequence;

    private int channel; //채널번호 FK
    private int boardNo; //본문번호 FK
    private int replyNo; //댓글번호 PK
    private String nickName; //댓글 작성자 이름
    private String content; //댓글 내용
    private int recommend; //추천
    private List<User> recommendList; //추천한 사람들 중복추천방지
    private Date regDate; // 댓글 작성일자

    public Reply() {
        this.replyNo = ++sequence;
    }

    public Reply(String nickName, String content) {
        this();
        this.nickName = nickName;
        this.content = content;
    }
}