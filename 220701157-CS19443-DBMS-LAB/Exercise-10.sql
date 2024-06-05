1. List the department IDs for departments that do not contain the job ID ST_CLERK, using SET
   operators.

	SELECT department_id FROM departments
	MINUS
	SELECT department_id FROM employees
	WHERE job_id = ’ST_CLERK’;

2. Display the country ID and the name of the countries that have no departments located in
   them, using SET operators.
	
	SELECT country_id,country_name FROM countries
	MINUS
	SELECT l.country_id,c.country_name FROM locations l, countries c
	WHERE l.country_id = c.country_id;

3. Produce a list of jobs for departments 10, 50, and 20, in that order. Display job ID and
   department ID, using SET operators.
   
	COLUMN dummy NOPRINT
	SELECT job_id, department_id, ’x’ dummy FROM employees
	WHERE department_id = 10
	UNION
	SELECT job_id, department_id, ’y’ FROM employees
	WHERE department_id = 50
	UNION
	SELECT job_id, department_id, ’z’ FROM employees
	WHERE department_id = 20;

4. List the employee IDs and job IDs of those employees who currently have the job title that they
   held before beginning their tenure with the company.

	SELECT employee_id,job_id
	FROM employees
	INTERSECT
	SELECT employee_id,job_id
	FROM job_history;

5. Write a compound query that lists the following:
   • Last names and department ID of all the employees from the EMPLOYEES table,
   regardless of whether or not they belong to any department
   • Department ID and department name of all the departments from the DEPARTMENTS
   table, regardless of whether or not they have employees working in them

	SELECT last_name,department_id,TO_CHAR(null)
	FROM employees
	UNION
	SELECT TO_CHAR(null),department_id,department_name
	FROM departments;