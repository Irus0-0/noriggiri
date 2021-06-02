package com.nuriggiri.nuriggiri.user.api;

import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/sign")
@Log4j2
@RequiredArgsConstructor
public class SignApiController {

    private final UserService userService;


    //회원가입 페이지
    @GetMapping("/up")
    public String signUp() {
        return "user/signUp";
    }

    //회원가입 전송
    @PostMapping("/up")
    public String signUp(User user) {
        userService.signUp(user);
        log.info(user);
        return "redirect:/sign/up";
    }

    @GetMapping("/up/idCheck")
    @ResponseBody
    public ResponseEntity<Boolean> idCheck(String userId) {
        log.info("/idCheck GET 비동기 요청" + userId);
        boolean flag = userService.searchUserId(userId);
        return new ResponseEntity<>(flag, HttpStatus.OK);
    }

    @GetMapping("/up/nickCheck")
    @ResponseBody
    public ResponseEntity<Boolean> nickCheck(String nickName) {
        log.info("/nickName GET 비동기 요청" + nickName);
        boolean flag = userService.searchUserId(nickName);
        return new ResponseEntity<>(flag, HttpStatus.OK);
    }


}
