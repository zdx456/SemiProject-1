drop table client;
create table client(
client_id varchar2(15) primary key,
client_pw varchar2(16) not null,
client_nick varchar2(30) not null unique,
client_joindate date default sysdate not null,
client_gender nchar(2) check(client_gender in ('남성', '여성')),
client_grade varchar2(12) default '일반회원' not null check(client_grade in ('일반회원','관리자')),
client_birth date not null,
client_email varchar2(100) not null
);
