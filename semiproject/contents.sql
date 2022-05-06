/*장르(genre) 테이블 생성*/
create table genre (
genre_name varchar2(300) primary key check(genre_name in('영화', '드라마', '다큐멘터리', '애니메이션', '버라이어티'))
);

/*장르(genre) 데이터 추가*/
insert into genre values ('영화');
insert into genre values ('드라마');
insert into genre values ('다큐멘터리');
insert into genre values ('애니메이션');
insert into genre values ('버라이어티');


/***************************************************************************************************/


/*국가(region) 테이블 생성*/
create table region (
region_name varchar2(300) primary key check(region_name in('한국', '아시아', '할리우드'))
);

/*국가(region) 데이터 추가*/
insert into region values ('한국');
insert into region values ('아시아');
insert into region values ('할리우드');


/***************************************************************************************************/


/*컨텐츠 번호(contents_no) 시퀀스 생성*/
create sequence contents_seq;

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


/***************************************************************************************************/


/*배우 번호(actor_no) 시퀀스 생성*/
create sequence actor_seq;

/*배우(actor) 테이블 생성*/
create table actor (
actor_no number primary key,
actor_name1 varchar2(300),
actor_name2 varchar2(300),
actor_name3 varchar2(300),
actor_name4 varchar2(300)
);

/*컨텐츠 배우 테이블 생성(파란색 테이블)*/
create table contents_actor (
contents_no number references contents(contents_no) on delete cascade,
actor_no number references actor(actor_no) on delete cascade
);