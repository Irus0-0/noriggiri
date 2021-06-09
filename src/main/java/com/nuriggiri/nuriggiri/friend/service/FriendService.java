package com.nuriggiri.nuriggiri.friend.service;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.Relation;
import com.nuriggiri.nuriggiri.friend.repository.FriendMapper;
import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FriendService {

    private final FriendMapper friendMapper;

    //친구요청
    public void addFriend(Friend friend) {
        friendMapper.addFriend(friend);
    }

    //친구목록
    public List<UserNonSq> friendList(int userNo, String relation) {

        return friendMapper.friendList(userNo, relation);
    }

    //친구삭제
    public void removeFriend(int user, int targetUser){

        friendMapper.removeFriend(user, targetUser);
    }

    //친구 차단


    //검증
    public Relation checkRelation(String user, String targetUser){
        return friendMapper.checkRelation(user,targetUser);
    }

}
