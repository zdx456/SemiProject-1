-- 관심 컨텐츠 테이블 (파란색 테이블)
create table likecontents (
client_id varchar2(15) references client(client_id) on delete cascade,
contents_no number references contents(contents_no) on delete cascade
);

-- 선호 장르 테이블 (파란색 테이블)
create table likegenre (
client_id varchar2(15) references client(client_id) on delete cascade,
genre_no number references genre(genre_no) on delete cascade
);