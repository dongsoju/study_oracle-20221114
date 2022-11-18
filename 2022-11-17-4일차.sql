--2장. 데이터 조회 구문
/*
DML :SELECT, INSERT, UPDATE, DELETE
DDL :CREATE, 
DCL :GRANT, REVOKE, THUN

SELECT employee_id, first_name, department_id
FROM employees;

SELECT employee_id, first_name, department_id   -- SELECT 절
FROM employees                                  --FROM 절
WHERE department_id = 100;                      --WHERE 조건절

--2.3.3 비교 연산자
--숫자 비교
--문자 비교 (9.7)

,,,
[예제2-11]성이 King인 사원의 정보를 조회하시오
-- 사원의정보 : 사번, 이름, 성, 전화번호, 이메일, 매니저, 부서, 보너스 ,,,
--          last_name이 king인지 비교!! (=같다,크다,작다,,,)
SELECT  employee_id 사번, last_name 성,department_id
FROM    employees
WHERE   last_name


--WHERE  last_name

--문자열 패턴 : 특전 조건의 문자를 찾는과정
--ex> 전화번호, 이메일 ==>010-1234-5678  문자데이터값 구분 명령어는 구분안함


[예제2-12]입사일이 2004년 1월 1일 이전인   사원의 정보를 조회하시오
--2004년1월1일이전, 처음부터~ 2003년12월31까지
--범위비교:이상,이하
SELECT*
FROM employees
WHERE 'hire_date' < '01-JAN-04';

--'' : 문자 데이터 와 시간/날짜 데이터를 표기할때사용
--"  : 컬럼의 별칭 지정할때 ,공백이있는 문장을 조합할때
/*
ORA-01858: 숫자가 있어야 하는 위치에서 숫자가 아닌 문자가 발견되었습니다.
01858. 00000 -  "a non-numeric character was found where a numeric was expected"
*Cause:    The input data to be converted using a date format model was
           incorrect.  The input data did not contain a number where a number was
           required by the format model.
*Action:   Fix the input data or the date format model to make sure the
           elements match in number and type.  Then retry the operation.
*/          


SELECT SYSDATE
FROM dual;

--
SELECT  employee_id 사번, last_name 성,department_id 부서, hire_date 입사일
FROM    employees
WHERE   hire_date < '04-01-01';
--데이터베이스 설정 보기
--NLS(National) Language support : 나라별/언어별 

SELECT *
FROM v$nls_parameters;
--2. sqldeveloper > 도구> 환경설정>데이터베이스 > Nls

2,3,4 AND, OR, NOT 논리조건 연산자
--여러개의 조건이 오는 경우 필요한 연산자
--AND 연산은 조건이 모두TRUE 일때, 최종 TRUE를반환
[예제21-13] 30번부서 사원중 급여가 10000 이하면서 2005년 이전에 입사한 사원의 정보를 조회 하시오
SELECT employee_id, first_name, ||' '||last_name fullname, salary, department_id
FROM  employees                 --조건
WHERE   department_id = 30      --조건
AND salary <= 10000             --조건
AND hire_date <= '04-12-31';    --조건






여기서 정보는 사번 이름 급여 부서코드를 뜻함
--sql(=struchured Qery Language), 구조화된 질의 언어 패턴
SELECT employee_id
FROM  employees
WHERE   department_id = 30
AND salary <= 10000;


--Q, Den 이라는 사람, 사번이114인 사람의 정보를 추가 조회하시오
SELECT first_name, last_name, salary, hire_date job_id
FROM employees
WHERE employee_id = 114;


--2)or연산은 조건이 하나라도 트루일때 최종 트루를반환

ㅇㅇㅇㅇㅇ
[2-15]30번 부서나 60번 부서에 속한 사원의 정보를 조회하시오
부서vs사원의 관계 <--> 오라클 PDBMS(Reational DBMS, 관계형데이터베이스 시스템) <---> 테이블~테이블 관계
SELECT employee_id, first_name, last_name fullname, salary, department_id
FROM  employees                 
WHERE   department_id = 30
OR  department_id = 60;














