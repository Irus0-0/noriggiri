package com.nuriggiri.nuriggiri.miniGame.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/ladder")
@RequiredArgsConstructor
public class MiniGameController {

    //사다리게임
    @GetMapping("/ladder")
    public String miniGame() {
        log.info("minigame click");
        return "/ladder/ladderGame";
    }

}
