-- DATA ANALYSIS 
-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT E.EMP_NO, E.FIRST_NAME, E.LAST_NAME, E.SEX, S.SALARY
FROM EMPLOYEES E
JOIN SALARIES S ON S.EMP_NO = E.EMP_NO;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE EXTRACT (YEAR FROM HIRE_DATE) = '1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT DM.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.FIRST_NAME, E.LAST_NAME
FROM DEPT_MANAGER DM
JOIN DEPARTMENTS D ON DM.DEPT_NO = D.DEPT_NO
JOIN EMPLOYEES E ON E.EMP_NO = DM.EMP_NO;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT E.EMP_NO, E.FIRST_NAME, E.LAST_NAME, DE.DEPT_NO, D.DEPT_NAME
FROM EMPLOYEES E
JOIN DEPT_EMP DE ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT FIRST_NAME, LAST_NAME, SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
AND LAST_NAME LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT E.EMP_NO, E.FIRST_NAME, E.LAST_NAME, D.DEPT_NAME
FROM EMPLOYEES E
JOIN DEPT_EMP DE ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT E.EMP_NO, E.FIRST_NAME, E.LAST_NAME, D.DEPT_NAME
FROM EMPLOYEES E
JOIN DEPT_EMP DE ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME = 'Sales'
OR D.DEPT_NAME = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT LAST_NAME, COUNT(LAST_NAME) AS FREQUENCY
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY FREQUENCY DESC;
