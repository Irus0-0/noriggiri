package com.nuriggiri.nuriggiri.board.paging;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Criteria {

    private int page; //페이지 넘버
    private int amount; //한 페이지당 게시물 수

    private String type; //검색 조건
    private String keyword; //검색어

    public Criteria() {
        this(1,10);
    }

    public Criteria(int page, int amount) {
        this.page = page;
        this.amount = amount;
    }

    // 파라미터 조작 방지용 setter
    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setAmount(int amount) {
        if (amount <= 0 || amount > 100) {
            this.amount = 10;
            return;
        }
        this.amount = amount;
    }
}
