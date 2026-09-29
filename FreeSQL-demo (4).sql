/*
====================================================================
ORACLE SQL NULL FUNCTIONS - 20 QUERIES
TABLE: HR.EMPLOYEES

Functions Covered:
1. NVL()
2. NVL2()
3. COALESCE()
4. DECODE()
5. NULLIF()
====================================================================
*/


-- ================================================================
-- NVL() - EXAMPLES
-- NVL(expression, replacement_value)
-- If expression is NULL, Oracle returns replacement_value.
-- ================================================================


-- ----------------------------------------------------------------
-- 1. Replace NULL commission with 0
-- Question:
-- Display employee ID, first name, salary and commission.
-- If commission_pct is NULL, display 0.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL(commission_pct, 0) AS commission
FROM hr.employees;


-- ----------------------------------------------------------------
-- 2. Calculate commission amount using NVL
-- Question:
-- Calculate the commission amount for every employee.
-- Employees without commission should get commission amount = 0.
--
-- Example:
-- Salary = 10000
-- Commission = 0.20
-- Commission Amount = 2000
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary * NVL(commission_pct, 0) AS commission_amount
FROM hr.employees;


-- ----------------------------------------------------------------
-- 3. Calculate total salary including commission
-- Question:
-- Calculate salary + commission amount.
-- If commission_pct is NULL, consider commission as 0.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary + (salary * NVL(commission_pct, 0)) AS total_salary
FROM hr.employees;


-- ----------------------------------------------------------------
-- 4. Replace NULL manager ID
-- Question:
-- Display manager ID.
-- If an employee does not have a manager, display 0.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    last_name,
    manager_id,
    NVL(manager_id, 0) AS manager_id_after_nvl
FROM hr.employees;



-- ================================================================
-- NVL2() - EXAMPLES
--
-- Syntax:
-- NVL2(expression, value_if_not_null, value_if_null)
--
-- If expression IS NOT NULL -> second argument
-- If expression IS NULL     -> third argument
-- ================================================================


-- ----------------------------------------------------------------
-- 5. Check whether an employee receives commission
-- Question:
-- If commission_pct has a value, display 'Gets Commission'.
-- Otherwise display 'No Commission'.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL2(
        commission_pct,
        'Gets Commission',
        'No Commission'
    ) AS commission_status
FROM hr.employees;


-- ----------------------------------------------------------------
-- 6. Check whether employee has a manager
-- Question:
-- If manager_id is NOT NULL, display 'Has Manager'.
-- If manager_id is NULL, display 'No Manager'.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    manager_id,
    NVL2(
        manager_id,
        'Has Manager',
        'No Manager'
    ) AS manager_status
FROM hr.employees;


-- ----------------------------------------------------------------
-- 7. Calculate bonus using NVL2
-- Question:
-- If employee has commission, give a 20% bonus.
-- If employee does not have commission, give a 10% bonus.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL2(
        commission_pct,
        salary * 0.20,
        salary * 0.10
    ) AS bonus
FROM hr.employees;


-- ----------------------------------------------------------------
-- 8. Calculate salary after bonus using NVL2
-- Question:
-- Employees with commission get a 20% salary increase.
-- Employees without commission get a 10% salary increase.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL2(
        commission_pct,
        salary + (salary * 0.20),
        salary + (salary * 0.10)
    ) AS salary_after_bonus
FROM hr.employees;



-- ================================================================
-- COALESCE() - EXAMPLES
--
-- Syntax:
-- COALESCE(value1, value2, value3, ...)
--
-- Returns the FIRST NON-NULL value.
-- ================================================================


-- ----------------------------------------------------------------
-- 9. Return commission if available, otherwise salary
-- Question:
-- Return commission_pct when it is available.
-- If commission_pct is NULL, return salary.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    COALESCE(commission_pct, salary) AS first_available_value
FROM hr.employees;


-- ----------------------------------------------------------------
-- 10. Find first available contact information
-- Question:
-- Display phone number if available.
-- If phone number is NULL, display email.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    phone_number,
    email,
    COALESCE(phone_number, email) AS preferred_contact
FROM hr.employees;


-- ----------------------------------------------------------------
-- 11. COALESCE with multiple values
-- Question:
-- Return the first available value from:
-- commission_pct -> manager_id -> department_id -> 0
--
-- TO_CHAR is used so all return values have compatible datatypes.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    commission_pct,
    manager_id,
    department_id,
    COALESCE(
        TO_CHAR(commission_pct),
        TO_CHAR(manager_id),
        TO_CHAR(department_id),
        '0'
    ) AS first_available_value
FROM hr.employees;


-- ----------------------------------------------------------------
-- 12. Use COALESCE to calculate commission
-- Question:
-- If commission_pct is NULL, use 0.
-- Then calculate the employee's commission amount.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary * COALESCE(commission_pct, 0) AS commission_amount
FROM hr.employees;



-- ================================================================
-- DECODE() - EXAMPLES
--
-- Syntax:
-- DECODE(expression,
--        search1, result1,
--        search2, result2,
--        default)
--
-- DECODE is commonly used for equality-based conditions in Oracle.
-- ================================================================


-- ----------------------------------------------------------------
-- 13. Display department name using DECODE
-- Question:
-- Convert selected department IDs into readable names.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    DECODE(
        department_id,
        10, 'Administration',
        20, 'Marketing',
        50, 'Shipping',
        60, 'IT',
        80, 'Sales',
        90, 'Executive',
        'Other Department'
    ) AS department_name
FROM hr.employees;


-- ----------------------------------------------------------------
-- 14. Display job category using DECODE
-- Question:
-- Convert selected job IDs into meaningful job categories.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    job_id,
    DECODE(
        job_id,
        'IT_PROG',    'IT Programmer',
        'SA_REP',     'Sales Representative',
        'ST_CLERK',   'Stock Clerk',
        'FI_ACCOUNT', 'Finance Accountant',
        'AD_PRES',    'President',
        'Other Job'
    ) AS job_category
FROM hr.employees;


-- ----------------------------------------------------------------
-- 15. Check commission using DECODE
-- Question:
-- If commission_pct is NULL, display 'No Commission'.
-- Otherwise display 'Gets Commission'.
--
-- Oracle DECODE can directly match NULL.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    commission_pct,
    DECODE(
        commission_pct,
        NULL, 'No Commission',
        'Gets Commission'
    ) AS commission_status
FROM hr.employees;


-- ----------------------------------------------------------------
-- 16. Calculate bonus based on department using DECODE
-- Question:
-- Department 60 -> 20% bonus
-- Department 80 -> 15% bonus
-- Department 50 -> 10% bonus
-- Other departments -> 5% bonus
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    DECODE(
        department_id,
        60, salary * 0.20,
        80, salary * 0.15,
        50, salary * 0.10,
        salary * 0.05
    ) AS bonus
FROM hr.employees;



-- ================================================================
-- NULLIF() - EXAMPLES
--
-- Syntax:
-- NULLIF(expression1, expression2)
--
-- If expression1 = expression2 -> returns NULL
-- Otherwise                     -> returns expression1
-- ================================================================


-- ----------------------------------------------------------------
-- 17. Compare salary with 10,000
-- Question:
-- Return NULL if salary is exactly 10,000.
-- Otherwise return the original salary.
--
-- Example:
-- salary = 10000 -> NULL
-- salary = 12000 -> 12000
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    NULLIF(salary, 10000) AS salary_result
FROM hr.employees;


-- ----------------------------------------------------------------
-- 18. Compare department ID with 60
-- Question:
-- If department_id is 60, return NULL.
-- Otherwise return the department ID.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    NULLIF(department_id, 60) AS department_result
FROM hr.employees;


-- ----------------------------------------------------------------
-- 19. Compare job ID with IT_PROG
-- Question:
-- If job_id is IT_PROG, return NULL.
-- Otherwise return the original job ID.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    job_id,
    NULLIF(job_id, 'IT_PROG') AS job_result
FROM hr.employees;


-- ----------------------------------------------------------------
-- 20. Combine NULLIF and NVL
-- Question:
-- If department_id is 60:
--     NULLIF returns NULL
--     NVL converts that NULL into 0
--
-- For other departments:
--     NULLIF returns the original department ID.
--
-- Example:
-- department_id = 60 -> NULLIF = NULL -> NVL = 0
-- department_id = 80 -> NULLIF = 80   -> NVL = 80
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    NULLIF(department_id, 60) AS nullif_result,
    NVL(
        NULLIF(department_id, 60),
        0
    ) AS final_department_id
FROM hr.employees;


/*
====================================================================
QUICK REVISION
====================================================================

1. NVL
-------
Purpose:
Replace a NULL value.

Syntax:
NVL(value, replacement)

Example:
NVL(commission_pct, 0)


2. NVL2
--------
Purpose:
Return one value when NOT NULL and another value when NULL.

Syntax:
NVL2(value, value_if_not_null, value_if_null)

Example:
NVL2(commission_pct, 'Yes', 'No')


3. COALESCE
-----------
Purpose:
Return the first NON-NULL value from multiple expressions.

Syntax:
COALESCE(value1, value2, value3, ...)

Example:
COALESCE(phone_number, email, 'No Contact')


4. DECODE
---------
Purpose:
Compare one expression with multiple equality values.

Syntax:
DECODE(expression,
       search1, result1,
       search2, result2,
       default)

Example:
DECODE(
    department_id,
    60, 'IT',
    80, 'Sales',
    'Other'
)


5. NULLIF
---------
Purpose:
Compare two values.

If both values are equal:
    Returns NULL

If they are different:
    Returns the first value

Syntax:
NULLIF(value1, value2)

Example:
NULLIF(salary, 10000)


====================================================================
EASY WAY TO REMEMBER
====================================================================

NVL       -> NULL? Replace it
NVL2      -> NULL or NOT NULL? Choose between two results
COALESCE  -> Find the first NON-NULL value
DECODE    -> Match a value and return a result
NULLIF    -> Same values? Convert to NULL
====================================================================
*/