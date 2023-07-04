-- 여기는 addr USER 화면입니다.

/*
tbl_address table 에 대하여 다음 결과를 확인하는 SQL을 작성
1. TABLE 에 저장된 전체 데이터의 개수는 몇개인가
2. TABLE 에 저장된 전체 리스트를 전화번호 순으로 정렬하여 확인하기
3. TABLE 에 저장된 전체 리스트를 이름 순으로 정렬하여 확인하기
4. TABLE 에 저장된 전체 리스트중 성씨가 "김" 으로 시작되는 리스트 확인하기
5. TABLE 에 저장된 전체 리스트중 전화번호의 국번 (090-2222-1234 중 2222 구역)이
    3으로 시작되는 리스트의 개수는 몇개인가
*/

SELECT COUNT(*) FROM tbl_address;

SELECT * FROM tbl_address
ORDER BY a_tel;

SELECT * FROM tbl_address
ORDER BY a_tel DESC;
/*ASC = 오름차순, DESC = 내림차순, 오름차순은 기본값이라 생략가능*/

SELECT * FROM tbl_address
ORDER BY a_name;

SELECT * FROM tbl_address
WHERE a_name LIKE '이%';

SELECT COUNT(*) FROM tbl_address
WHERE a_tel LIKE '090-3%';



