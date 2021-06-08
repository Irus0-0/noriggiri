CREATE TABLE nuri_friend(
    user_no NUMBER(10), --유저번호 PK FK
    target_no NUMBER(10), -- 친구 타겟 유저번호 FK - 유저번호
    relationship VARCHAR2(20), --친구 관계

    CONSTRAINT pk_nuri_friend PRIMARY KEY (user_no)
);