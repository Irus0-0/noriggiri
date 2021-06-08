package com.nuriggiri.nuriggiri.board.service;

import com.nuriggiri.nuriggiri.board.domain.Board;
import com.nuriggiri.nuriggiri.board.paging.Criteria;
import com.nuriggiri.nuriggiri.board.repository.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {

    public final BoardMapper boardMapper;

    public List<Board> boardList(Criteria criteria) {
        return boardMapper.boardList(criteria);
    }

    //게시글 등록
    public void create(Board board) throws Exception{
        boardMapper.create(board);
    }

    //게시글 내용보기
    public Board more(int boardNo) {
        return boardMapper.more(boardNo);
    }

    //게시글 수정
    public void rewrite(Board board) {
        boardMapper.rewrite(board);
    }

    //게시글 삭제
    public void  remove(int boardNo) {
        boardMapper.remove(boardNo);
    }

    // 총 게시물 수 조회
    public int getTotal() {
        return boardMapper.getTotalCount();
    }


}
