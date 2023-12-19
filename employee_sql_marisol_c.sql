SELECT *
FROM EMPLOYEES
JOIN SALARIES ON SALARIES.EMP_NO = EMPLOYEES.EMP_NO

--List the employee number, last name, first name, sex,
--and salary of each employee (2 points)

SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	E.SEX,
	S.SALARY
FROM EMPLOYEES AS E
JOIN SALARIES AS S ON S.EMP_NO = E.EMP_NO

--List the first name, last name, and hire date for
--the employees who were hired in 1986 (2 points)

	
SELECT FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM EMPLOYEES WHERE DATE_PART('year',HIRE_DATE) = 1986;
													
--List the manager of each department along with their department number,
--department name, employee number, last name, and first name (2 points)


SELECT DM.DEPT_NO,
	DEP.DEPT_NAME,
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM DEPT_MANAGER AS DM
JOIN EMPLOYEES AS E ON DM.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS AS DEP ON DM.DEPT_NO = DEP.DEPT_NO;

-- List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name (2 points)


SELECT DEP.DEPT_NO,
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	DEP.DEPT_NAME
FROM DEPT_EMP AS DE
JOIN EMPLOYEES AS E ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS AS DEP ON DE.DEPT_NO = DEP.DEPT_NO;

--List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B (2 points)

SELECT 
	E.FIRST_NAME,
	E.LAST_NAME,
	E.SEX
FROM EMPLOYEES AS E WHERE E.FIRST_NAME='Hercules' AND E.LAST_NAME LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT 
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM DEPT_EMP AS DE
JOIN EMPLOYEES AS E ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS AS DEP ON DE.DEPT_NO = DEP.DEPT_NO WHERE DEP.DEPT_NAME= 'Sales'

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name (4 points)

SELECT 
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	DEP.DEPT_NAME
FROM DEPT_EMP AS DE
JOIN EMPLOYEES AS E ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS AS DEP ON DE.DEPT_NO = DEP.DEPT_NO WHERE DEP.DEPT_NAME= 'Sales' OR DEP.DEPT_NAME= 'Development'

--List the frequency counts, in descending order, of all the employee last names (that is, 
--how many employees share each last name) (4 points)

SELECT 
	E.LAST_NAME, COUNT(1)
FROM EMPLOYEES AS E
GROUP BY E.LAST_NAME ORDER BY 2 DESC

