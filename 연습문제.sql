--[연습문제10-1]


--다음의테이블을 생성하시오 (1-3)

--1. starwords (영화정보)
--1/1 접속창에서도 만들수있음

--2.characters (등장인물)
create table STAR_WARS(
    episode_id NUMBER(5),
    episode_name VARCHAR2(50),
     master_id NUMBER(5),
     role_id NUMBER(5),
    email_id NUMBER(40),
    open_year   NUMBER(4),
    CONSTRAINT episode_id_pk primary key (episode_id)
);
--3.casting(등장인물 실제 배우정보)

create table CHARACTERS(
    episode_id NUMBER(5),
    episode_name VARCHAR2(30),
     master_id NUMBER(5),
     role_id NUMBER(4),
    email_id VARCHAR2(40),
    CONSTRAINT CHARACTERS_id_pk primary key (episode_id)
);
create table casting(
    episode_id NUMBER(5),
    character_id,
    REAL_NAME  
    CONSTRAINT casting_id_pk primary key (episode_id)
);





























