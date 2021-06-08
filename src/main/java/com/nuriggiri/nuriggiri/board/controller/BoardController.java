package com.nuriggiri.nuriggiri.board.controller;

import com.nuriggiri.nuriggiri.board.controller.paging.Criteria;
import com.nuriggiri.nuriggiri.board.controller.paging.PageMaker;
import com.nuriggiri.nuriggiri.board.domain.Board;
import com.nuriggiri.nuriggiri.board.domain.ModifyBoard;
import com.nuriggiri.nuriggiri.board.service.BoardService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
@CrossOrigin
//@RequestMapping("/board")

public class BoardController {
    //서비스 파일과 연결
    public final BoardService boardService ;

    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    //글 목록 요청
    @GetMapping("/board/list")
    public String list( Model model, Criteria criteria) {
        List<Board> boardList = boardService.boardList(criteria);
        model.addAttribute("articles", boardService.boardList(criteria));
        model.addAttribute("pageMaker", new PageMaker(criteria, boardService.getTotal()));
        return "/board/list";
    }

    //게시글 등록 화면 요청
    @GetMapping("/board/write")
    public String write() {
        return "/board/write"; //jsp 경로 입력
    }

    //게시글 등록 처리 요청
    @PostMapping("board/write")
    public String write(Board board) {
        log.info("board: " + board);
        try {
            boardService.create(board);
        } catch (Exception e) {
            return "board/write"; //jsp 경로 입력
        }
        return "redirect:/board/list"; // 리다이렉트 경로 입력
    }

    //게시글 상세보기 요청
    @GetMapping("/board/content")
    public String content(int boardNo, Criteria criteria, Model model) {
        Board content = boardService.more(boardNo);
        model.addAttribute("article", content);

        return "/board/content"; //jsp 경로 입력
    }

    //게시글 수정하기 화면요청
    @GetMapping("/board/modify")
    public String modify(int boardNo
            , Model model, HttpSession session) {
        model.addAttribute("article", boardService.more(boardNo));
        return "board/modify";
    }

    //게시글 수정 처리요청
    @PostMapping("/board/modify")
    public String modify(ModifyBoard modArticle) {

        Board board = boardService.more(modArticle.getBoardNo());
        board.setTitle(modArticle.getTitle());
        board.setContent(modArticle.getContent());
        try {
            boardService.rewrite(board);
        } catch (Exception e) {
            return "redirect:/modify?restaurantNum=" + modArticle.getBoardNo(); //modify 전에 경로 사입
        }
        return "redirect:/content?restaurantNum=" + modArticle.getBoardNo(); //content 전에 경로 사입
    }

    //게시글 삭제 요청
    @GetMapping("/delete")
    public String delete(int boardNo) {
        boardService.remove(boardNo);
        return "redirect:"; // 리다이렉트 경로 입력
    }
}
