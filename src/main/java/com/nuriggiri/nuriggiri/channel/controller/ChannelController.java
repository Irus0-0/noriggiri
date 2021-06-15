package com.nuriggiri.nuriggiri.channel.controller;

import com.nuriggiri.nuriggiri.board.paging.Criteria;
import com.nuriggiri.nuriggiri.board.paging.PageMaker;
import com.nuriggiri.nuriggiri.board.service.BoardService;
import com.nuriggiri.nuriggiri.channel.domain.Channel;
import com.nuriggiri.nuriggiri.channel.domain.ModifyChannel;
import com.nuriggiri.nuriggiri.channel.service.ChannelService;
import com.nuriggiri.nuriggiri.user.domain.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
//@CrossOrigin
@RequestMapping("/channel")
public class ChannelController {

    //서비스 파일과 연결
    public final ChannelService channelService;
    @Autowired
    public ChannelController(ChannelService channelService) {
        this.channelService = channelService;
    }

    //채널 목록 가져오기
    @GetMapping(value = {"/chList", "/chMain"})
    public String viewList(Criteria criteria, Model model, HttpSession session) {
        List<Channel> channelList = channelService.viewList();
        model.addAttribute("list", channelList);

//        model.addAttribute("articles", channelService.viewList(criteria));
        // 페이지 정보를 만들어서 jsp 에게 보내기
        model.addAttribute("pageMaker", new PageMaker(criteria, channelService.getTotal(criteria)));

        session.setAttribute("chList", channelList);
        return "/channel/chMain";
    }

    //채널 생성 화면 요청
    @GetMapping("/addCh")
    public String create(Model model) {
        List<Channel> channelList = channelService.viewList();
        model.addAttribute("list", channelList);

        return "/channel/addCh";
    }

    //채널 생성 처리 요청
    @PostMapping("/addCh")
    public String create(Channel channel) {
        try {
//            log.info("channel: " + channel);
            channelService.create(channel);
        } catch (Exception e) {
            return "/channel/addCh";
        }
        return "redirect:/channel/chList";
    }

    //채널 정보 상세보기 요청
    @GetMapping("/viewCh")
    public String viewInfo(int channelNo, Model model) {
        Channel content = channelService.viewInfo(channelNo);
        model.addAttribute("channel", content);
        List<Channel> channelList = channelService.viewList();
        model.addAttribute("list", channelList);
//        log.info("channel info: " + content);
        return "/channel/viewCh";
    }

    //채널 수정 화면 요청
    @GetMapping("/modCh")
    public String update(int channelNo, Model model) {
        model.addAttribute("channel", channelService.viewInfo(channelNo));

        List<Channel> channelList = channelService.viewList();
        model.addAttribute("list", channelList);
        return "/channel/modCh";
    }

    //채널 수정 처리 요청
    @PostMapping("/modCh")
    public String update(ModifyChannel modifyChannel) {
        // 원본데이터를 찾아서 수정데이터로 변경하는 로직(서비스에 넣어주는게 좋다)
        Channel channel = channelService.viewInfo(modifyChannel.getChannelNo());
        channel.setChannelName(modifyChannel.getChannelName());
        channel.setChannelInfo(modifyChannel.getChannelInfo());
        channel.setChannelPw(modifyChannel.getChannelPw());

        log.info(channel);
        try {
            channelService.update(channel);
        } catch (Exception e) {
            return "redirect:/channel/modCh?channelNo=" + modifyChannel.getChannelNo();
        }
        return "redirect:/channel/viewCh?channelNo=" + modifyChannel.getChannelNo();
    }

    //채널 삭제 요청
    @GetMapping("/delete")
    public String delete(int channelNo) {
        channelService.delete(channelNo);
        return "redirect:/channel/chMain";
    }


    //채널 접속 하기
    //void join(int channelNo, String channelPw, User userNo);

    //채널 접속 해제
    //void exit(int channelNo, User userNo);













}
