package com.nuriggiri.nuriggiri.interceptor;

import com.nuriggiri.nuriggiri.channel.service.ChannelService;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.service.FriendService;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.repository.UserMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Configuration
@Log4j2
public class AutoLoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private FriendService friendService;

    @Autowired
    private ChannelService channelService;


    //자동로그인
    private boolean loginFlag = false;

    //사이트 방분하는 동시에 자동로그인 쿠키를 검사하기 위함
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        HttpSession session = request.getSession();


        //자동로그인 쿠키가 있는경우

        if (!loginFlag) {
            if (loginCookie != null) {
                String value = loginCookie.getValue();
                User user = userMapper.sessionSearchUser(value);

                if (user != null) {
                    //DB에 쿠키에 있는 세션 ID 로 검색해서 검색결과가 있는 경우
                    //세션에 유저정보 저장
                    session.setAttribute("loginUser", user);
                    Map<String, List<FriendList>> stringListMap = friendService.friendMapSes(request);
                    session.setAttribute("friendListMap", stringListMap);
                    loginFlag = true;
                }
            if (user != null) {
                //DB에 쿠키에 있는 세션 ID 로 검색해서 검색결과가 있는 경우
                //세션에 유저정보 저장
                request.getSession().setAttribute("loginUser", user);

                // 친구
                int userNo = ((User) request.getSession().getAttribute("loginUser")).getUserNo();
                Map<String, List<FriendList>> stringListMap = friendService.friendAllMap(userNo);
                request.getSession().setAttribute("friendListMap", stringListMap);

                // 채널목록
                channelService.chSecList(request.getSession());

            }
        }

        return true;
    }
}
