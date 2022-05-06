--ott 시퀀스
create sequence ott_seq;

-- ott
create table ott(
ott_no number primary key,
ott_name varchar2(20) not null check(ott_name in('넷플릭스','왓챠','티빙','웨이브')),
ott_price number not null check(ott_price >= 0)
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

--더미 데이터 (추가)
insert into ott values (ott_seq.nextval, '넷플릭스', 1000);
insert into ott values (ott_seq.nextval, '왓차', 2000);
insert into ott values (ott_seq.nextval, '웨이브', 3000);
insert into ott values (ott_seq.nextval, '티빙', 4000);
commit;