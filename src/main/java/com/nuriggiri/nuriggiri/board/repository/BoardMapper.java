package com.nuriggiri.nuriggiri.board.repository;

import com.nuriggiri.nuriggiri.board.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    //게시글 조회
    List<Board> boardList();

    //게시글 등록
    void create(Board board);

    //게시글 내용보기
    Board more(int boardNo);

    //게시글 수정
    void rewrite(Board board);

    //게시글 삭제
    void remove(int boardNo);

}
