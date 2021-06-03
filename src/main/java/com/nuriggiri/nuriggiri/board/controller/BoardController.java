package com.nuriggiri.nuriggiri.board.controller;

import com.nuriggiri.nuriggiri.board.domain.Board;
import com.nuriggiri.nuriggiri.board.paging.Criteria;
import com.nuriggiri.nuriggiri.board.domain.ModifyBoard;
import com.nuriggiri.nuriggiri.board.paging.PageMaker;
import com.nuriggiri.nuriggiri.board.service.BoardService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@Log4j2
@CrossOrigin
//@RequestMapping("/") 나중에 jsp 파일 생성시 추가
public class BoardController {
    //서비스 파일과 연결
    public final BoardService boardService ;

    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    //글 목록 요청
    @GetMapping("/board/board-list")
    public String list( Model model, Criteria criteria) {
        List<Board> list = boardService.boardList(criteria);
        model.addAttribute("list", boardService.boardList(criteria));
        model.addAttribute("pageMaker", new PageMaker(criteria, boardService.boardList(c)));
        return "board/board-list";
    }

    //게시글 등록 화면 요청
    @GetMapping("/write")
    public String write() {
        return "/write"; //jsp 경로 입력
    }

    //게시글 등록 처리 요청
    @PostMapping("/write")
    public String write(Board board) {
        log.info("board: " + board);
        try {
            boardService.create(board);
        } catch (Exception e) {
            return "/write"; //jsp 경로 입력
        }
        return "redirect:"; // 리다이렉트 경로 입력
    }

    //게시글 상세보기 요청
    @GetMapping("/content")
    public String content(int boardNo, Model model) {
        Board content = boardService.more(boardNo);
        model.addAttribute("board", content);
        return "/content"; //jsp 경로 입력
    }

    //게시글 수정하기 화면요청
    @GetMapping("/modify")
    public String modify(int boardNo, Model model) {
        model.addAttribute("board", boardService.more(boardNo));
        return "modify";
    }

    //게시글 수정 처리요청
    @PostMapping("/modify")
    public String modify(ModifyBoard modifyBoard) {
        // 원본데이터를 찾아서 수정데이터로 변경하는 로직(서비스에 넣어주는게 좋다)
        Board board = boardService.more(modifyBoard.getBoardNo());
        board.setTitle(modifyBoard.getTitle());
        board.setContent(modifyBoard.getContent());
        try {
            boardService.rewrite(board);
        } catch (Exception e) {
            return "redirect:/modify?restaurantNum=" + modifyBoard.getBoardNo(); //modify 전에 경로 사입
        }
        return "redirect:/content?restaurantNum=" + modifyBoard.getBoardNo(); //content 전에 경로 사입
    }

    //게시글 삭제 요청
    @GetMapping("/delete")
    public String delete(int boardNo) {
        boardService.remove(boardNo);
        return "redirect:"; // 리다이렉트 경로 입력
    }
}
