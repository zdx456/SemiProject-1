drop table client;
create table client(
client_id varchar2(20) primary key check(regexp_like(client_id, '^[a-z]{0,16}$')),
client_pw varchar2(16) not null 
check(regexp_like(client_pw, '^[a-z]{9,17}$') and regexp_like(client_pw, '[A-Z]+')
			and regexp_like(client_pw, '[0-9]+') and regexp_like(client_pw, '[!@#$]+')),
client_nick varchar2(30) not null unique check(regexp_like(client_pw, '[a-z]+') and regexp_like(client_pw, '[A-Z]+') and(client_nick, '^[ㄱ-ㅎ가-힣0-9]{1,10}$')),
client_joindate date default sysdate not null,
client_gender nchar(2),
/*nchar 글자수로 판단 =  여성/남성*/
client_grade varchar2(12) default '일반회원' not null check(client_grade in ('일반회원','관리자')),
client_birth char(10) not null,
client_email varchar2(100) not null

/*
아아디: 영어 숫자 15자 이내 프라이머리
pw  : 영어,숫자,특수문(!@#$)8~16 not null
nick : 한글,영어,숫자 2~10 not null unique
가입일: yyyy-mm-dd default sysdate
성별: 남성,여성 char(6) not null
등급: 일반, 관리자 not null
생년월일: yyyy-mm-dd
이메일 : varchar2(100) not null
 */
);
