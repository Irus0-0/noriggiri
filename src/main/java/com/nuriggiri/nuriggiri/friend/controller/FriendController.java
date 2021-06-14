package com.nuriggiri.nuriggiri.friend.controller;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.domain.Relation;
import com.nuriggiri.nuriggiri.friend.service.FriendService;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

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
        log.info("컨트롤러 불러온 친구 데이터" + attributeValue);
        //모델로 전달
        model.addAttribute("friendList", attributeValue);

        return "/friend/friendList";

    }

    //    테스트
    @GetMapping("/friendListMap")
    @ResponseBody
    public ResponseEntity<Map<String, List<FriendList>>> getList(HttpServletRequest request) {
        int userNo = ((User) request.getSession().getAttribute("loginUser")).getUserNo();

        Map<String, List<FriendList>> stringListMap = friendService.friendAllMap(userNo);
        request.getSession().setAttribute("friendListMap", stringListMap);
        log.info("stringListMap" + stringListMap);
        return new ResponseEntity<>(stringListMap, HttpStatus.OK);
    }


    //친구요청
    @PostMapping("/friendList")
    @ResponseBody
    public ResponseEntity<String> addFriend(HttpServletRequest request, int targetNo) {
        int userNo = ((User) request.getSession().getAttribute("loginUser")).getUserNo();
        log.info("컨트롤러 친구 번호 : 타겟 번호" + userNo + ":" + targetNo);

        return friendService.addFriend(userNo, targetNo)
                ? new ResponseEntity<>("friendAddSuccess", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
