SELECT * FROM countries;

SELECT country_id country_name, region_id
FROM countries;
dsad

SELECT country_id country_name
FROM countries;

DESCRIBE employees;
SELECT *
FROM employees;  �������� ��ȸ�ϰ����ϴ°� �˻�


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









2.2 ������
���� �����Ϳ��� Ư�� �� �����͸� �����Ͽ� ��ȸ�ϱ� ���ؼ� �������� ����մϴ�
/*
SELECT �÷�1, �÷�,...               (3)
FROM ���̺� �̸�                     (1)    
WHERE ������ ����;                   (2)
*/


2-3 80�� �μ����� ��� ������ ��ȸ�Ͻÿ�
--�����̽���--
SELECT
FROM employees
WHERE department_id = 80; -- ���� ������ : =(equal)
--��Ű-- 
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
    
    ��ü�μ� ����� ��μ��ڵ带 �����ִ��� ��ȸ
    
DESC departments;
SELECT *
FROM departments; --27 rows
ddd

    
    
    
    
    
    
























