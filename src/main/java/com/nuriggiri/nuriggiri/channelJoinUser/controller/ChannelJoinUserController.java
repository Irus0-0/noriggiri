package com.nuriggiri.nuriggiri.channelJoinUser.controller;

import com.nuriggiri.nuriggiri.channelJoinUser.service.ChannelJoinUserService;
import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/channelJoinUser")
public class ChannelJoinUserController {

    private final ChannelJoinUserService channelJoinUserService;

    // 채널 접속
    @GetMapping("/joinCh/{channelNo}")
    public String joinCh(HttpSession session, @PathVariable int channelNo) {
        log.info("chNo" + channelNo);
        int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
        boolean bl = channelJoinUserService.joinList(session, channelNo);
        if (!bl) {
            channelJoinUserService.joinCh(userNo, channelNo);
        } else {
            return "redirect:/channel/viewCh/" + channelNo;
        }

        return "redirect:/channel/viewCh/" + channelNo;
    }


    // 채널 나가기
    @GetMapping("/exitCh/{channelNo}")
    public String exitCh(HttpSession session, @PathVariable int channelNo) {
        log.info(channelNo + "채널 exit 요청!");

        int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
        boolean bl = channelJoinUserService.joinList(session, channelNo);
        if (bl) {
            channelJoinUserService.exitCh(userNo, channelNo);
        } else {
            return "redirect:/channel/chMain";
        }
        return "redirect:/channel/chMain";
    }

}
