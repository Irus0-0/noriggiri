package com.nuriggiri.nuriggiri.board.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@AllArgsConstructor
@ToString
public class Board {

    private static int sequence;

    private int channelNo; //채널 번호
    private int boardNo; //글번호
    private String writer; //작성자
    private String title; //글제목
    private String content; //글내용
    private int recommend; //추천

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