package com.nuriggiri.nuriggiri.interceptor;

import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class FriendListInterceptor implements HandlerInterceptor {
    @Autowired
    private FriendService friendService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        if (request.getSession().getAttribute("loginUser") != null) {
            Map<String, List<FriendList>> stringListMap = friendService.friendMapSes(request);
            HttpSession session = request.getSession();
            if (request.getSession().getAttribute("loginUser") != null) {
                session.setAttribute("friendListMap", stringListMap);
            }
        }
        return true;
    }
}
