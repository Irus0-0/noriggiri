package com.nuriggiri.nuriggiri.note.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@ToString
public class Note {

    private static int sequence; //번호

    private int NoteNo; // 쪽지 번호
    private String sendId; // 보내는 사람
    private String receiveId; //받는 사람
    private String content; //쪽지 내용
    private Date regDate; // 쪽지 보낸시간

    private Note() {
        this.NoteNo = ++sequence;
    }

    public Note(String sendId, String receiveId, String content) {
        this();
        this.sendId = sendId;
        this.receiveId = receiveId;
        this.content = content;
    }
}
