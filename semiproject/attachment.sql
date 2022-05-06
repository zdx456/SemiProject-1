/* 첨부파일 테이블(file) */

create sequence attachment_seq;

create table attachment (
attachment_no number primary key,
attachment_uploadname varchar2(256) not null,
attachment_savename varchar2(256) not null,
attachment_type varchar2(256) not null,
attachment_size number default 0 not null
);


/* 콘텐츠-첨부파일 테이블(contentsFile)*/

create table contents_attachment (
contents_no number references contents(contents_no) on delete cascade,
attachment_no number references attachment(attachment_no) on delete cascade,
primary key(contents_no, attachment__no)
);