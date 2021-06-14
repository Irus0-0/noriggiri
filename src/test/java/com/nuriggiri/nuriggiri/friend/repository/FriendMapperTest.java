package com.nuriggiri.nuriggiri.friend.repository;

import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.domain.Relation;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class FriendMapperTest {

    @Autowired
    FriendMapper friendMapper;
    
//    @Test
//    void insertTest() {
//        Friend friend = new Friend();
//        friend.setUserNo(3);
//        friend.setTargetNo(1);
//        friend.setRelationship(Relation.DUDE);
//        System.out.println(friend);
//
//        friendMapper.addFriend(friend);
//    }

    @Test
    void listTest() {
        int userNo = 1;
        List<FriendList> friendList = friendMapper.friendList(userNo, Relation.DUDE);
        System.out.println("++++++++++++++++++++++++");
        for (FriendList userNonSq : friendList) {
            System.out.println("userNonSq = " + userNonSq);
        }
        System.out.println("++++++++++++++++++++++++");

    }

    @Test
    void checkTest() {
        FriendList s = null;
        try {
            s = friendMapper.checkRelation(1, 3);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("s = " + s);
        Relation relationship = s.getRelationship();
        System.out.println("relationship = " + relationship);


    }

}