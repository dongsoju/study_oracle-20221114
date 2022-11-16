SELECT * FROM countries;

SELECT country_id country_name, region_id
FROM countries;
dsad

SELECT country_id country_name
FROM countries;

DESCRIBE employees;
SELECT *
FROM employees;  프롬절에 조회하고자하는걸 검색


DESC employees;



EMPLOYEE_ID       NOT NULL
FIRST_NAME           NOT NULL
LAST_NAME        NOT NULL
EMAIL 
PHONE_NUMBER
HIRE_DATE           NOT NULL
JOB_ID               NOT NULL
SALARY
COMMISSION_PCT
MANAGER_ID
DEPARTMENT_ID


SELECT EMPLOYEE_id first_name, last_name, salary
FROM 









2.2 조건절
전테 데이터에서 특전 행 데이터를 제한하여 조회하기 위해서 조건절을 사용합니다
/*
SELECT 컬럼1, 컬럼,...               (3)
FROM 테이블 이름                     (1)    
WHERE 조건을 나열;                   (2)
*/


2-3 80번 부서원의 사원 정보를 조회하시오
--스페이스바--
SELECT
FROM employees
WHERE department_id = 80; -- 같다 연산자 : =(equal)
--탭키-- 
SELECT  *
FROM    employees
WHERE   department_id = 80;
--ctrl+f7--
SELECT
    *
FROM
    employees
WHERE
    department_id = 80;
    
    전체부서 몇개인지 어떤부서코드를 갖고있는지 조회
    
DESC departments;
SELECT *
FROM departments; --27 rows
ddd

    
    
    
    
    
    
























