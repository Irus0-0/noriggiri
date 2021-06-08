package com.nuriggiri.nuriggiri.friend.repository;

import com.nuriggiri.nuriggiri.friend.domain.relation;
import com.nuriggiri.nuriggiri.user.domain.LoginUser;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FriendMapper {

    //친구 요청
    void addFriend(LoginUser user, LoginUser targetUser);

    //친구 목록
    List<UserNonSq> friendList(LoginUser user);

    //친구 삭제
    void removeFriend(LoginUser user, LoginUser targetUser);

    //친구 차단
    void blockFriend(LoginUser user, LoginUser targetUser);

    //친구 승인
    void approvalFriend(LoginUser user, LoginUser targetUser);

    // 요청 검증   관계가 어떤것이 되어있는지 확인
    relation checkRelation(LoginUser user, LoginUser targetUser);
}
