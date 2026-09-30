-- ============================================================
-- 1. Classify employees based on salary
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 15000 THEN 'High Salary'
           WHEN salary >= 8000  THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_category
FROM hr.employees;


-- ============================================================
-- 2. Check whether employee salary is above 10,000
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary > 10000 THEN 'Above 10000'
           ELSE '10000 or Below'
       END AS salary_status
FROM hr.employees;


-- ============================================================
-- 3. Categorize employees based on department
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       CASE
           WHEN department_id = 10 THEN 'Administration'
           WHEN department_id = 20 THEN 'Marketing'
           WHEN department_id = 50 THEN 'Shipping'
           WHEN department_id = 60 THEN 'IT'
           WHEN department_id = 80 THEN 'Sales'
           ELSE 'Other Department'
       END AS department_name
FROM hr.employees;


-- ============================================================
-- 4. Check whether employee has commission
-- ============================================================

SELECT employee_id,
       first_name,
       commission_pct,
       CASE
           WHEN commission_pct IS NULL THEN 'No Commission'
           ELSE 'Commission Available'
       END AS commission_status
FROM hr.employees;


-- ============================================================
-- 5. Categorize employees based on commission percentage
-- ============================================================

SELECT employee_id,
       first_name,
       commission_pct,
       CASE
           WHEN commission_pct >= 0.30 THEN 'High Commission'
           WHEN commission_pct >= 0.20 THEN 'Medium Commission'
           WHEN commission_pct > 0 THEN 'Low Commission'
           ELSE 'No Commission'
       END AS commission_category
FROM hr.employees;


-- ============================================================
-- 6. Categorize employees based on hire year
-- ============================================================

SELECT employee_id,
       first_name,
       hire_date,
       CASE
           WHEN EXTRACT(YEAR FROM hire_date) < 2005 THEN 'Old Employee'
           WHEN EXTRACT(YEAR FROM hire_date) <= 2007 THEN 'Experienced Employee'
           ELSE 'New Employee'
       END AS employee_category
FROM hr.employees;


-- ============================================================
-- 7. Check whether employee has a manager
-- ============================================================

SELECT employee_id,
       first_name,
       manager_id,
       CASE
           WHEN manager_id IS NULL THEN 'No Manager'
           ELSE 'Has Manager'
       END AS manager_status
FROM hr.employees;


-- ============================================================
-- 8. Categorize employees based on Job ID
-- ============================================================

SELECT employee_id,
       first_name,
       job_id,
       CASE
           WHEN job_id = 'IT_PROG' THEN 'IT Employee'
           WHEN job_id = 'SA_REP'  THEN 'Sales Employee'
           WHEN job_id = 'ST_CLERK' THEN 'Store Employee'
           WHEN job_id = 'FI_ACCOUNT' THEN 'Finance Employee'
           ELSE 'Other Employee'
       END AS job_category
FROM hr.employees;


-- ============================================================
-- 9. Calculate bonus based on salary
-- High salary = 10%
-- Medium salary = 15%
-- Low salary = 20%
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 15000 THEN salary * 0.10
           WHEN salary >= 8000  THEN salary * 0.15
           ELSE salary * 0.20
       END AS bonus
FROM hr.employees;


-- ============================================================
-- 10. Calculate salary after bonus
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 15000 THEN salary + (salary * 0.10)
           WHEN salary >= 8000  THEN salary + (salary * 0.15)
           ELSE salary + (salary * 0.20)
       END AS salary_after_bonus
FROM hr.employees;


-- ============================================================
-- 11. Categorize employees based on first letter of name
-- ============================================================

SELECT employee_id,
       first_name,
       CASE
           WHEN first_name LIKE 'A%' THEN 'Name Starts With A'
           WHEN first_name LIKE 'S%' THEN 'Name Starts With S'
           WHEN first_name LIKE 'J%' THEN 'Name Starts With J'
           ELSE 'Other Name'
       END AS name_category
FROM hr.employees;


-- ============================================================
-- 12. Categorize salary into 4 levels
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 20000 THEN 'Level 1'
           WHEN salary >= 15000 THEN 'Level 2'
           WHEN salary >= 10000 THEN 'Level 3'
           ELSE 'Level 4'
       END AS salary_level
FROM hr.employees;


-- ============================================================
-- 13. Check employee eligibility for bonus
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary < 10000 THEN 'Eligible for Bonus'
           ELSE 'Not Eligible for Bonus'
       END AS bonus_eligibility
FROM hr.employees;


-- ============================================================
-- 14. Categorize departments into business areas
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       CASE
           WHEN department_id IN (10, 20, 30) THEN 'Business Operations'
           WHEN department_id IN (50, 60) THEN 'Technical Operations'
           WHEN department_id IN (80, 90) THEN 'Sales and Management'
           ELSE 'Other'
       END AS business_area
FROM hr.employees;


-- ============================================================
-- 15. Categorize salary using AND condition
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 5000 AND salary < 10000
                THEN 'Salary Between 5000 and 9999'

           WHEN salary >= 10000 AND salary < 15000
                THEN 'Salary Between 10000 and 14999'

           WHEN salary >= 15000
                THEN 'Salary 15000 or Above'

           ELSE 'Salary Below 5000'
       END AS salary_range
FROM hr.employees;


-- ============================================================
-- 16. Use CASE WHEN inside ORDER BY
-- Custom department sorting
-- ============================================================

SELECT employee_id,
       first_name,
       department_id
FROM hr.employees
ORDER BY
       CASE
           WHEN department_id = 60 THEN 1
           WHEN department_id = 80 THEN 2
           WHEN department_id = 50 THEN 3
           ELSE 4
       END;


-- ============================================================
-- 17. Count high, medium and low salary employees
-- ============================================================

SELECT
       SUM(CASE
               WHEN salary >= 15000 THEN 1
               ELSE 0
           END) AS high_salary_count,

       SUM(CASE
               WHEN salary >= 8000 AND salary < 15000 THEN 1
               ELSE 0
           END) AS medium_salary_count,

       SUM(CASE
               WHEN salary < 8000 THEN 1
               ELSE 0
           END) AS low_salary_count
FROM hr.employees;


-- ============================================================
-- 18. Calculate department-wise high salary employee count
-- ============================================================

SELECT department_id,
       COUNT(*) AS total_employees,

       SUM(
           CASE
               WHEN salary >= 10000 THEN 1
               ELSE 0
           END
       ) AS high_salary_employees

FROM hr.employees
GROUP BY department_id
ORDER BY department_id;


-- ============================================================
-- 19. Give different salary increments based on department
-- IT = 20%
-- Sales = 15%
-- Others = 10%
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       salary,

       CASE
           WHEN department_id = 60
                THEN salary * 1.20

           WHEN department_id = 80
                THEN salary * 1.15

           ELSE salary * 1.10
       END AS new_salary

FROM hr.employees;


-- ============================================================
-- 20. Multiple conditions: Salary + Department
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       salary,

       CASE
           WHEN department_id = 60
                AND salary >= 10000
                THEN 'Senior IT Employee'

           WHEN department_id = 60
                AND salary < 10000
                THEN 'Junior IT Employee'

           WHEN department_id = 80
                AND salary >= 10000
                THEN 'Senior Sales Employee'

           WHEN department_id = 80
                AND salary < 10000
                THEN 'Junior Sales Employee'

           ELSE 'Other Employee'
       END AS employee_status

FROM hr.employees;
