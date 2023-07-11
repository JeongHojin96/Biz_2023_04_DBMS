-- ScoreDB 화면

use scoredb;
-- 일반(엑셀)성적표를 저장하기 위한 Table 생성
drop table tbl_screV1;
create table tbl_scoreV1 (
	sc_stnum	varchar(5)		primary key,
	sc_kor	int,
	sc_eng	int,
	sc_math	int,
	sc_music	int,	
	sc_art	int,
	sc_software	int,	
	sc_database	int	
);

show tables;
desc tbl_scoreV1;

select * from tbl_scoreV1;

create view view_scoreV1 AS
(
select *, sc_kor + sc_eng + sc_math + sc_music + sc_art + sc_software + sc_database AS 총점,
(sc_kor + sc_eng + sc_math + sc_music + sc_art + sc_software + sc_database) / 7 AS 평균
from tbl_scorev1
);

select * from view_scorev1;

-- 국어성적이 50점 이상인 학생들 리스트
-- where selection
select * from view_scorev1
where sc_kor >= 50;

-- 평균 점수가 60점 미만인 학생들
select * from view_scorev1
where 평균 < 70;

-- SQL을 사용한 간이 통계
-- 전체학생의 각 과목별 성적총점계산
-- 국어성적의 총점계산
-- SUM() : ANSI SQL 의 총합계를 계산하는 통계함수
-- AVG() : ANSI SQL 의 평균을 계산하는 통계함수
-- MAX(), MIN() : ANSI SQL 의 최대값, 최소값을 계산하는 통계함수
-- COUNT() : ANSI SQL 의 개수를 계산하는 통계함수
select sum(sc_kor)
from view_scorev1;

select sum(sc_kor) AS 국어,
sum(sc_eng) AS 영어,
sum(sc_math) AS 수학,
sum(sc_music) AS 음악,
sum(sc_art) AS 미술
from view_scoreV1;

select avg(sc_kor) AS 국어,
avg(sc_eng) AS 영어,
avg(sc_math) AS 수학,
avg(sc_music) AS 음악,
avg(sc_art) AS 미술
from view_scoreV1;

-- MySQL8 의 전용함수
-- over(order by 평균 desc) : 평균을 오름차순한 것을 기준으로
-- rank() 순위를 계산하라
-- dense_rank() : 동점자 처리를 하되 석차를 건너뜀 없이
select *,
rank() over (order by 평균 desc) 랭킹
from view_scorev1
order by 평균 desc;

select *,
dense_rank() over (order by 평균 desc) 랭킹
from view_scorev1
where 랭크 < 10
order by 평균 desc;

-- sub query : sql 결과를 사용하여 다른 sql 을 실행하는 것

select * from
(
	select *,
    rank() over (order by 평균 desc) 랭킹
    from view_scoreV1
) sub
where sub.랭킹 <5;

select sub.과목코드, sub.과목명 from
(
	select sc_stnum, 'b001' as 과목코드, '국어' as 과목명, sc_kor from tbl_scorev1
	union all
	select sc_stnum,'b002', '영어', sc_kor from tbl_scorev1
	union all
	select sc_stnum,'b003', '수학', sc_kor from tbl_scorev1
	union all
	select sc_stnum,'b004', '음악', sc_kor from tbl_scorev1
	union all
	select sc_stnum,'b005', '미술', sc_kor from tbl_scorev1
	union all
	select sc_stnum,'b006', '소프트웨어', sc_kor from tbl_scorev1
	union all
	select sc_stnum,'b007', '데이터베이스', sc_kor from tbl_scorev1
) as sub
group by sub.과목코드, sub.과목명;

-- 학생정보 제3정규화 데이터 테이블
-- 학번과 고목코드를 복합키(슈퍼키) pk 생성
create table tbl_score (
	sc_stnum	varchar(5)	not null,
	sc_bcode	varchar(4)	not null,	
	sc_score	int	not null,	
	primary key(sc_stnum, sc_bcode)		
);

-- 과목정보 테이블
create table tbl_subject (
	b_code	varchar(4)		primary key,
	b_name	varchar(20)		
);
-- 과목 정보 Excel 데이터를 tbl_subject 에 insert 해 보기

insert tbl_subject (b_code, b_name)
values('b001', '국어');
insert tbl_subject (b_code, b_name)
values('b002', '영어');
insert tbl_subject (b_code, b_name)
values('b003', '수학');
insert tbl_subject (b_code, b_name)
values('b004', '음악');
insert tbl_subject (b_code, b_name)
values('b005', '미술');
insert tbl_subject (b_code, b_name)
values('b006', '소프트웨어');
insert tbl_subject (b_code, b_name)
values('b007', '데이터베이스');

select * from tbl_subject;

select * from tbl_score
order by sc_bcode;

-- 성적표와 과목정보를 join 하여
-- 학번, 과목코드, 과목명, 점수 를 Projection 하여 출력

select sc_stnum, sc_bcode, b_name, sc_score
from tbl_score
	left join tbl_subject
		on sc_bcode = b_code;
        
-- 완전 참조관계 확인
-- 다음의 left join 을 사용하여 확인
-- 여기에서 결과가 하나도 없어야 한다.
select sc_stnum, sc_bcode, b_name, sc_score
from tbl_score
	left join tbl_subject
		on sc_bcode = b_code
where b_name is null;

-- 성적표와 과목정보가 완전 참조관계일때는 EQ join 을
-- 사용할 수 있다.
select  sc_stnum, sc_bcode, b_name, sc_score
from tbl_score, tbl_subject
		where sc_bcode = b_code;
        
-- 성적표와 과목정보가 앞으로도 계속 완전 참조 관계가 되도록
-- FK 설정(완전참조 무결성 관계 설정)
-- ANSI SQL
alter table tbl_score
add constraint f_subject foreign key(sc_bcode)
references tbl_subject(b_code);

-- MySQL
alter table tbl_score
add foreign key(sc_bcode)
references tbl_subject(b_code);

-- alter table tbl_score
-- drop foreign key /*이름*/;


-- on update, on delete
-- on delete : master(tbl_subject) table의 키가 삭제될때
/*
NO ACTION, RESTRICT : master 삭제 -> sub 도 모두 삭제
CASCADE : master 수정/삭제	 
SET NULL : master 삭제 -> sub = null
			만약 sub 칼럼이 not null 이면 오류 발생
SET DEFAULT : mater 삭제 -> sub table 생성할때
				default 옵션으로 지정한 값으로 셋팅
restaict : 아무 것도 하지마, 삭제하지마
*/
-- on update : master(tbl_subject) table의 키가 변경될때
-- ANSI SQL
alter table tbl_score
add constraint f_subject foreign key(sc_bcode)
references tbl_subject(b_code)
on delete cascade;

select sc_stnum, sc_bcode, b_name, sc_score
from tbl_score, tbl_subject
where sc_bcode = b_code AND sc_stnum = 'S0010';

-- 학생별 총점 계산하기
select sc_stnum, sum(sc_score)
from tbl_score
group by sc_stnum;

-- 과목별 총점 계산하기
select sc_bcode, sum(sc_score) 총점, AVG(sc_score) 평균
from tbl_score
group by sc_bcode;

-- 제 3정규화된 데이터를 PIVOT 펼쳐서 보고서 형식으로 출력
-- 세로방향으로 펼쳐진 데이터를 가로방향으로 펼쳐서 보기
select
	sum(if(sc_bcode = 'B0001', sc_score, 0)) AS 국어,
    sum(if(sc_bcode = 'B0002', sc_score, 0)) AS 영어,
    sum(if(sc_bcode = 'B0003', sc_score, 0)) AS 수학,
    sum(if(sc_bcode = 'B0004', sc_score, 0)) AS 음악,
    sum(if(sc_bcode = 'B0005', sc_score, 0)) AS 미술,
    sum(if(sc_bcode = 'B0006', sc_score, 0)) AS 소프트웨어,
    sum(if(sc_bcode = 'B0007', sc_score, 0)) AS 데이터베이스,
	sum(sc_score) as 총점,
    avg(sc_score) as 평균
from tbl_score
group by sc_stnum;

-- 학번이 s0010 보다 작은 학생들의 총점 계산
select sc_stnum, sum(sc_score) as 총점
from tbl_score
group by sc_stnum
having sc_stnum < 's0010';

select sc_stnum, sum(sc_score) as 총점
from tbl_score
where sc_stnum < 's0010'
group by sc_stnum;












