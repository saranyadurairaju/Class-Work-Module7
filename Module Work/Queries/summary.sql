-- For Summary 

SELECT count(emp_no) AS Count, title
from mentorship_eligibility
group by title
order by Count desc;

SELECT DISTINCT on(title) title
from titles;

SELECT * from unique_titles
where title = 'Manager';

SELECT * 
from unique_titles AS ut
JOIN dept_manager AS dm
ON ut.emp_no=dm.emp_no
JOIN departments AS dept
ON dm.dept_no=dept.dept_no
where ut.title = 'Manager';

SELECT count(emp_no)
from dept_employees
WHERE ((to_date = '9999-01-01') AND 
	   (dept_no = 'd007' OR dept_no = 'd008') AND
		 (from_date BETWEEN '1988-01-01' AND '1988-12-31'));
		 
SELECT count(emp_no)
from dept_employees
WHERE ((to_date = '9999-01-01') AND 
	   (dept_no = 'd007' OR dept_no = 'd008') AND
		 (from_date BETWEEN '1988-01-01' AND '1988-12-31'))
GROUP BY dept_no;


SELECT ut.emp_no, dm.from_date, dm.dept_no, dept.dept_name 
from unique_titles AS ut
JOIN dept_manager AS dm
ON ut.emp_no=dm.emp_no
JOIN departments AS dept
ON dm.dept_no=dept.dept_no
where ut.title = 'Manager';


-- -------------------------------------------------------------

SELECT SUM(count) FROM retiring_titles;

SELECT (emp_no) from mentorship_eligibility;
