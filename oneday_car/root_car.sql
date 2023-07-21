create database cardb;
use cardb;
create table tbl_car(
	c_seq	bigint		PRIMARY KEY	AUTO_INCREMENT,
	c_cate	varchar(10),		
	c_sdate	varchar(10),			
	c_stime	varchar(10),		
	c_skm	varchar(125),			
	c_edate	varchar(10),			
	c_etime	varchar(10),			
	c_ekm	varchar(125),			
	c_place	varchar(125),			
	c_fee	varchar(125)			
);