/*----------------

--------------------
1) �÷�, ����, ����
2) ��������� : +, -, *, /, �񱳿����� : =, >=, <=, <, >, ?=, <>,
3)AND,OR,NOT : ��������
4)LIKE, IN ,BETWEEN,EXISTS,NOT
5)IS NULL, IS NOT NULL
6)ANY, SOME, ALL
7)�Լ�(� �۾��� �����ϴ� ��ɾ��� ����) (VS���ν���)
*/    
    
2-3 ������
2.3.1 ��������� : +, - *, /
SELECT 2+2,2-1,2*3,4/2
FROM dual;

80�� �μ� ����� �� �� ���� ���� �޿�(����)�� ��ȸ�Ͻÿ�
--������� ������ EMPLOYEES��� ���̺� ����Ǿ� ����.
--����� �ٹ��ϴ� �μ��� ������ DEPARTMENTS��� ���̺� ����Ǿ� ����


SELECT   employee_id, last_name, salary * 12 "Annual slary"
FROM employees
WHERE department_id=80;

--SELECT department_id, department_name, manager_id
--FROM departments
--WHERE department_id = 80;

��ü ����� �� ���ص��� ���� �޿��� 12000�� ����� ��ȸ�Ͻÿ�
--��ü ����� ��ȸ --*AESRERISK,���ɹ���/��� ���ڿ��� ��ü ����÷� ��
SELECT   'hanul' company, employee_id,first _name||' '|| last_name, salart *12 AS "Annual aslary",departments
FROM    employees
WHERE   employee_id = 101;


SELECT   employee_id, last_name, salary, department_id
FROM  employees
WHERE salary  <= 3000;


SELECT   employee_id, last_name, salary, department_id
FROM  employees
WHERE  department_id>80;






























