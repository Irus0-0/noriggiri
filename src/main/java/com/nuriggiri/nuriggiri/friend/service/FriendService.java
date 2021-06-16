package com.nuriggiri.nuriggiri.friend.service;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.domain.FriendList;
import com.nuriggiri.nuriggiri.friend.domain.Relation;
import com.nuriggiri.nuriggiri.friend.repository.FriendMapper;
import com.nuriggiri.nuriggiri.user.domain.User;
import com.nuriggiri.nuriggiri.user.domain.UserNonSq;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class FriendService {

    private final FriendMapper friendMapper;

    //    친구요청
    public boolean addFriend(int userNo, int targetNo) {
        if (checkRelation(targetNo, userNo) != null && checkRelation(targetNo, userNo) == Relation.REQUEST) {
            //만약 이미 친구요청이 있다면 친구수락으로
            approveFriend(userNo, targetNo);
            return true;
        } else if (checkRelation(userNo, targetNo) != null
                && (checkRelation(userNo, targetNo) == Relation.REQUEST || checkRelation(userNo, targetNo) == Relation.DUDE)) {
            //이미 친구이거나 내가 보낸 친구요청이 있는 경우
            log.info("이미 친구거나 친구요청 있음 체크 요망");
            return false;
        } else {
            //아니라면 평범하게 친구요청
            log.info("친구 요청 보내기");
            friendMapper.addFriend(userNo, targetNo, Relation.REQUEST);
            return true;
        }
    }

    //친구 거절, 친구요청 취소
    public boolean refuseFriend(int userNo, int targetNo) {
        if (checkRelation(userNo, targetNo) == Relation.REQUEST) {
            //내가 친구요청인 경우
            friendMapper.removeFriend(userNo, targetNo);
        } else {
            //내가 친구요청이 아닌 상대방이 친구요청인 경우
            friendMapper.removeFriend(targetNo, userNo);
        }
        return true;
    }

    //친구목록
    public List<FriendList> friendList(int userNo, Relation relation) {
        //관계를 지정해줌으로써 내가 요청하고있는 리스트나 차단한 리스트 친구인 리스트 등을 불러 올 수 있다.
        return friendMapper.friendList(userNo, relation);
    }

    public List<FriendList> targetFriendList(int userNo, Relation relation) {
        return friendMapper.targetFriendList(userNo , relation);
    }

    //친구목록 (차단 , 내가보낸요청 , 친구, 나에게온 요청)
    public Map<String, List<FriendList>> friendAllMap(HttpServletRequest request,int userNo) {
        //친구 관계목록에 사용할 맵
        Map<String, List<FriendList>> stringListMap = new HashMap<>();
        //관계가 친구인 리스트
        stringListMap.put("DUDE", friendList(userNo, Relation.DUDE));
        //관계가 차단인 리스트
        stringListMap.put("BLOCK", friendList(userNo, Relation.BLOCK));
        //관계가 요청인 리스트
        stringListMap.put("REQUEST", friendList(userNo, Relation.REQUEST));
        //나한테 들어온 친구요청 리스트
        stringListMap.put("TARGET", targetFriendList(userNo, Relation.REQUEST));
        //저장된 리스트들을 세션에 저장
        request.getSession().setAttribute("friendListMap",stringListMap);
        return stringListMap;
    }

    public Map<String, List<FriendList>> friendMapSes(HttpServletRequest request) {
        int userNo = ((User) request.getSession().getAttribute("loginUser")).getUserNo();
        Map<String, List<FriendList>> stringListMap = friendAllMap(request, userNo);
        request.getSession().setAttribute("friendListMap",stringListMap);
        return stringListMap;
    }


    //친구삭제
    public boolean removeFriend(int user, int targetNo) {
        //양쪽모두 친구 삭제
        log.info("친구삭제 가동!");
        friendMapper.removeFriend(user, targetNo);
        friendMapper.removeFriend(targetNo, user);
        return true;
    }
    //친구 차단해제
    public boolean removeBlockFriend(int user, int targetNo) {
        //양쪽모두 친구 삭제
        log.info("친구삭제 가동!");
        friendMapper.removeFriend(user, targetNo);
        return true;
    }

    //친구 승인
    public boolean approveFriend(int userNo, int targetNo) {
        //친구 요청한 쪽과 요청받은쪽 둘다 친구로 바꿔줌
        friendMapper.addFriend(userNo, targetNo, Relation.DUDE);
        friendMapper.updateFriend(targetNo, userNo, Relation.DUDE);
        return true;
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
        FriendList friendList = friendMapper.checkRelation(userNo, targetNo);
        return friendList != null ? friendList.getRelationship() : null;
    }

}
