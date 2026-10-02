SELECT
    employee_id,
    first_name,
    salary,

    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_num

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    salary,

    ROW_NUMBER() OVER (
        ORDER BY salary ASC
    ) AS row_num

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS row_num

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    hire_date,

    ROW_NUMBER() OVER (
        ORDER BY hire_date ASC
    ) AS joining_order

FROM hr.employees;


SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        department_id,
        hire_date,

        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY hire_date DESC
        ) AS rn

    FROM hr.employees
)
WHERE rn = 1;


SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,

        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn

    FROM hr.employees
)
WHERE rn <= 3;


SELECT
    employee_id,
    first_name,
    salary,

    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    salary,

    RANK() OVER (
        ORDER BY salary ASC
    ) AS salary_rank

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    hire_date,

    RANK() OVER (
        ORDER BY hire_date ASC
    ) AS joining_rank

FROM hr.employees;


SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,

        RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank

    FROM hr.employees
)
WHERE salary_rank = 1;


SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,

        RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank

    FROM hr.employees
)
WHERE salary_rank <= 3;


SELECT
    employee_id,
    first_name,
    salary,

    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    salary,

    DENSE_RANK() OVER (
        ORDER BY salary ASC
    ) AS salary_rank

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    DENSE_RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank

FROM hr.employees;


SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        salary,

        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank

    FROM hr.employees
)
WHERE salary_rank = 2;


SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        salary,

        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank

    FROM hr.employees
)
WHERE salary_rank = 3;


SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,

        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank

    FROM hr.employees
)
WHERE salary_rank = 2;


SELECT
    employee_id,
    first_name,
    salary,

    FIRST_VALUE(salary) OVER (
        ORDER BY salary DESC
    ) AS highest_salary

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    salary,

    FIRST_VALUE(salary) OVER (
        ORDER BY salary ASC
    ) AS lowest_salary

FROM hr.employees;

SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_highest_salary

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    FIRST_VALUE(first_name) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS highest_paid_employee

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    hire_date,

    FIRST_VALUE(hire_date) OVER (
        PARTITION BY department_id
        ORDER BY hire_date ASC
    ) AS earliest_hire_date

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    hire_date,

    FIRST_VALUE(first_name) OVER (
        PARTITION BY department_id
        ORDER BY hire_date ASC
    ) AS first_joined_employee

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    salary,

    LAST_VALUE(salary) OVER (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_salary

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    salary,

    LAST_VALUE(salary) OVER (
        ORDER BY salary ASC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_salary

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    LAST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS department_lowest_salary

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    LAST_VALUE(first_name) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_paid_employee

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    hire_date,

    LAST_VALUE(hire_date) OVER (
        PARTITION BY department_id
        ORDER BY hire_date ASC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS latest_hire_date

FROM hr.employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,

    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_department_salary,

    LAST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_department_salary

FROM hr.employees
ORDER BY department_id, salary DESC;