//package com.nuriggiri.nuriggiri.channelJoinUser.service;
//
//import com.nuriggiri.nuriggiri.channelJoinUser.domain.ChannelJoinUser;
//import com.nuriggiri.nuriggiri.channelJoinUser.repository.ChannelJoinUserMapper;
//import com.nuriggiri.nuriggiri.user.domain.User;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//
//@Service
//@RequiredArgsConstructor
//public class ChannelJoinUserService {
//
//    public final ChannelJoinUserMapper channelJoinUserMapper;
//
//
//    // 채널 접속
//    public void joinCh(ChannelJoinUser channelJoinUser) throws Exception {
//        channelJoinUserMapper.joinCh(channelJoinUser);
//    }
//
//    // 채널 나가기
//    public void exitCh(int joinSeqNo) {
//        channelJoinUserMapper.exitCh(joinSeqNo);
//    }
//
//}
