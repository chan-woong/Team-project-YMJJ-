CREATE TABLE Member(
    Mid VARCHAR2(10) NOT NULL,                        -- 아이디
    Mpassword VARCHAR2(10) NOT NULL,                  -- 비밀번호
    Mname VARCHAR2(10) NOT NULL,                      -- 이름

    Mpostalcode VARCHAR2(50) NOT NULL,               -- 주소1
    Maddress VARCHAR2(100) NOT NULL,                 -- 주소2
    
    Mresidentnumber1 VARCHAR2(6) NOT NULL,             -- 주민번호 앞
    Mresidentnumber2 VARCHAR2(7) NOT NULL,             -- 주민번호 뒤
    Mcallnumber1 VARCHAR2(3) NOT NULL,                 -- 전화번호1
    Mcallnumber2 VARCHAR2(4) NOT NULL,                 -- 전화번호2
    Mcallnumber3 VARCHAR2(4) NOT NULL,                 -- 전화번호3
    Memail VARCHAR2(50) NOT NULL,                    -- 이메일
    
    PRIMARY KEY (Mid)
);

CREATE TABLE Restaurant(
    RTnumber VARCHAR2(10) NOT NULL,                    -- 음식점고유번호
    RTname VARCHAR2(500) NOT NULL,                      -- 이름
    RTtype VARCHAR2(100) NOT NULL,                      -- 타입
    RTaddress VARCHAR2(500) NOT NULL,                   -- 주소1
    RTpostalcode VARCHAR2(1000) NOT NULL,               -- 주소2
    
    RTcallnumber1 VARCHAR2(3) NOT NULL,                -- 전화번호
    RTcallnumber2 VARCHAR2(4) NOT NULL,                -- 전화번호
    RTcallnumber3 VARCHAR2(4) NOT NULL,                -- 전화번호
    
    RTlatitude VARCHAR2(100) NOT NULL,                    -- 위도
    RTlongitude VARCHAR2(100) NOT NULL,                   -- 경도
    RTintroduce VARCHAR2(100),                         -- 소개
    RTcount NUMBER(10) DEFAULT '0' NOT NULL,           -- 조회수
    
    RTIname VARCHAR2(100) NOT NULL,                     -- 제목
    RTIsize LONG NOT NULL,                              -- 크기
    RTIpath VARCHAR2(300) NOT NULL,                     -- 주소
    
    PRIMARY KEY (RTnumber)
);
CREATE SEQUENCE Restaurant_RTnumber_seq;
drop SEQUENCE Restaurant_RTnumber_seq;

CREATE TABLE BOOKMARK(
    Bnumber NUMBER(5) NOT NULL,                       -- 고유번호
    Mid VARCHAR2(10) NOT NULL,                        -- 아이디
    RTnumber VARCHAR2(10) NOT NULL,                   -- 음식점고유번호
    PRIMARY KEY (Bnumber),
    FOREIGN KEY (Mid) REFERENCES Member (Mid),
    FOREIGN KEY (RTnumber) REFERENCES Restaurant (RTnumber)
);
CREATE SEQUENCE BOOKMARK_Bnumber_seq;

CREATE TABLE Comments(
    CMnumber NUMBER(5) NOT NULL,                       -- 고유번호
    Mid VARCHAR2(10) NOT NULL,                         -- 아이디
    RTnumber VARCHAR2(10) NOT NULL,                     -- 음식점고유번호
    CMliked NUMBER(1) NOT NULL,                        -- 별점
    CMcontent VARCHAR2(1000) NOT NULL,                   -- 리뷰 내용
    
    PRIMARY KEY (CMnumber),
    FOREIGN KEY (Mid) REFERENCES Member (Mid),
    FOREIGN KEY (RTnumber) REFERENCES Restaurant (RTnumber)
);
CREATE SEQUENCE Comments_CMnumber_seq;

CREATE TABLE Review(
    RVnumber VARCHAR2(10) NOT NULL,                       -- 고유번호
    Writer VARCHAR2(10) NOT NULL,                         -- 아이디
    RTnumber VARCHAR2(10) NOT NULL,                       -- 음식점고유번호
    RTname VARCHAR2(50) NOT NULL,
    RVtitle VARCHAR2(100) NOT NULL,                     -- 리뷰 제목
    RVcontent VARCHAR2(2000) NOT NULL,                   -- 리뷰 내용
    RVcount NUMBER(10) DEFAULT '0' NOT NULL,           -- 조희수
    RVdate DATE NOT NULL,                              -- 날짜
    
    RVimgname VARCHAR2(100),
    RVimgpath VARCHAR2(300),
    RVimgsize LONG,
    
    PRIMARY KEY (RVnumber),
    FOREIGN KEY (Writer) REFERENCES Member (Mid),
    FOREIGN KEY (RTnumber) REFERENCES Restaurant (RTnumber)
);
CREATE SEQUENCE Review_RVnumber_seq;

CREATE TABLE Community(
    Cnumber NUMBER(5) NOT NULL,                       -- 고유번호
    Ccategory VARCHAR2(10) NOT NULL,                  -- 카테고리
    Ctitle VARCHAR2(20) NOT NULL,                     -- 제목
    Ccontent VARCHAR2(1000) NOT NULL,                   -- 내용
    
    PRIMARY KEY (Cnumber)
);
CREATE SEQUENCE Community_Cnumber_seq;

CREATE TABLE Landmark( -- 이진 파트 디비 LMnumber 는 I카테고리에 들어가야함
    LMnumber NUMBER(10) NOT NULL,                     -- 고유번호 자동증가번호
    LMcategory VARCHAR2(100) NOT NULL,                  -- 카테고리 2
    LMtitle VARCHAR2(200) NOT NULL,                     -- 제목
    LMcontent VARCHAR2(2000) NOT NULL,                   -- 내용 4
    LMaddress VARCHAR2(100) NOT NULL,                   -- 주소   
    LMpostalcode VARCHAR2(100) NOT NULL,                      --  6
    LMlatitude VARCHAR2(100) NOT NULL,                    -- 위도
    LMlongitude VARCHAR2(100) NOT NULL,                   -- 경도 8
    
    Iname VARCHAR2(100) NOT NULL,                     -- 제목 (제목_번호)
    Isize LONG NOT NULL,                              -- 크기 
    Ipath VARCHAR2(300) NOT NULL,    
    PRIMARY KEY (LMnumber)
); --입력하고 
CREATE SEQUENCE Landmark_LMnumber_seq;

create table event(
    enumber  number(5) not null,
    etitle   varchar2(50) not null,
    econtent varchar2(500),
    
    group_number number(2) not null,
    sequence_number number(2) not null,
    sequence_level number(2) not null,
    
    edate date not null,
    efilename varchar2(1000),
    epath varchar2(1000),
    efilesize long,

    PRIMARY KEY (enumber)
);
CREATE SEQUENCE event_enumber_seq;