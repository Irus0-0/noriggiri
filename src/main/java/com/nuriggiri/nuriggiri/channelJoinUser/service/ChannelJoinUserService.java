package com.nuriggiri.nuriggiri.channelJoinUser.service;

import com.nuriggiri.nuriggiri.channelJoinUser.domain.ChannelJoinUser;
import com.nuriggiri.nuriggiri.channelJoinUser.repository.ChannelJoinUserMapper;
import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class ChannelJoinUserService {

    public final ChannelJoinUserMapper channelJoinUserMapper;


    // 정보 보기 (한명의 유저)
    public boolean joinList(HttpSession session, int channelNo) {
        int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
        int jl = channelJoinUserMapper.joinList(userNo, channelNo);
        return jl > 0 ? true : false;
    }

    // 채널 접속
    public void joinCh(int userNo, int channelNo){
        channelJoinUserMapper.joinCh(userNo, channelNo);
    }

    // 채널 나가기
    public void exitCh(int userNo, int channelNo) {
        channelJoinUserMapper.exitCh(userNo, channelNo);
    }

}
