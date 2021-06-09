package com.nuriggiri.nuriggiri.friend.controller;

import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Log4j2
@RequiredArgsConstructor
public class FriendController {

    //로그인한 유저의 친구목록 가져오기
    @GetMapping("/friendList")
    public String friendList(LoginUser user) {
        return "/friend/friendList";
    }

    @PostMapping("/1231244214421")
    @ResponseBody
    public ResponseEntity<String> addFriend() {

        return null;
    }
}
