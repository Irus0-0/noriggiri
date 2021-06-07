package com.nuriggiri.nuriggiri.channel.repository;

import com.nuriggiri.nuriggiri.channel.domain.Channel;
import com.nuriggiri.nuriggiri.user.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ChannelMapper {

    //채널 목록 가져오기
    List<Channel> viewList();

    //채널 생성
    void create(Channel channel);

    //채널 접속
    void join(int channelNo, String channelPw, User userNo);

    //채널 정보 보기
    Channel viewInfo(int channelNo);

    //채널 수정
    void update(Channel channel);

    //채널 삭제
    void delete(int channelNo);




}
