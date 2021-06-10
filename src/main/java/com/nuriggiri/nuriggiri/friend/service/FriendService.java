package com.nuriggiri.nuriggiri.friend.service;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.domain.Relation;
import com.nuriggiri.nuriggiri.friend.repository.FriendMapper;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
    public List<FriendList> friendList(int userNo, Relation relation) {

        return friendMapper.friendList(userNo, relation);
    }

    //친구삭제
    public void removeFriend(int user, int targetUser){
        friendMapper.removeFriend(user, targetUser);
    }



    //검증
    public Relation checkRelation(String user, String targetUser){
        return friendMapper.checkRelation(user,targetUser);
    }

}
