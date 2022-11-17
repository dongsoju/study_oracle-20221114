/*----------------

--------------------
1) 컬럼, 숫자, 문자
2) 산술연산자 : +, -, *, /, 비교연산자 : =, >=, <=, <, >, ?=, <>,
3)AND,OR,NOT : 논리연산자
4)LIKE, IN ,BETWEEN,EXISTS,NOT
5)IS NULL, IS NOT NULL
6)ANY, SOME, ALL
7)함수(어떤 작업을 수행하는 명령어의 단위) (VS프로시저)
*/    
    
2-3 연산자
2.3.1 산술연산자 : +, - *, /
SELECT 2+2,2-1,2*3,4/2
FROM dual;

80번 부서 사원의 한 해 동안 받은 급여(연봉)을 조회하시오
--사원들의 정보는 EMPLOYEES라는 테이블에 저장되어 있음.
--사원이 근무하는 부서의 정보는 DEPARTMENTS라는 테이블에 저장되어 있음


SELECT   employee_id, last_name, salary * 12 "Annual slary"
FROM employees
WHERE department_id=80;

--SELECT department_id, department_name, manager_id
--FROM departments
--WHERE department_id = 80;

전체 사원들 중 한해동안 받은 급여가 12000인 사원을 조회하시오
--전체 사원을 조회 --*AESRERISK,만능문자/모든 문자열을 대체 모든컬럼 뜻
SELECT   'hanul' company, employee_id,first _name||' '|| last_name, salart *12 AS "Annual aslary",departments
FROM    employees
WHERE   employee_id = 101;


SELECT   employee_id, last_name, salary, department_id
FROM  employees
WHERE salary  <= 3000;


SELECT   employee_id, last_name, salary, department_id
FROM  employees
WHERE  department_id>80;






























