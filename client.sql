drop table client;
create table client(
client_id varchar2(20) primary key check(regexp_like(client_id, '^[a-z][a-z0-9]{7,19}$')),
client_pw varchar2(16) not null 
check(regexp_like(client_pw, '[a-z]+') and regexp_like(client_pw, '[A-Z]+')
			and regexp_like(client_pw, '[0-9]+') and regexp_like(client_pw, '[!@#$]+')),
client_nick varchar2(30) not null unique check(regexp_like(client_nick, '^[ㄱ-ㅎ가-힣0-9]{1,10}$')),
client_birth char(10) not null,
client_grade varchar2(12) default '일반회원' not null check(client_grade in ('일반회원', '우수회원', '관리자')),
client_joindate date default sysdate not null,
client_logindate date
);
