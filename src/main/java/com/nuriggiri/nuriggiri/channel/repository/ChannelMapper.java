package com.nuriggiri.nuriggiri.channel.repository;

import com.nuriggiri.nuriggiri.board.paging.Criteria;
import com.nuriggiri.nuriggiri.channel.domain.Channel;
import com.nuriggiri.nuriggiri.user.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ChannelMapper {

    //채널 목록 가져오기
    List<Channel> viewList();

    //내가 관리자인 채널 리스트
    List<Channel> adminList(int userNo);

    //내가 참여중인 채널 리스트
    List<Channel> partiList(int userNo);


    //검색 쿼리 추가 목록
    List<Channel> getSearchArticles(Criteria criteria);

    // 총 채널 수 조회
    int getTotalCount(Criteria criteria);

    //채널 생성
    void create(Channel channel);

    //채널 정보 보기
    Channel viewInfo(int channelNo);

    //채널 수정
    void update(Channel channel);

    //채널 삭제
    void delete(int channelNo);


    //채널 접속 하기
    void join(int channelNo, String channelPw, User userNo);

    //채널 접속 해제
    void exit(int channelNo, User userNo);


}
