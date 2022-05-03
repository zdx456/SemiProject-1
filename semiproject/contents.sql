
/*장르(genre) 테이블 생성*/
create table genre (
genre_no number primary key,
genre_name varchar2(300) not null check(genre_name in('영화', '드라마', '다큐멘터리', '애니메이션', '버라이어티'))
);

/*장르(genre) 데이터 추가*/
insert into genre values(101, '영화');
insert into genre values(201, '드라마');
insert into genre values(301, '다큐멘터리');
insert into genre values(401, '애니메이션');
insert into genre values(501, '버라이어티');


/***************************************************************************************************/


/*국가(region) 테이블 생성*/
create table region (
region_no number primary key,
region_name varchar2(300) not null check(region_name in('한국', '아시아', '할리우드'))
);

/*국가(region) 데이터 추가*/
insert into region values(11, '한국');
insert into region values(21, '아시아');
insert into region values(31, '할리우드');


/***************************************************************************************************/


/*컨텐츠 번호(contents_no) 시퀀스 생성*/
create sequence contents_seq;

/*컨텐츠(contents) 테이블 생성*/
create table contents (
contents_no number primary key,
region_no number references region(region_no) on delete set null,
genre_no number references genre(genre_no) on delete set null,
contents_title varchar2(300) not null,
contents_views number default 0 not null,
contents_grade varchar2(30) not null check(contents_grade in('전체', '12세', '15세', '청불')),
contents_time number(4) not null,
contents_director varchar2(300) not null,
contents_summary varchar2(4000) not null
);


/***************************************************************************************************/


/*배우 번호(actor_no) 시퀀스 생성*/
create sequence actor_seq;

/*배우(actor) 테이블 생성*/
create table actor (
actor_no number primary key,
actor_name varchar2(300) not null
);

/*컨텐츠 배우 테이블 생성(파란색 테이블)*/
create table contents_actor (
contents_no number references contents(contents_no) on delete cascade,
actor_no number references actor(actor_no) on delete cascade
);


