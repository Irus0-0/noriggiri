package com.nuriggiri.nuriggiri.channel.service;

import com.nuriggiri.nuriggiri.channel.domain.Channel;
import com.nuriggiri.nuriggiri.channel.repository.ChannelMapper;
import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChannelService {

    public final ChannelMapper channelMapper;

    //채널 목록 가져오기
    List<Channel> viewList(){
        return channelMapper.viewList();
    }

    //채널 생성
    void create(Channel channel) {
        channelMapper.create(channel);
    }

    //채널 접속
    void join(int channelNo, String channelPw, User userNo){

    }

    //채널 정보 보기
    Channel viewInfo(int channelNo){
        return channelMapper.viewInfo(channelNo);
    }

    //채널 수정
    void update(Channel channel){
        channelMapper.update(channel);
    }

    //채널 삭제
    void delete(int channelNo){
        channelMapper.delete(channelNo);
    }

}
