-- 연습문제 2-1
-- hr 스키마를 이용해 문제를 해결 하시오

-- 1. 사번이 200인 사원의 이름과 부서번호를 조회하시오
--   (조건컬럼)
SELECT  employee_id emp_id, first_name||' '||last_name full_name
FROM    employees
WHERE   employee_id = 200;   -- 200번	Jennifer Whalen

-- 2. 급여가 3000에서 15000 사이에 포함되지 않는 사원의 사번, 이름, 급여 정보를 조회하시오
-- (단, 이름은 이름과 성 사이에 공백을 두어 합쳐서 조회하고 ex> john + smith ==> john smith로 조회되게끔)

SELECT  employee_id, first_name||' '||last_name full_name, salary
FROM    employees
--WHERE   NOT salary BETWEEN 3000 AND 15000; -- 27rows
WHERE   salary < 3000
OR      salary > 15000;

-- 3. 부서번호가 30과 60에 소속된 사원의 사번, 이름, 부서번호, 급여를 조회하시오
-- (단, 이름은 알파벳 순서로 정렬하여 조회할것)

SELECT  employee_id, first_name, department_id, salary
FROM    employees
WHERE   department_id IN (30, 60)
--WHERE   department_id = 30
--OR     department_id = 60; -- 11rows
ORDER BY    first_name ASC;

-- 4. 급여가 3000에서 15000 사이 이면서, 부서번호가 30또는 60에 소속된 사원의 사번, 이름, 급여를 조회하는 쿼리를 작성하시오
-- 단, 이름과 성을 합쳐서 name으로, 월급여는 Monthly Salary로 조회되게 한다)

SELECT employee_id, first_name||' '||last_name name, salary "Monthly Salary", department_id
FROM    employees
WHERE   salary BETWEEN 3000 AND 15000
AND      department_id IN (30, 60); -- 7rows

-- 5. 소속된 부서번호가 없는 사원의 사번, 이름, 업무ID를 조회하시오
SELECT  employee_id, first_name, job_id
FROM    employees
WHERE   department_id IS NULL; --  1rows
/*
EMPLOYEE_ID FIRST_NAME           JOB_ID    
----------- -------------------- ----------
        178 Kimberely            SA_REP
*/        


-- 6. 커미션을 받는 사원의 사번, 이름, 급여, 커미션을 조회하는데 커미션이 높은 사원부터 낮은 사원 순서로 정렬하시오
SELECT  employee_id, first_name, salary, commission_pct
FROM    employees
WHERE   commission_pct IS NOT NULL
ORDER BY    4 DESC; -- 내림차순 정렬, 35rows
/*
EMPLOYEE_ID FIRST_NAME               SALARY COMMISSION_PCT
----------- -------------------- ---------- --------------
        145 John                      14000             .4
        158 Allan                      9000            .35
        157 Patrick                    9500            .35
        156 Janette                   10000            .35
                   .... 계속 ....
*/

-- 7. 이름에 문자 z가 포함된 사원의 사번과 이름을 조회하시오
-- first_name : 이름
-- last_name : 성
SELECT  employee_id, first_name
FROM    employees
WHERE   first_name LIKE '%z%'; -- 3rows
/*
EMPLOYEE_ID FIRST_NAME          
----------- --------------------
        130 Mozhe               
        172 Elizabeth           
        136 Hazel   
*/        


