package com.nuriggiri.nuriggiri.board.repository;

import com.nuriggiri.nuriggiri.board.domain.Board;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardMapperTest {

    @Autowired BoardMapper boardMapper;

    @Test
    @DisplayName("데이터 베이스에 100개의 값이 입력되어야 한다")
    void boardMapperTest() {
        for (int i = 1; i <= 100; i++) {
            Board board = new Board();
            board.setTitle("테스트제목" + i);
            board.setContent("테스트내용입니다. " + i);
            board.setWriter("USER" + i);
            board.setNotice("false");
            board.setRecommend(i);

            boardMapper.create(board);
        }
    }
}