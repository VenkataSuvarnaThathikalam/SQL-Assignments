SELECT UPPER ('data Engineering') FROM dual
SELECT LOWER('DATA ENGINEERING') FROM dual;
SELECT INITCAP('oracle database administrator') FROM dual;
SELECT LENGTH('machine learning') FROM dual;
SELECT SUBSTR('artificial intelligence',1,10) FROM dual;
SELECT CONCAT('Oracle ','SQL') FROM dual;
SELECT REPLACE('hello python','python','oracle') FROM dual;
SELECT TRIM('    database    ') FROM dual;
SELECT LTRIM('00000500','0') FROM dual;
SELECT RTRIM('500000','0') FROM dual;
SELECT LPAD('500',8,'0') FROM dual;
SELECT RPAD('SQL',10,'.') FROM dual;
SELECT ASCII('A') FROM dual;
SELECT CHR(65) FROM dual;
#Numeric Functions 


SELECT CEIL(25.01) FROM dual;
SELECT FLOOR(25.99) FROM dual;
SELECT MOD(25,4) FROM dual;

SELECT ABS(-999.50) FROM dual;
SELECT POWER(3,4) FROM dual;
SELECT SQRT(81) FROM dual;
#HR.EMPLOYEES Practice

SELECT first_name,UPPER(first_name)FROM hr.employees;
SELECT first_name,LOWER(first_name)FROM hr.employees;
SELECT first_name,INITCAP(first_name)FROM hr.employees;
SELECT first_name,LENGTH(first_name)FROM hr.employees;
SELECT first_name,SUBSTR(first_name,1,3)FROM hr.employees;
SELECT first_name || ' ' || last_name AS full_name FROM hr.employees;
SELECT employee_id,LPAD(employee_id,6,'0') AS formatted_id FROM hr.employees;
SELECT first_name,RPAD(first_name,20,'.') AS formatted_name FROM hr.employees;
SELECT employee_id,salary, CEIL(salary / 12) AS ceil_monthly_salary FROM hr.employees;
SELECT employee_id,salary,FLOOR(salary / 12) AS floor_monthly_salary FROM hr.employees;
SELECT employee_id,MOD(employee_id,2) AS remainder FROM hr.employees;
SELECT employee_id,salary,ABS(salary - 10000) AS difference_from_10000 FROM hr.employees;
SELECT employee_id,salary,POWER(salary,2) AS salary_square FROM hr.employees;
SELECT employee_id,salary,SQRT(salary) AS salary_square_root FROM hr.employees;