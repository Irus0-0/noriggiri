package com.nuriggiri.nuriggiri.channel.service;

import com.nuriggiri.nuriggiri.board.paging.Criteria;
import com.nuriggiri.nuriggiri.channel.domain.Channel;
import com.nuriggiri.nuriggiri.channel.repository.ChannelMapper;
import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ChannelService {

    public final ChannelMapper channelMapper;

    //채널 목록 가져오기
    public List<Channel> viewList() {
        return channelMapper.viewList();
    }

    // 채널 리스트 세션 등록
    public void chSecList(HttpSession session) {

        session.setAttribute("adminList", adminList(session));
        session.setAttribute("partiList", partiList(session));

    }

    //내가 관리자인 채널 리스트
    public List<Channel> adminList(HttpSession session) {
        int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
        return channelMapper.adminList(userNo);
    }

    //내가 참여중인 채널 리스트
    public List<Channel> partiList(HttpSession session) {
        int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
        return channelMapper.partiList(userNo);
    }

    // 검색 쿼리 추가 목록
    public List<Channel> viewList(Criteria criteria) {
        return channelMapper.getSearchArticles(criteria);
    }

    // 총 채널 수 조회
    public int getTotal(Criteria criteria) {
        return channelMapper.getTotalCount(criteria);
    }


    //채널 생성
    public void create(Channel channel) throws Exception {
        channelMapper.create(channel);
    }

    //채널 정보 보기
    public Channel viewInfo(int channelNo) {
        return channelMapper.viewInfo(channelNo);
    }

    //채널 수정
    public void update(Channel channel) throws Exception {
        channelMapper.update(channel);
    }

    //채널 삭제
    public void delete(int channelNo) {
        channelMapper.delete(channelNo);
    }

}
