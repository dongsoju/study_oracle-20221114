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
















