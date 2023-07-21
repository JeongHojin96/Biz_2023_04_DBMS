create database bbsDB;

use bbsDB;

drop table tbl_bbs;

create table tbl_bbs(
	b_seq	bigint	PRIMARY KEY auto_increment,
	b_pseq	bigint,
	b_date	varchar(10),
	b_time	varchar(10),
	b_username	varchar(125),
	b_nickname	varchar(125),		
	b_subject	varchar(125),		
	b_content	text,		
	b_count	int,
	b_update	datetime
);

SELECT b_username, b_nickname
FROM tbl_bbs
GROUP BY b_username, b_nickname;

INSERT into tbl_user(username, nickname)
values('callor@callor.com','내멋으로');

INSERT into tbl_user(username, nickname, tel)
values('hong','홍길동','090-1111-1111');
INSERT into tbl_user(username, nickname, tel)
values('lee','이몽룡','090-2222-2222');
INSERT into tbl_user(username, nickname, tel)
values('seoung','성춘향','090-3333-3333');

select * from tbl_user;

drop table tbl_user;
create table tbl_user (
username varchar(125) PRIMARY KEY,
nickname varchar(125) NOT NULL,
tel varchar(20)
);

select * from tbl_bbs;	

select count(*) from tbl_bbs;

alter table tbl_bbs
add constraint f_username foreign key(b_username)
references tbl_user(username);

desc tbl_bbs;

select B.b_seq, B.b_pseq, B.b_date, B.b_time, B.b_username, U.nickname, B.b_subject, B.b_content, B.b_count 
from tbl_bbs B, tbl_user U
where B.b_username = U.username;