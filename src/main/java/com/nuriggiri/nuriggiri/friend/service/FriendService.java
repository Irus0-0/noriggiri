package com.nuriggiri.nuriggiri.friend.service;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.domain.Relation;
import com.nuriggiri.nuriggiri.friend.repository.FriendMapper;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class FriendService {

    private final FriendMapper friendMapper;

    //친구요청
    public void addFriend(int userNo, int targetNo) {

        if (checkRelation(targetNo, userNo) != null && checkRelation(targetNo, userNo) == Relation.REQUEST) {
            //만약 이미 친구요청이 있다면 친구수락으로
            System.out.println("친구 수락으로 변경");
            approveFriend(userNo, targetNo);
        } else if (checkRelation(userNo, targetNo) == Relation.REQUEST) {
            System.out.println("이미 요청 보내짐");
        } else {
            //아니라면 평범하게 친구요청
            System.out.println("친구 요청 보내기");
            friendMapper.addFriend(userNo, targetNo, Relation.REQUEST);
        }
    }

    //친구 거절, 친구요청 취소
    public void refuseFriend(int userNo, int targetNo) {
        if (checkRelation(userNo, targetNo) == Relation.REQUEST) {
            //내가 친구요청인 경우
            friendMapper.removeFriend(userNo, targetNo);
        } else {
            //내가 친구요청이 아닌 상대방이 친구요청인 경우
            friendMapper.removeFriend(targetNo, userNo);
        }
    }

    //친구목록
    public List<FriendList> friendList(int userNo, Relation relation) {
        //관계를 지정해줌으로써 내가 요청하고있는 리스트나 차단한 리스트 친구인 리스트 등을 불러 올 수 있다.
        return friendMapper.friendList(userNo, relation);
    }

    //친구삭제
    public void removeFriend(int user, int targetNo) {
        //양쪽모두 친구 삭제
        friendMapper.removeFriend(user, targetNo);
        friendMapper.removeFriend(targetNo, user);
    }

    //친구 승인
    public void approveFriend(int userNo, int targetNo) {
        //친구 요청한 쪽과 요청받은쪽 둘다 친구로 바꿔줌
        friendMapper.addFriend(userNo, targetNo, Relation.DUDE);
        friendMapper.updateFriend(targetNo, userNo, Relation.DUDE);
    }

    //친구 차단
    public void blockFriend(int userNo, int targetNo) {
        if (checkRelation(userNo, targetNo) != null) {
            //친구테이블에 관계가 있는경우 업데이트를 통해 블럭으로 수정
            friendMapper.updateFriend(userNo, targetNo, Relation.BLOCK);
        } else {
            //친구테이블에 관계가 없는경우 인설트를 통해 블럭을 주입
            friendMapper.addFriend(userNo, targetNo, Relation.BLOCK);
        }
    }

    //검증
    public Relation checkRelation(int userNo, int targetNo) {
        // 관계를 알아냄
        return friendMapper.checkRelation(userNo, targetNo);
    }

}
