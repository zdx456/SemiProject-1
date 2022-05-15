SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
DROP TABLE "ATTACHMENT" CASCADE CONSTRAINTS;
DROP TABLE "CLIENT" CASCADE CONSTRAINTS;
DROP TABLE "GENRE" CASCADE CONSTRAINTS;
DROP TABLE "REGION" CASCADE CONSTRAINTS;
DROP TABLE "CONTENTS" CASCADE CONSTRAINTS;
DROP TABLE "ACTOR" CASCADE CONSTRAINTS;
DROP TABLE "CONTENTS_ACTOR" CASCADE CONSTRAINTS;
DROP TABLE "LIKEGENRE" CASCADE CONSTRAINTS;
DROP TABLE "NOTICE" CASCADE CONSTRAINTS;
DROP TABLE "INQUIRY" CASCADE CONSTRAINTS;
DROP TABLE "REPLY" CASCADE CONSTRAINTS;
DROP TABLE "OTT_CONTENTS" CASCADE CONSTRAINTS;
DROP TABLE "CLIENT_OTT" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW" CASCADE CONSTRAINTS;
DROP TABLE "OTT_ATTACHMENT" CASCADE CONSTRAINTS;
DROP TABLE "CONTENTS_ATTACHMENT" CASCADE CONSTRAINTS;
DROP TABLE "LIKECONTENTS" CASCADE CONSTRAINTS;
DROP TABLE "OTT" CASCADE CONSTRAINTS;


--sequnce 삭제
drop sequence likecontents_seq;
drop sequence actor_seq;
drop sequence contents_seq;
drop sequence attachment_seq;
drop sequence review_seq;
drop sequence ott_seq;
drop sequence notice_seq;
drop sequence inquiry_seq;
drop sequence reply_seq;

/* 첨부파일 테이블(file) */


create table attachment (
attachment_no number primary key,
attachment_uploadname varchar2(256) not null,
attachment_savename varchar2(256) not null,
attachment_type varchar2(256) not null,
attachment_size number default 0 not null
);


--회원
create table client(
client_id varchar2(15) primary key,
client_pw varchar2(16) not null,
client_nick varchar2(30) not null unique,
client_joindate date default sysdate not null,
client_gender nchar(2) check(client_gender in ('남성', '여성')),
client_grade varchar2(12) default '일반회원' not null check(client_grade in ('일반회원','관리자')),
client_birth char(10) not null,
client_email varchar2(100) not null
);

/*장르(genre) 테이블 생성*/
create table genre (
genre_name varchar2(300) primary key check(genre_name in('영화', '드라마', '다큐멘터리', '애니메이션', '버라이어티','없음'))
);


/*국가(region) 테이블 생성*/
create table region (
region_name varchar2(300) primary key check(region_name in('한국', '아시아', '할리우드'))
);


/*배우(actor) 테이블 생성*/
create table actor (
actor_no number primary key,
actor_name1 varchar2(300),
actor_name2 varchar2(300),
actor_name3 varchar2(300),
actor_name4 varchar2(300)
);

--공지
create table notice (
    notice_no number primary key,
    notice_writer references client(client_id),
    notice_title varchar2(300) not null,
    notice_content varchar2(4000) not null,
    notice_date date default sysdate not null,
    notice_type varchar2(6)
);

--문의
create table inquiry (
inquiry_no number primary key,
inquiry_writer references client(client_id),
inquiry_type varchar2(12),
inquiry_title varchar2(300) not null,
inquiry_content varchar2(4000) not null,
inquiry_date date default sysdate not null,
inquiry_replycount number default 0
);

--답변
create table reply (
reply_no number primary key,
reply_target references inquiry(inquiry_no),
reply_writer references client(client_id),
reply_content varchar2(300) not null,
reply_date date default sysdate not null
);

-- ott
create table ott(
ott_no number primary key,
ott_name varchar2(20) not null unique,
ott_price number not null check(ott_price >= 0)
);




/* ott-첨부파일 테이블(ottFile)*/
 

create table ott_attachment(
ott_no number references ott(ott_no) on delete cascade,
attachment_no number references attachment(attachment_no) on delete cascade,
primary key(ott_no, attachment_no)
);


/* 콘텐츠-첨부파일 테이블(contentsFile)*/

create table contents_attachment (
contents_no number references contents(contents_no) on delete cascade,
attachment_no number references attachment(attachment_no) on delete cascade,
primary key(contents_no, attachment_no)
);


/*컨텐츠(contents) 테이블 생성*/
create table contents (
contents_no number primary key,
region_name varchar2(300) references region(region_name) on delete set null,
genre_name varchar2(300) references genre(genre_name) on delete set null,
contents_title varchar2(300) not null,
contents_views number default 0 not null,
contents_grade varchar2(30) not null check(contents_grade in('전체', '12세', '15세', '청불')),
contents_time number(4) not null,
contents_director varchar2(300) not null,
contents_summary varchar2(4000) not null
);

/*컨텐츠 배우 테이블 생성(파란색 테이블)*/
create table contents_actor (
contents_no number references contents(contents_no) on delete cascade,
actor_no number references actor(actor_no) on delete cascade
);

-- 관심 컨텐츠 테이블 (파란색 테이블)
create table likecontents (
like_no number primary key,
client_id varchar2(15) references client(client_id) on delete cascade,
contents_no number references contents(contents_no) on delete cascade
);

-- 선호 장르 테이블 (파란색 테이블)
create table likegenre (
client_id varchar2(15) references client(client_id) on delete cascade,
genre_name varchar2(300) references genre(genre_name) on delete cascade
);


-- ott별 컨텐츠
create table ott_contents(
ott_no references ott(ott_no) on delete cascade,
contents_no references contents(contents_no) on delete set null,
primary key (ott_no, contents_no)
);

-- 회원이 가입한 ott
create table client_ott(
client_id references client(client_id) on delete cascade, --오타수정...
ott_no references ott(ott_no) on delete cascade
);

--선호장르
create table likegenre (
client_id varchar2(15) references client(client_id) on delete cascade,
genre_name varchar2(300) references genre(genre_name) on delete cascade
);

--review
create table review(
review_no number primary key,
contents_no references contents(contents_no) on delete cascade,
review_writer references client(client_id) on delete cascade,
review_content varchar2(300) not null,
review_time date default sysdate not null,
review_score number not null check(review_score in(1,2,3,4,5)) 
);

--joindateChart 필요 테이블
create table temp_year(year number primary key);
insert into temp_year values(2022);
insert into temp_year values(2023);
insert into temp_year values(2024);
insert into temp_year values(2025);
insert into temp_year values(2026);
insert into temp_year values(2027);
insert into temp_year values(2028);
commit;


-- joindateChart 필요 뷰
create or replace view year_status as
select
    year, count(C.client_id) cnt 
from 
    temp_year T 
        left outer join client C 
            on T.year = extract(year from C.client_joindate)
        group by year;

--joindateChart 필요 테이블
create table temp_year_month(
 year number not null,
 month number not null,
 primary key(year, month) 
);
insert into temp_year_month values(2022, 1);
insert into temp_year_month values(2022, 2);
insert into temp_year_month values(2022, 3);
insert into temp_year_month values(2022, 4);
insert into temp_year_month values(2022, 5);
insert into temp_year_month values(2022, 6);
insert into temp_year_month values(2022, 7);
insert into temp_year_month values(2022, 8);
insert into temp_year_month values(2022, 9);
insert into temp_year_month values(2022, 10);
insert into temp_year_month values(2022, 11);
insert into temp_year_month values(2022, 12);
insert into temp_year_month values(2023, 1);
insert into temp_year_month values(2023, 2);
insert into temp_year_month values(2023, 3);
insert into temp_year_month values(2023, 4);
insert into temp_year_month values(2023, 5);
insert into temp_year_month values(2023, 6);
insert into temp_year_month values(2023, 7);
insert into temp_year_month values(2023, 8);
insert into temp_year_month values(2023, 9);
insert into temp_year_month values(2023, 10);
insert into temp_year_month values(2023, 11);
insert into temp_year_month values(2023, 12);
insert into temp_year_month values(2024, 1);
insert into temp_year_month values(2024, 2);
insert into temp_year_month values(2024, 3);
insert into temp_year_month values(2024, 4);
insert into temp_year_month values(2024, 5);
insert into temp_year_month values(2024, 6);
insert into temp_year_month values(2024, 7);
insert into temp_year_month values(2024, 8);
insert into temp_year_month values(2024, 9);
insert into temp_year_month values(2024, 10);
insert into temp_year_month values(2024, 11);
insert into temp_year_month values(2024, 12);
insert into temp_year_month values(2025, 1);
insert into temp_year_month values(2025, 2);
insert into temp_year_month values(2025, 3);
insert into temp_year_month values(2025, 4);
insert into temp_year_month values(2025, 5);
insert into temp_year_month values(2025, 6);
insert into temp_year_month values(2025, 7);
insert into temp_year_month values(2025, 8);
insert into temp_year_month values(2025, 9);
insert into temp_year_month values(2025, 10);
insert into temp_year_month values(2025, 11);
insert into temp_year_month values(2025, 12);
commit;

--리뷰 시퀀스
create sequence review_seq;

--ott 시퀀스

create sequence ott_seq;

-- 공지 시퀀스
create sequence notice_seq;

-- 문의 시퀀스
create sequence inquiry_seq;

-- 답변 시퀀스
create sequence reply_seq;

-- 첨부파일 시퀀스
create sequence attachment_seq;

/*컨텐츠 번호(contents_no) 시퀀스 생성*/

create sequence contents_seq;

/*배우 번호(actor_no) 시퀀스 생성*/
create sequence actor_seq;

create sequence likecontents_seq;
--더미 데이터 (추가)

/*국가(region) 데이터 추가*/
insert into region values ('한국');
insert into region values ('아시아');
insert into region values ('할리우드');
commit;

/*장르(genre) 데이터 추가*/
insert into genre values ('영화');
insert into genre values ('드라마');
insert into genre values ('다큐멘터리');
insert into genre values ('애니메이션');
insert into genre values ('버라이어티');
insert into genre values ('없음');
commit;
