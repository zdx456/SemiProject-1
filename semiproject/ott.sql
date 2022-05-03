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
contents_no references contents(contents_no) on delete set null
);

-- 회원이 가입한 ott
create table client_ott(
client_no references client(client_id) on delete cascade,
ott_no references ott(ott_no) on delete cascade
);