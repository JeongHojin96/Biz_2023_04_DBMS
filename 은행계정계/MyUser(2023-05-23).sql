-- 여기는 MyUser SCHEME 화면
-- 여기는 MyUser 로 접속한 화면

SHOW TABLES;

DESCRIBE tbl_buyer;

/*
SELECT 명령
SQL 의 DML 명령중에 가장 많이 사용하는 명령
DB>TABLE에 보관(저장)중인 데이터를 조회하는 명령

tbl_buyer TABLE 에 저장된 데이터를 아무 조건 없이
모두 조회하여 보여달라
*/
SELECT * FROM tbl_buyer;

-- tbl_buyer TABLE에 저장된 데이터를 아무 조건 없이 보이되
-- buid, buname 칼럼(field, 속성)만 보여달라
-- 저장된 데이터 중에서 id 와 이름 항목만 보고 싶다.
SELECT buid, buname FROM tbl_buyer;

-- 이름과 전화번호 칼럼만 리스트로 보여달라
SELECT buname, butel FROM tbl_buyer;

-- tbl_buyer TABLE 에 저장된 데이터 중에서 buname(이름) 항목의 데이터가
-- 성춘향 으로 되어 있는 데이터들만 리스트로 보고 싶다.
-- WHERE 절 : 조건을 부여할때
SELECT * FROM tbl_buyer
WHERE buname = '성춘향';

SELECT * FROM tbl_buyer
WHERE buname = '이몽룡';

-- 이름이 홍길동으로 되어 있는 데이터 리스트를 보고싶다
-- 데이터가 없으면 Result(결과) Empty 인 상태 이다.
SELECT * FROM tbl_buyer
WHERE buname = '홍길동';

/*
buname 칼럼을 기준으로 조건 설정하였다.
buname 칼럼에 어떤 값을 조건으로 데이터를 조회 한것
buname 칼럼은 데이터가 추가될때 같은 이름의 데이터가 중복하여 저장될 수 있다
buname 칼럼을 기준으로 조회한 데이터가 비록 현재는 1개만 보이더라도
       이 데이터는 0개 이상의 데이터가 조회될 것이다 라는 것을 반드시 예상해야 한다.

만약 buname 칼럼을 기준으로 하여 데이터를 Update, Delete 를 수행할 경우
다수의(2개이상) 데이터에 변경(수정)이 이루어 질 수 있다.
그러한 이유로 Update, Delete를 수행할때는 절대 buname 칼럼을 기준으로 삼아서는 안된다.
*/
INSERT INTO tbl_buyer(buid, buname)
VALUES('0003','성춘향');

SELECT * FROM tbl_buyer;

SELECT * FROM tbl_buyer
WHERE buname = '성춘향';

SELECT * FROM tbl_buyer;

/*
buid 칼럼을 기준으로 조회하기
buid 칼럼을 TABLE을 create 할때 PK(PRIMARY KEY) 성질을 설정하였다.
PK 로 설정된 칼럼은 유일성, NOT NULL 속성을 갖게된다.

만약 이 칼럼에 이미 있는 데이터를 또다시 추가하려고 하면 다음과 같은 오류가 발생한다
ORA-00001: 무결성 제약 조건(C##MYUSER.SYS_C008316)에 위배됩니다.
PK 칼럼에 0001 이라는 값을 갖는 데이터가 있는데 또다시 0001 이라는 데이터를
추가하려고 했기 떄문에 발생하는 오류
*/
SELECT * FROM tbl_buyer
WHERE buid = '0001';

-- 무결성제약조건 오류
-- 중복데이터 추가 오류
INSERT INTO tbl_buyer(buid, buname)
VALUES('0001', '임꺽정');

INSERT INTO tbl_buyer(buname)
VALUES('임꺽정')






