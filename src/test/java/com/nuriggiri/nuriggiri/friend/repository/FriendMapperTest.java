package com.nuriggiri.nuriggiri.friend.repository;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.Relation;

import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class FriendMapperTest {

    @Autowired
    FriendMapper friendMapper;
    
    @Test
    void insertTest() {
        Friend friend = new Friend();
        friend.setUserNo(1);
        friend.setTargetNo(6);
        friend.setRelationship(Relation.DUDE);
        System.out.println(friend);

        friendMapper.addFriend(friend);
    }

    @Test
    void listTest() {
        int userNo = 1;
        List<UserNonSq> friendList = friendMapper.friendList(userNo, "DUDE");
        System.out.println("++++++++++++++++++++++++");
        for (UserNonSq userNonSq : friendList) {
            System.out.println("userNonSq = " + userNonSq);
        }
        System.out.println("++++++++++++++++++++++++");



    }

}