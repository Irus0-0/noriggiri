package com.nuriggiri.nuriggiri.channel.repository;

import com.nuriggiri.nuriggiri.channel.domain.Channel;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ChannelMapperTest {

    @Autowired
    private ChannelMapper mapper;

    @Test
    void viewList() {
        List<Channel> channelList = mapper.viewList();
        System.out.println(channelList);
        System.out.println("================================================================");
        for (Channel channel : channelList) {
            System.out.println(channel);
            System.out.println("================================================================");
        }
    }

    @Test
    void create() {
        Channel channel = new Channel();
        channel.setChannelName("test-ch4");
        channel.setChannelInfo("테스트 채널 4");
        channel.setAdminUserNo(4);
        channel.setChannelPw("1234");

        mapper.create(channel);
    }


    @Test
    void viewInfo() {
        Channel channel;
        channel = mapper.viewInfo(1);
        System.out.println(channel);
        System.out.println("================================================");
    }


    @Test
    void update() {
        Channel channel = new Channel();
        channel.setChannelName("test-ch3");
        channel.setChannelInfo("변경변경변경 블라블라블라~~~~~");
        channel.setChannelPw("1234");
        channel.setChannelNo(3);
        mapper.update(channel);
    }


    @Test
    void delete() {
        mapper.delete(4);
    }

}