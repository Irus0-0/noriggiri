CREATE SEQUENCE SEQ_NURI_USER;

CREATE TABLE nuri_user(
    user_no NUMBER(10), --유저번호 PK
    user_id VARCHAR2(10)NOT NULL, --유저아이디
    user_pw VARCHAR2(150)NOT NULL, --유저비밀번호
    nick_name VARCHAR2(10)NOT NULL, --닉네임
    reg_date DATE DEFAULT sysdate NOT NULL, --가입일
    auth VARCHAR2(20) DEFAULT 'COMMON' NOT NULL, --유저권한

    CONSTRAINT pk_nuri_user PRIMARY KEY (user_no)
);

ALTER TABLE nuri_user ADD session_id VARCHAR2(200) DEFAULT 'none';
ALTER TABLE nuri_user ADD limit_time DATE;

CREATE SEQUENCE SEQ_NURI_CHANNEL;

CREATE TABLE nuri_channel(
    channel_no NUMBER(10), --채널번호 PK
    channel_name VARCHAR2(20) NOT NULL, --채널이름
    channel_info VARCHAR2(100), --채널 설명
    admin_user_no NUMBER(10) NOT NULL, --관리자 유저 번호
    channel_pw VARCHAR2(20), --채널 접속시 필요한 패스워드
    reg_date DATE DEFAULT SYSDATE NOT NULL, --채널 생성일


    CONSTRAINT pk_nuri_channel PRIMARY KEY (channel_no)
);

CREATE SEQUENCE SEQ_NURI_CHANNEL_JOIN_USER;

CREATE TABLE nuri_channel_join_user (
    join_seq_no NUMBER(10), --조인유저번호 PK
    channel_no NUMBER(10), --채널번호 FK
    user_no NUMBER(10), --유저번호 FK

    CONSTRAINT pk_nuri_channel_join_user PRIMARY KEY (join_seq_no)
);

--ALTER TABLE nuri_channel_join_user ADD join_seq_no NUMBER(10);

 -- ALTER TABLE nuri_channel_join_user ADD CONSTRAINT
 --fk_nuri_channel_join_user FOREIGN KEY (channel_no) REFERENCES nuri_channel (channel_no)

 -- ALTER TABLE nuri_channel_join_user ADD CONSTRAINT
 --fk_nuri_channel_join_user FOREIGN KEY (user_no) REFERENCES nuri_channel_join (user_no)


CREATE SEQUENCE SEQ_NURI_BOARD;

CREATE TABLE nuri_board (
    board_no NUMBER(10), --글번호 PK
    channel_no NUMBER(10), --채널번호 FK
    writer VARCHAR2(20) NOT NULL, --작성자
    title VARCHAR2(30) NOT NULL, --제목
    content VARCHAR2(2000), --글내용
    recommend NUMBER(10) DEFAULT 0 NOT NULL, --추천 수
    reg_date DATE DEFAULT SYSDATE NOT NULL,  --작성날짜
    notice VARCHAR2(10) DEFAULT 'false' NOT NULL,  --공지글 구분

    CONSTRAINT pk_nuri_board PRIMARY KEY (board_no)
);
 -- ALTER TABLE nuri_board ADD CONSTRAINT
 --fk_nuri_board FOREIGN KEY (channel_no) REFERENCES nuri_channel (channel_no)

CREATE TABLE nuri_recommend_list(
    board_no NUMBER(10) NOT NULL, --본문번호 FK PK
    user_no NUMBER(10) NOT NULL, --유저번호 FK
    recommend_YN VARCHAR2(1) NOT NULL, --추천여부

    CONSTRAINT pk_nuri_recommend_list PRIMARY KEY (board_no)
);

-- ALTER TABLE nuri_recommend_list ADD CONSTRAINT
 --fk_nuri_recommend_list FOREIGN KEY (board_no) REFERENCES nuri_board (board_no)

 -- ALTER TABLE nuri_recommend_list ADD CONSTRAINT
 --fk_nuri_recommend_list FOREIGN KEY (user_no) REFERENCES nuri_user (user_no)


CREATE SEQUENCE SEQ_NURI_REPLY;

CREATE TABLE nuri_reply(
    channel_no NUMBER(10), --채널번호 FK
    board_no NUMBER(10), --본문번호 FK
    reply_no NUMBER(10), --댓글번호 PK
    content VARCHAR2(100), --댓글내용
    nick_name VARCHAR2(10) NOT NULL, --댓글 작성자 이름
    reply_recommend NUMBER(10) DEFAULT 0 NOT NULL, --추천수
    reg_date DATE DEFAULT SYSDATE NOT NULL, --작성일

   CONSTRAINT pk_nuri_reply PRIMARY KEY (reply_no)
);
-- ALTER TABLE nuri_reply ADD CONSTRAINT
 --fk_nuri_reply FOREIGN KEY (channel_no) REFERENCES nuri_channel (channel_no)

-- ALTER TABLE nuri_reply ADD CONSTRAINT
 --fk_nuri_reply FOREIGN KEY (board_no) REFERENCES nuri_board (board_no)



CREATE TABLE nuri_reply_recommend_list(
    board_no NUMBER(10) NOT NULL, --본문번호 FK
    reply_no NUmBER(10) NOT NULL, --댓글 번호 FK PK
    user_no NUMBER(10) NOT NULL, --유저번호 FK
    reply_recommend_YN VARCHAR2(1) DEFAULT 'N' NOT NULL, --추천여부

    CONSTRAINT pk_nuri_reply_recommend_list PRIMARY KEY (reply_no)
);
-- ALTER TABLE nuri_reply_recommend_list ADD CONSTRAINT
 --fk_nuri_reply_recommend_list FOREIGN KEY (board_no) REFERENCES nuri_board (board_no)

 -- ALTER TABLE nuri_reply_recommend_list ADD CONSTRAINT
 --fk_nuri_reply_recommend_list FOREIGN KEY (reply_no) REFERENCES nuri_reply (reply_no)

 -- ALTER TABLE nuri_reply_recommend_list ADD CONSTRAINT
 --fk_nuri_reply_recommend_list FOREIGN KEY (user_no) REFERENCES nuri_user (user_no)


CREATE SEQUENCE SEQ_NURI_NOTE;

CREATE TABLE nuri_note(
    note_no NUMBER(10), --쪽지 번호 PK
    send_id VARCHAR2(10) NOT NULL,--보내는 사람
    receive_id VARCHAR2(10) NOT NULL, --받는 사람
    content VARCHAR2(200) NOT NULL, --쪽지 내용
    reg_date DATE DEFAULT SYSDATE NOT NULL, --쪽지 보낸시간

    CONSTRAINT pk_nuri_note PRIMARY KEY (note_no)
);

--CREATE TABLE nori_note_repository(
--    note_no NUMBER(10),
--    note_content VARCHAR2(200),
--
--    CONSTRAINT pk_nori_note_repository PRIMARY KEY (note_no)
--);

COMMIT;


INSERT INTO nuri_channel
        (channel_no, channel_name, channel_info, admin_user_no, channel_pw)
        VALUES
        (seq_nuri_channel.nextval, 'test2', 'test channel02', 2, '1111') ;

SELECT * FROM nuri_channel
        WHERE channel_no = 1;



SELECT * FROM nuri_user;

SELECT * FROM nuri_channel ORDER BY channel_no;

SELECT * FROM nuri_channel_join_user;


--DROP TABLE nuri_channel_join_user;


INSERT INTO nuri_channel_join_user
        (join_seq_no, channel_no, user_no)
        VALUES
        (seq_nuri_channel_join_user.nextval, 1, 2);

DELETE FROM nuri_channel_join_user
        WHERE join_seq_no = 3;




