//Les 1
SELECT *
FROM departments;

SELECT department_id, location_id
FROM departments;

SELECT last_name, salary, salary + 300
FROM employees;

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

SELECT last_name, job_id, salary, commission_pct
FROM employees;

SELECT last_name, 12*salary*commission_pct
FROM employees;

SELECT last_name AS name, commission_pct comm
FROM employees;

SELECT last_name "Name" , salary*12 "Annual Salary"
FROM employees;

SELECT last_name||job_id AS "Employees"
FROM employees;

SELECT last_name ||' is a '||job_id
AS "Employee Details"
FROM employees;

SELECT department_name || ' Department' ||q'['s Manager Id: ]'|| manager_id
AS "Department and Manager"
FROM departments;

SELECT DISTINCT department_id
FROM employees;

DESCRIBE employees

//Les 2
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90 ;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen' ;

SELECT last_name
FROM employees
WHERE hire_date = '14-JUN-04' ;

SELECT last_name, salary
FROM employees
WHERE salary <= 3000 ;
//!=
SELECT last_name, salary
FROM employees
WHERE salary <> 3000 ;

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500 ;

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201) ;

SELECT first_name
FROM employees
WHERE first_name LIKE 'S%' ;

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%' ;

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL ;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%' ;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%' ;

SELECT last_name, job_id
FROM employees
WHERE job_id
NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'
OR job_id = 'AD_PRES'
AND salary > 15000;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC ;

SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal ;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;
//200
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num ;
//IT_PROG
SELECT last_name, department_id, salary*12 ,job_id
FROM employees
WHERE job_id = '&job_title' ;

SELECT employee_id, last_name, job_id,&column_name
FROM employees
WHERE &condition
ORDER BY &order_column ;

SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name ;

DEFINE employee_num = 200
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num ;

SET VERIFY ON
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;

//Les 3
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

SELECT employee_id, last_name, department_id
FROM employees
WHERE upper(last_name) = 'HIGGINS';


SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name =  initcap('hIGGINS');

select first_name , last_name ,CONCAT(first_name , last_name)
from employees;

select first_name , last_name ,SUBSTR(first_name,1,3)
from employees;

select first_name , last_name ,length(first_name)
from employees;

select first_name , last_name ,INSTR(first_name,'a')
from employees;

select salary , LPAD(salary,10,'*')
from employees;

select salary , RPAD(salary, 10, '*') 
from employees;

select REPLACE('JACK and JUE','J','BL') 
from employees;

select TRIM('H' FROM 'HelloWorld')
from employees;

SELECT employee_id, CONCAT(first_name, last_name) NAME,job_id, LENGTH (last_name),
INSTR(last_name, 'a') "index of 'a'?"
FROM employees
WHERE SUBSTR(job_id, 4) = 'REP';

SELECT ROUND(45.923),ROUND(45.923,2), ROUND(45.923,0),ROUND(45.923,-1)
FROM DUAL;

SELECT TRUNC(45.923,2), TRUNC(45.923),TRUNC(45.923,-1)
FROM DUAL;

SELECT last_name, salary, MOD(salary, 5000)
FROM employees
WHERE job_id = 'SA_REP';

SELECT last_name, hire_date
FROM employees
WHERE hire_date > '01-FEB-88';

SELECT sysdate
FROM dual;

SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
FROM employees
WHERE department_id = 90;

SELECT MONTHS_BETWEEN ('01-SEP-95','11-JAN-94')
from DUAL;

SELECT ADD_MONTHS ('31-JAN-96',1)
FROM DUAL;

SELECT NEXT_DAY ('01-SEP-95','FRIDAY') 
FROM DUAL;

SELECT LAST_DAY ('01-FEB-95')
FROM DUAL;
















