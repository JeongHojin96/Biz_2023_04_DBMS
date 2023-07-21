-- bbsDB DataBase 생성하기
create database bbsDB;
-- bbsDB DataBase 접속하기
Use bbsDB;
-- bbsdb에 포함된 tqble 리스트 확인하기
show tables;

desc tbl_bbs;

drop table tbl_bbs;

create table tbl_bbs (
	b_seq	bigint		PRIMARY KEY	auto_increment,
	b_pseq	bigint,	
	b_date	varchar(10),		
	b_time	varchar(10),	
	b_username	varchar(125),
	b_subject	varchar(125),			
	b_content	text,
	b_count	int,			
	b_update	datetime			
);

drop table tbl_user;

create table tbl_user (
	username	varchar(125)		PRIMARY KEY,
    nickname	varchar(125),
	tel	varchar(20)	
    );