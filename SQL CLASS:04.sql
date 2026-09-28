SELECT employee_id, first_name, hire_date,TO_CHAR(hire_date, 'YYYY') AS joining_year FROM hr.employees;
SELECT employee_id, first_name, hire_date,TO_CHAR(hire_date, 'MM') AS joining_month_number FROM hr.employees;
SELECT employee_id, first_name, hire_date,TO_CHAR(hire_date, 'FMMonth') AS joining_month_name FROM hr.employees;
SELECT employee_id, first_name, hire_date,TO_CHAR(hire_date, 'DD') AS joining_day FROM hr.employees;
SELECT employee_id, first_name, hire_date,TO_CHAR(hire_date, 'FMDay') AS joining_weekday FROM hr.employees;
SELECT employee_id, first_name, hire_date FROM hr.employees WHERE TO_CHAR(hire_date, 'YYYY') = '2005'
SELECT employee_id, first_name, hire_date FROM hr.employees WHERE TO_CHAR(hire_date, 'MM') = '01';
SELECT employee_id, first_name, hire_date FROM hr.employees WHERE TO_CHAR(hire_date, 'DD') = '01';
SELECT employee_id, first_name, hire_date FROM hr.employees WHERE TO_CHAR(hire_date, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')
SELECT employee_id, first_name, hire_date FROM hr.employees WHERE TO_CHAR(hire_date, 'YYYYMM') = TO_CHAR(SYSDATE, 'YYYYMM');
SELECT employee_id, first_name, hire_date,ADD_MONTHS(hire_date, 12) AS first_anniversary FROM hr.employees;
SELECT employee_id, first_name, hire_date,ADD_MONTHS(hire_date, 60) AS fifth_anniversary FROM hr.employees;
SELECT employee_id, first_name, hire_date, ADD_MONTHS(hire_date, 3) AS review_date FROM hr.employees;
SELECT employee_id, first_name, hire_date,ADD_MONTHS(hire_date, 6) AS probation_completion FROM hr.employees;
SELECT employee_id, first_name, hire_date,hire_date + 30 AS onboarding_deadline FROM hr.employees;
SELECT employee_id, first_name, hire_date,hire_date + 90 AS ninety_day_review FROM hr.employees;
SELECT employee_id, first_name, hire_date,SYSDATE - hire_date AS days_since_joining FROM hr.employees;
SELECT employee_id, first_name, hire_date,MONTHS_BETWEEN(SYSDATE, hire_date) AS months_since_joining FROM hr.employees;
SELECT employee_id, first_name, hire_date,LAST_DAY(hire_date) AS joining_month_end FROM hr.employees;
SELECT employee_id, first_name, hire_date,NEXT_DAY(hire_date, 'MONDAY') AS first_monday_after_joining FROM hr.employees;
