-- 7장. SET 연산자 (p.63)
-- hr, co 스키마 활용
-- 교사용PC/Study_Oracle/Extras에 있는 HWP, PDF 참조하여 개별 설치

--JOIN, SubQuery : 종속적인 관계에서 테이블의 데이터를 조회 --> 서브쿼리에서는 메인쿼리가 최종 조회하는 데이터를 결정
--SET 연산 : 수평관계


-- SQL에서도 수학에서 사용하는 집합의 개념처럼 (vs 조인, 서브쿼리는 종속적인 관계) 서로다른 쿼리의 실행 결과를
-- 합칠수 있다.

-- 1) UNION : 합집합 (중복제거)
-- 2) UNION ALL : 합집합 (??)
-- 3) INTERSECT : 교집합
-- 4) MINUS : 차집합
/* ㄷ + 한자키 : 특수문자
[1,2,3] ∪ [4,5] <---> [1,2,3,4,5]
[1,2,3] ∪ [3,4,5] <--->  [1,2,3,4,5]
*/

--[예제7-1]
-- 중복을 제거한 행의 결과를 반환
-- 열의 갯수가 맞지 않으면 오류 발생 : ORA-01789: 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
-- null 허용하지만, 컬럼의 데이터 타입이 같아야 함
-- ※ORA-01790: 대응하는 식과 같은 데이터 유형이어야 합니다

SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM    dual
UNION ALL
SELECT 2, 4, 5, 6, 8, null, 'B' second
FROM    dual
UNION ALL
SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM    dual;


[예제7-2] 관리되고 있는 부서, 관리되고 있는 도시 정보를 조회하시오
SELECT  hr.department_id code, hr.department_name name
FROM    hr.departments
UNION
SELECT  hr.location_id, city
FROM    hr.locations;
--UNION                -- hr 스키마의 퀀한이 co 스키마에 접근할 수 없다면, 불가능
SELECT  customer_id, full_name
FROM    co.customers;

[예제7-3] 관리되고 있는 도시와 국가 정보를 조회하시오
DESC locations;
DESC countries;

SELECT  TO_CHAR(location_id) code, city name -- NUMBER , VARCHAR2
FROM    locations
UNION
SELECT  country_id, country_name    -- CHAR, VARCHAR2
FROM    countries;

-- ORA-01790: 대응하는 식과 같은 데이터 유형이어야 합니다 / NULL 허용

-- 7.2 UNION ALL
-- UNION    vs    UNION ALL : 중복을 제거    vs    중복을 포함


-- 7.3 INTERSECT
-- 교집합
-- [1,2,3,5] ∩ [2,4,6] = [2]

[예제7-7] 80번 부서와 50번 부서에 공통으로 있는 사원의 이름을 조회하시오
SELECT first_name
FROM    employees
WHERE   department_id = 80 -- 34
INTERSECT
SELECT first_name
FROM    employees
WHERE   department_id = 50 -- 45

-- Peter, John  : 흔한 이름?

-- 7.4 MINUS 차집합
-- 집합에서 차집합에 해당하는 연산
-- [1,2,3,5] - [2,4,6] = [1,3,5]

SELECT first_name
FROM    employees
WHERE   department_id = 80 -- 34
MINUS
SELECT first_name
FROM    employees
WHERE   department_id = 50 -- 45




--8장. DML
-- Data Manipulation Lang: 데이터 조작어/명령어
--1) SELECT : 조회
--2) INSERT : 새로운 데이터 삽입
--3) UPDATE : 기존 데이터를 갱신
--4) DELETE : 데이터를 삭제
-- DML은 TCL(=Transaction Control Language)과 함께 사용한다.
-- ※ COMMIT : 메모리에 있는 데이터(=연산 결과)를 저장장치에 저장하는 트랜잭션 제어 명령어
-- ※ ROLLBACK : 이전에 수행한 명령을 취소하는 트랜잭션 제어 명령어

-- 8.1 INSERT
-- I. 컬럼을 명시하는 경우 : 갯수만큼 값을 삽입, 순서에 따라 데이터의 종류
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ..)
-- VALUES (값1, 값2, ..)

-- II. 컬럼을 생략하는 경우 : 테이블의 모든 컬럼에 대응하는 값을 입력
-- INSERT INTO 테이블명
-- VALUES (값1, 값2, ..)

-- 저장하지 않는 컬럼값은 자동으로 NULL 이 저장된다.
SAVEPOINT SP1; -- SP1이라는 세이브포인트이름 / 어느만큼 작업이 진행되었는지를 간략하게 표기 (=이정표)
COMMIT;

[예제8-1] 사번, 이름, 성, 입사일을 300, 'Steven', 'Jobs', SYSDATE 행을 삽입하시오!
-- I.emp 생성후 데이터 삽입
CREATE TABLE emp (
    emp_id NUMBER PRIMARY KEY,
    fname VARCHAR2(20),
    lname VARCHAR2(20),
    hire_date DATE DEFAULT SYSDATE,
    --...계속..
);

DROP TABLE emp;
-- I. employees의 구조만 복사해서 emp를 생성하는 방법 : CTAS (Create Table 테이블 AS SELECT 이하)
CREATE TABLE emp AS
SELECT  employee_id emp_id, first_name fname, last_name lname, hire_date, 
        job_id, salary, commission_pct comm_pct, department_id dept_id
FROM    employees
WHERE   1=2; -- 거짓조건으로 조회한 결과를 토대로 emp를 생성(테이블 구조, 데이터타입등)
             -- 제약조건도 복사 됨

SELECT *
FROM emp;

-- II. 데이터 행 삽입
INSERT INTO emp (emp_id, fname, lname, hire_date, job_id)
VALUES (300, 'Steven', 'Jobs', SYSDATE, 'ST_CLERK');

DESC emp; -- NUMBER, VARCHAR2, VARCHAR2, DATE

INSERT INTO emp (emp_id, fname, lname, hire_date, job_id)
VALUES (301, 'Bill', 'Gates', SYSDATE, 'ST_MAN');

-- ITAS : INSERT INTO 테이블 AS SELECT 이하~
-- 많은 양의 데이터를 한번에 삽입하고자 할때
-- 특정 컬럼만 데이터를 삽입하고자 하면 오류 발생   vs 한번에 모든 컬럼을 조회해서 입력할때는 문제없음
INSERT INTO emp
SELECT  employee_id, first_name, last_name, hire_date, job_id, salary, NVL(commission_pct, 0), department_id
FROM    employees
WHERE   department_id = 30;


SELECT *
FROM emp;

COMMIT;





















