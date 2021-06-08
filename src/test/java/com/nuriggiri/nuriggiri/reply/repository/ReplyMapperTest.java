package com.nuriggiri.nuriggiri.reply.repository;

import com.nuriggiri.nuriggiri.reply.domain.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyMapperTest {

    @Autowired ReplyMapper replyMapper;

    @Test
    @DisplayName("특정 게시물에 댓글 20개를 삽입")
    void insertTest(){
        for (int i = 1; i <= 20; i++) {
            Reply reply = new Reply();
            reply.setBoardNo(5);
            reply.setContent("테스트댓글" + i);
            reply.setNickName("야옹이");

            replyMapper.save(reply);
        }
    }

}