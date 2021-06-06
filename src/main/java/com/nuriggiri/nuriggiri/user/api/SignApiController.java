package com.nuriggiri.nuriggiri.user.api;

import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

    //아이디 중복 체크
    @GetMapping("/up/idCheck")
    @ResponseBody
    public ResponseEntity<Boolean> idCheck(String userId) {
        log.info("/idCheck GET 비동기 요청" + userId);
        boolean flag = userService.searchUserId(userId);
        return new ResponseEntity<>(flag, HttpStatus.OK);
    }

    //닉네임 중복 체크
    @GetMapping("/up/nickCheck")
    @ResponseBody
    public ResponseEntity<Boolean> nickCheck(String nickName) {
        log.info("/nickName GET 비동기 요청 " + nickName);
        boolean text = userService.searchUserNickName(nickName);
        return new ResponseEntity<>(text, HttpStatus.OK);
    }

    //로그인 페이지
    @GetMapping("/in")
    public String signIn() {
        return "/user/signIn";
    }

    //로그인
    @PostMapping("/in")
    public String signIn(LoginUser inputUser, HttpServletRequest request, Model model, HttpServletResponse response) {
        log.info("input 유저"+inputUser);
        //로그인
        String loginMessage = userService.login(inputUser);
        model.addAttribute("result" ,loginMessage);
        if (loginMessage.equals("success")) {
            //로그인 성공할 경우
            request.getSession().setAttribute("loginUser", userService.userInfo(inputUser.getUserId()));
            log.info(loginMessage);
            log.info(request.getSession().getAttribute("loginUser"));
            if(inputUser.isAutoLogin()) {
                log.info("자동 로그인 실행중");
                userService.keepLogin(request,response,inputUser.getUserId());
                return "redirect:/board/board-list";
            }
            return "redirect:/";
        }
        //로그인 실패할 경우
        return "/user/login-result";
    }

    //로그아웃
    @GetMapping("/out")
    public String logout(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) {
        log.info("로그아웃");

        User loginUser = (User) httpSession.getAttribute("loginUser");
        if (loginUser != null) {
            //로그인 한 유저들의 세션을 지운다
            httpSession.removeAttribute("loginUser");
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if(loginCookie != null) {
                //쿠키의 목숨을 죽여서 다시 전송 함으로써 로컬에 저장된 쿠키를 제거
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                userService.logout(loginUser.getUserId());
            }
            return "redirect:/";
        }
        return "redirect:/sign/in";
    }

}
