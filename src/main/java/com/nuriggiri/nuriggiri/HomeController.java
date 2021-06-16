package com.nuriggiri.nuriggiri;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "/user/signIn";
    }
    @GetMapping("/member/sign-in")
    public String signIn() {
        return "/user/signIn";
    }

}
