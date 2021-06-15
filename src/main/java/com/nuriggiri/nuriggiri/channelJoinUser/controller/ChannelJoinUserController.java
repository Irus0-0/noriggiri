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

    @GetMapping("/joinCh/{channelNo}")
    public String joinCh(HttpSession session, @PathVariable int channelNo) {
        log.info("chNo" + channelNo);

        int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
        channelJoinUserService.joinCh(userNo, channelNo);

        return "redirect:/channel/viewCh/"+channelNo;
    }

}
