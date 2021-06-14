package com.nuriggiri.nuriggiri.friend.repository;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.domain.Relation;
import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FriendMapper {

    //친구 요청
    int addFriend(int userNo, int targetNo, Relation relationship);

    //친구 목록
    List<FriendList> friendList(int userNo, Relation relationship);

    //친구 삭제 , 요청삭제
    void removeFriend(int userNo, int targetNo);

    //친구 update
    void updateFriend(int userNo, int targetNo, Relation relationship);


    // 요청 검증   관계가 어떤것이 되어있는지 확인
    FriendList checkRelation(int userNo, int targetNo);
}
