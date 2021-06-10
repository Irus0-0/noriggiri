package com.nuriggiri.nuriggiri.friend.controller;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.domain.Relation;
import com.nuriggiri.nuriggiri.friend.service.FriendService;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class FriendController {

    private final FriendService friendService;

    //로그인한 유저의 친구목록 가져오기
    @GetMapping("/friendList")
    public String friendList(HttpServletRequest request, Model model) {
        //로그인한 세션의 유저번호를 받아옴
        int userNo = ((User) request.getSession().getAttribute("loginUser")).getUserNo();

        //받아온 유저번호와 친구임을 확인하기위한 관계를 넣어줌
        List<FriendList> attributeValue = friendService.friendList(userNo, Relation.DUDE);
        log.info(attributeValue);
        //모델로 전달
        model.addAttribute("friendList", attributeValue);

        return "/friend/friendList";

    }

    //친구요청
    @PostMapping("/1231244214421")
    @ResponseBody
    public ResponseEntity<String> addFriend(Friend friend) {
        friendService.addFriend(friend);
        return null;
    }





}
