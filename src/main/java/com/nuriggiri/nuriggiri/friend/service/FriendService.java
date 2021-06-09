package com.nuriggiri.nuriggiri.friend.service;

import com.nuriggiri.nuriggiri.friend.domain.Friend;
import com.nuriggiri.nuriggiri.friend.repository.FriendMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

@Service
@RequiredArgsConstructor
public class FriendService {

    private final FriendMapper friendMapper;

    //친구요청
    public void addFriend(Friend friend) {
        friendMapper.addFriend(friend);
    }


}
