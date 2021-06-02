package com.nuriggiri.nuriggiri.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ModifyBoard {
    // 수정에서 사용하기 위한 도메인
    private int boardNo; //글번호 PK
    private String title; //글제목
    private String content; //글내용
}
