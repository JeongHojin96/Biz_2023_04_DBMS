-- 여기는 관리자 화면

-- 주소록 데이터를 관리하기 위하여 Project 시작
-- Oracle 은 데이터를 저장하기 위하여 데이터 저장공간을 먼저 설정해야 한다.
-- 물리적 저장공간을 TableSpace 라고 한다.

/*
addrDB 라는 이름의 저장소를 만들겠다.
실제 데이터가 저장되는 공간은 cL//app/data/addr.dbf 파일이다.
초기 크기는 1M(Byte)이며 용량이 부족하면 자동으로 1K(Byte)씩 증가시켜라.
*/

CREATE TABLESPACE addrDB
DATAFILE 'c://app/data/addr.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

/*
Oracle 에서는 실제 데이터는 TABLESPACE 에 저장되지만
System 을 통해 DB 데이터에 접근할때는 TABLESPACE 를 통하지 않는다.
생성된 TABLESPACE 와 연결하는 사용자를 생성하고,
사용자(user)를 통하여 데이터에 접근한다. 
*/
-- 사용자 생성
-- 오라클 21c(12c 이상)에서는 사용자 등록을 하기 전에 SCRIPT 실행을 ON 해야 한다.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
