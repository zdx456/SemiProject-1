-- 관심 컨텐츠 시퀸스
create sequence likecontents_seq;

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

commit;
