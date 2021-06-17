-- ///// 테이블 세팅 /////
-- 유저 테이블
CREATE SEQUENCE SEQ_NURI_USER;

CREATE TABLE nuri_user(
    user_no NUMBER(10), --유저번호 PK
    user_id VARCHAR2(10)NOT NULL, --유저아이디
    user_pw VARCHAR2(150)NOT NULL, --유저비밀번호
    nick_name VARCHAR2(10)NOT NULL, --닉네임
    reg_date DATE DEFAULT sysdate NOT NULL, --가입일
    auth VARCHAR2(20) DEFAULT 'COMMON' NOT NULL, --유저권한
    session_id VARCHAR2(200) DEFAULT 'none',
    limit_time DATE,

    CONSTRAINT pk_nuri_user PRIMARY KEY (user_no)
);


-- 채널 테이블
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


-- 채널 조인 유저 테이블
CREATE SEQUENCE SEQ_NURI_CHANNEL_JOIN_USER;

CREATE TABLE nuri_channel_join_user (
    join_seq_no NUMBER(10), --조인유저번호 PK
    channel_no NUMBER(10), --채널번호 FK
    user_no NUMBER(10), --유저번호 FK

    CONSTRAINT pk_nuri_channel_join_user PRIMARY KEY (join_seq_no)
);

-- ALTER TABLE nuri_channel_join_user ADD CONSTRAINT
--fk_nuri_channel_join_user FOREIGN KEY (channel_no) REFERENCES nuri_channel (channel_no)

-- ALTER TABLE nuri_channel_join_user ADD CONSTRAINT
--fk_nuri_channel_join_user FOREIGN KEY (user_no) REFERENCES nuri_channel_join (user_no)


-- 게시글 테이블
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


-- 게시글 추천 테이블
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


-- 댓글 테이블
CREATE SEQUENCE SEQ_NURI_REPLY;

CREATE TABLE nuri_reply(
    channel_no NUMBER(10), --채널번호 FK
    board_no NUMBER(10), --본문번호 FK
    reply_no NUMBER(10), --댓글번호 PK
    content VARCHAR2(100), --댓글내용
    nick_name VARCHAR2(10) NOT NULL, --댓글 작성자 이름
    reply_recommend NUMBER(10) DEFAULT 0 NOT NULL, --추천수
    reg_date DATE DEFAULT SYSDATE NOT NULL, --작성일
    anonymous VARCHAR2(10) DEFAULT 'false',

   CONSTRAINT pk_nuri_reply PRIMARY KEY (reply_no)
);

-- ALTER TABLE nuri_reply ADD CONSTRAINT
--fk_nuri_reply FOREIGN KEY (channel_no) REFERENCES nuri_channel (channel_no)

-- ALTER TABLE nuri_reply ADD CONSTRAINT
--fk_nuri_reply FOREIGN KEY (board_no) REFERENCES nuri_board (board_no)


-- 댓글 추천 테이블
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


-- 쪽지 테이블
CREATE SEQUENCE SEQ_NURI_NOTE;

CREATE TABLE nuri_note(
    note_no NUMBER(10), --쪽지 번호 PK
    send_id VARCHAR2(10) NOT NULL,--보내는 사람
    receive_id VARCHAR2(10) NOT NULL, --받는 사람
    content VARCHAR2(200) NOT NULL, --쪽지 내용
    reg_date DATE DEFAULT SYSDATE NOT NULL, --쪽지 보낸시간

    CONSTRAINT pk_nuri_note PRIMARY KEY (note_no)
);


-- CREATE TABLE nori_note_repository(
--    note_no NUMBER(10),
--    note_content VARCHAR2(200),
--
--    CONSTRAINT pk_nori_note_repository PRIMARY KEY (note_no)
--);


-- 친구 테이블
CREATE TABLE nuri_friend(
    user_no NUMBER(10), --유저번호 PK FK
    target_no NUMBER(10), -- 친구 타겟 유저번호 FK - 유저번호
    relationship VARCHAR2(20) --친구 관계

);

COMMIT;


-- ///// 테이블 조회 /////
SELECT * FROM nuri_user;
SELECT * FROM nuri_channel ORDER BY channel_no;
SELECT * FROM nuri_channel_join_user ORDER BY channel_no;
SELECT * FROM nuri_board ORDER BY board_no DESC;
SELECT * FROM nuri_recommend_list;
SELECT * FROM nuri_reply;
SELECT * FROM nuri_reply_recommend_list;
SELECT * FROM nuri_note;
SELECT * FROM nuri_friend;

-- 채널+조인유저 조회 (전체 채널)
SELECT * FROM nuri_channel A, nuri_channel_join_user B
WHERE A.channel_no = B.channel_no
ORDER BY A.channel_no;

-- 채널+조인유저 이너조인 (관리자=접속한유저): 내가 생성한 채널 조회
SELECT * FROM nuri_channel A, nuri_channel_join_user B
WHERE a.admin_user_no = b.user_no
ORDER BY A.channel_no, B.channel_no;

-- 내가 참여중인 채널 번호 리스트
SELECT channel_no FROM nuri_channel_join_user
WHERE user_no = 2;



-- ///// 쿼리 테스트 /////

-- 채널 생성 테스트
INSERT INTO nuri_channel
(channel_no, channel_name, channel_info, admin_user_no, channel_pw)
VALUES
(seq_nuri_channel.nextval, 'test2', 'test channel02', 2, '1111') ;

-- 단일 채널 조회
SELECT * FROM nuri_channel
WHERE channel_no = 1;

-- 조인유저 삭제 테스트(채널 나가기)
DELETE FROM nuri_channel_join_user WHERE join_seq_no = 1;

-- 채널 나가기 쿼리 (조건추가)
DELETE FROM nuri_channel_join_user
WHERE join_seq_no = (
SELECT join_seq_no FROM nuri_channel_join_user
WHERE user_no = 1 AND channel_no = 32
);

-- 1번 채널에 1번 유저가 들어가 있는 조인유저 리스트 조회
SELECT * FROM nuri_channel_join_user
WHERE user_no = 1 AND channel_no = 1;

-- 1번 채널에 1번 유저가 들어가 있는 조인유저 시퀀스번호 조회
SELECT join_seq_no FROM nuri_channel_join_user
WHERE user_no = 1 AND channel_no = 1;

--2번 유저가 관리자인 채널 리스트
SELECT B.* FROM
(SELECT channel_no FROM nuri_channel_join_user WHERE user_no = 2) A,
nuri_channel B
WHERE A.channel_no = B.channel_no;

-- 조인 유저 생성 테스트 (채널 입장)
INSERT INTO nuri_channel_join_user
(join_seq_no, channel_no, user_no)
VALUES
(seq_nuri_channel_join_user.nextval, 2, 1);

-- 조인 유저 삭제 테스트 (채널 나가기)
DELETE FROM nuri_channel_join_user
WHERE join_seq_no = 3;




