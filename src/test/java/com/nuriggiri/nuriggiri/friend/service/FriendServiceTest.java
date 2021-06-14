package com.nuriggiri.nuriggiri.friend.service;

import com.nuriggiri.nuriggiri.friend.domain.Relation;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FriendServiceTest {
    
    private FriendService friendService;
    
    @Test
    @DisplayName("관계 여부를 파악할 수 있어야 한다 ") 
    void releTest() {
        Relation relation = (Relation) friendService.checkRelation(1, 3);
        System.out.println("relation = " + relation);
    }

}