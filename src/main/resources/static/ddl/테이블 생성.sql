CREATE SEQUENCE SEQ_nori__USER;

CREATE TABLE nori_user(
    user_no NUMBER(10), --유저번호
    user_id VARCHAR2(10)NOT NULL, --유저아이디
    user_pw VARCHAR2(10)NOT NULL, --유저비밀번호
    nick_name VARCHAR2(10)NOT NULL, --닉네임
    since DATE DEFAULT sysdate NOT NULL, --가입일

    CONSTRAINT pk_nori_user PRIMARY KEY (user_no)
);

CREATE SEQUENCE SEQ_nori_CHANNEL;

CREATE TABLE nori_channel(
    channel_no NUMBER(10), --채널번호
    channel_name VARCHAR2(20) NOT NULL, --채널이름
    channel_info VARCHAR2(100), --채널 설명
    admin_user_no NUMBER(10) NOT NULL, --관리자 유저 번호
    channel_pw VARCHAR2(20), --채널 접속시 필요한 패스워드
    creation_date DATE DEFAULT SYSDATE NOT NULL, --채널 생성일


    CONSTRAINT pk_nori_channel PRIMARY KEY (channel_no)
);

CREATE TABLE nori_channel_join_user (
    channel_no NUMBER(10), --채널번호
    user_no NUMBER(10), --유저번호

    CONSTRAINT pk_nori_channel_join_user PRIMARY KEY ( channel_no)
);
 -- ALTER TABLE channel_join_user ADD CONSTRAINT fk_channel_join_user FOREIGN KEY (channel_no) REFERENCES channel (channel_no)


CREATE SEQUENCE SEQ_nori_BOARD;

CREATE TABLE nori_board (
    board_no NUMBER(10), --글번호 PK
    channel_no NUMBER(10), --채널번호 FK
    writer VARCHAR2(20) NOT NULL, --작성자
    title VARCHAR2(30) NOT NULL, --제목
    content VARCHAR2(2000), --글내용
    recommend NUMBER(10) DEFAULT 0 NOT NULL, --추천 수
    leg_date DATE DEFAULT SYSDATE NOT NULL,  --작성날짜
    notice VARCHAR2(10) DEFAULT 'FALSE' NOT NULL,  --공지글 구분

    CONSTRAINT pk_nori_board PRIMARY KEY (board_no)
);

CREATE TABLE nori_recommend_list(
    board_no NUMBER(10) NOT NULL, --본문번호 FK PK
    user_no NUMBER(10) NOT NULL, --유저번호 FK
    recommend_YN VARCHAR2(1) NOT NULL, --추천여부

    CONSTRAINT pk_board_no PRIMARY KEY (board_no)
);

CREATE SEQUENCE SEQ_nori_REPLY;

CREATE TABLE nori_reply(
    channel_no NUMBER(10), --채널번호
    board_no NUMBER(10), --본문번호
    reply_no NUMBER(10), --댓글번호
    content VARCHAR2(100), --댓글내용
    nick_name VARCHAR2(10) NOT NULL, --댓글 작성자 이름
    reply_recommend NUMBER(10) DEFAULT 0 NOT NULL, --추천수
    reg_date DATE DEFAULT SYSDATE NOT NULL,

   CONSTRAINT pk_nori_reply PRIMARY KEY (reply_no)
);

--ALTER TABLE nori_reply ADD content VARCHAR2(100);


CREATE TABLE nori_reply_recommend_list(
    board_no NUMBER(10) NOT NULL, --본문번호 FK
    reply_no NUmBER(10) NOT NULL, --댓글 번호FK
    user_no NUMBER(10) NOT NULL, --유저번호 FK
    reply_recommend_YN VARCHAR2(1) DEFAULT 'N' NOT NULL, --추천여부

    CONSTRAINT pk_nori_reply_recommend_list PRIMARY KEY (reply_recommend_list)
);

CREATE SEQUENCE SEQ_nori_NOTE;

CREATE TABLE nori_note(
    note_no NUMBER(10), --쪽지 번호
    send_id VARCHAR2(10) NOT NULL,--보내는 사람
    receive_id VARCHAR2(10) NOT NULL, --받는 사람
    content VARCHAR2(200) NOT NULL, --쪽지 내용
    reg_date DATE DEFAULT SYSDATE NOT NULL, --쪽지 보낸시간

    CONSTRAINT pk_nori_note PRIMARY KEY (note_no)
);

--CREATE TABLE nori_note_repository(
--    note_no NUMBER(10),
--    note_content VARCHAR2(200),
--
--    CONSTRAINT pk_nori_note_repository PRIMARY KEY (note_no)
--);