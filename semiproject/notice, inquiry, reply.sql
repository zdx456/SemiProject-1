create sequence notice_seq;

create table notice (
    notice_no number primary key,
    notice_writer references client(client_id),
    notice_title varchar2(300) not null,
    notice_content varchar2(4000) not null,
    notice_date date default sysdate not null
);

create sequence inquiry_seq;

create table inquiry (
inquiry_no number primary key,
inquiry_writer references client(client_id),
inquiry_type varchar2(12),
inquiry_title varchar2(300) not null,
inquiry_content varchar2(4000) not null,
inquiry_date date default sysdate not null,
inquiry_readcount number default 0,
inquiry_replycount number default 0
);

create sequence reply_seq;

create table reply (
reply_no number primary key,
reply_target references inquiry(inquiry_no),
reply_writer references client(client_id),
reply_content varchar2(300) not null,
reply_date date default sysdate not null
);

