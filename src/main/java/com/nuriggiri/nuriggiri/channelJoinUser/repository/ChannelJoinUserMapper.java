package com.nuriggiri.nuriggiri.channelJoinUser.repository;

import com.nuriggiri.nuriggiri.channelJoinUser.domain.ChannelJoinUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChannelJoinUserMapper {

    // 정보 보기 (한명의 유저)
    int joinList(int userNo, int channelNo);

    // 채널 접속
    void joinCh(int userNo, int channelNo);

    // 채널 나가기
    void exitCh(int userNo, int channelNo);

}
