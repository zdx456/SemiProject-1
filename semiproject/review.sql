create sequence review_seq;

create table review(
review_no number primary key,
contents_no references contents(contents_no) on delete cascade,
review_writer references client(client_id) on delete cascade,
review_content varchar2(300) not null,
review_time date default sysdate not null,
review_score number not null check(review_score in(1,2,3,4,5))

);