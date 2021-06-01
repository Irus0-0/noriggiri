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
    public String signIn() {
        return "user/signUp";
    }


    @PostMapping("/up/{userId}")
    @ResponseBody
    public ResponseEntity<String> idCheck(
            @PathVariable("userId") String userId
    ) {
        boolean checkData = userService.searchUserId(userId);
        log.info(checkData);
        return checkData ? new ResponseEntity<>("중복없음", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
