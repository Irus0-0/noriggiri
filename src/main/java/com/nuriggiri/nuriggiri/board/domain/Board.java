package com.nuriggiri.nuriggiri.board.domain;

import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Setter @Getter
@AllArgsConstructor
@ToString
public class Board {

    private static int sequence;

    private int channelNo; //채널 번호 FK
    private int boardNo; //글번호 PK
    private String writer; //작성자 nickName
    private String title; //글제목
    private String content; //글내용
    private int recommend; //추천
    private List<User> recommendList; //추천한 사람들
    private Date regDate; //글 작성일
    private String notice; //공지 구분 - default false

    public Board() {
        this.boardNo = ++sequence;
    }

    public Board(String writer, String title, String content) {
        this();
        this.writer = writer;
        this.title = title;
        this.content = content;
    }
}