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
        List<Board> boardList = boardMapper.boardList(criteria);

        for (Board article : boardList){
            long regTime = article.getRegDate().getTime();
            long now = System.currentTimeMillis();

            if (now - regTime < 60 * 3 * 1000) {
                article.setNewBoard(true);
            }
        }

//        return boardMapper.boardList(criteria);
        return boardList;
    }

    //게시글 등록
    public void create(Board board) {
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
