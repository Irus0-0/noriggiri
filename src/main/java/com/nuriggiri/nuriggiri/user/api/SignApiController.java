package com.nuriggiri.nuriggiri.user.api;

import com.nuriggiri.nuriggiri.channel.service.ChannelService;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.service.FriendService;
import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import com.nuriggiri.nuriggiri.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sign")
@Log4j2
@RequiredArgsConstructor

public class SignApiController {

    private final UserService userService;

    private final FriendService friendService;

    private final ChannelService channelService;

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
        return "redirect:/sign/in";
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
        log.info("input 유저" + inputUser);
        //로그인
        String loginMessage = userService.login(inputUser);
        model.addAttribute("result", loginMessage);
        User userInfo = userService.userInfo(inputUser.getUserId());

        if (loginMessage.equals("success")) {
            //로그인 성공할 경우
            request.getSession().setAttribute("loginUser", userInfo);
            //친구
            Map<String, List<FriendList>> stringListMap = friendService.friendMapSes(request);
            request.getSession().setAttribute("loginUser", userService.userInfo(inputUser.getUserId()));
            //채널목록
            channelService.chSecList(request.getSession());

            log.info(loginMessage);
            log.info(request.getSession().getAttribute("loginUser"));
            if (inputUser.isAutoLogin()) {
                log.info("자동 로그인 실행중");
                userService.keepLogin(request, response, inputUser.getUserId());
                return "redirect:/channel/chList";
            }
            return "redirect:/channel/chList";
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
            httpSession.removeAttribute("friendListMap");
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                //쿠키의 목숨을 죽여서 다시 전송 함으로써 로컬에 저장된 쿠키를 제거
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                userService.logout(loginUser.getUserId());
            }
            return "redirect:/sign/in";
        }
        return "redirect:/sign/in";
    }

    //유저 정보조회
    @GetMapping("/detail")
    public String userInfo(HttpServletRequest request, Model model) {
        //로그인한 사람의 회원 정보 조회
        if (request.getSession().getAttribute("loginUser") != null) {
            String userId = ((UserNonSq) request.getSession().getAttribute("loginUser")).getUserId();
            User user = userService.userInfo(userId);
            model.addAttribute("userInfo", user);
            log.info("세션에서 받아온 ID :" + userId);
            log.info("유저정보 확인 " + user);
            return "/user/info";
        } else {
            return "redirect:/sign/in";
        }
    }

    //회원탈퇴
    @GetMapping("/delete")
    public String delete(HttpServletRequest request) {
        int userNo = ((User) request.getSession().getAttribute("loginUser")).getUserNo();

        userService.deleteUser(userNo);

        //삭제후 세션지우기
        request.getSession().removeAttribute("loginUser");
        request.getSession().removeAttribute("friendListMap");
        request.getSession().invalidate();
        return "redirect:/sign/in";
    }

    //비밀번호 찾기 페이지
    @GetMapping("/pwSearch")
    public String pwSearch() {
        return "/user/pwSearch";
    }

    //비밀번호 찾기 아이디 닉네임 전송
    @PostMapping("/pwSearch")
    public String pwSearch(LoginUser user) {
        User userdata = userService.userInfo(user.getUserId());

        boolean equals = userdata.getNickName().equals(user.getNickName());
        log.info(equals);
        // 이메일이나 다른걸 전송해서 비밀번호 변경페이지가 나오게 하고 변경이 가능하게 바꿔줘야함
        //현재 구현정도는 입력된 아디이와 닉네임을 검증하는 것 까지 진행함 추후 더 좋은 보안으로 변경할 필요성이 있음
        //아예 본인 이메일만 입력받아서 메일서버를 활용하여 변경 링크 전송도 가능
        //메일 보내는 방법 체크 해야함
        return "redirect:/";
    }

    //유저 정보찾기 닉네임
    @GetMapping
    @ResponseBody
    public ResponseEntity<String> userSearch(String nickName) {
        userService.userInfoNick(nickName);
        return null;
    }


}
