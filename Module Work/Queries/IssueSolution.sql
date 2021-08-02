DROP TABLE titles;

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(40) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
  PRIMARY KEY (emp_no,title,from_date)
);

SELECT * from titles;
SELECT count(emp_no) from titles;


-----------------------------------------------

DROP TABLE retirement_titles;

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles 
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows

DROP TABLE unique_titles;


SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * from unique_titles;
-----------------------------------------------

DROP TABLE retiring_titles;

SELECT COUNT(emp_no) AS count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * from retiring_titles;

------------------------------------------------------------------
SELECT * 
INTO titles_new
from titles
ORDER BY emp_no, to_date DESC;

SELECT count(emp_no) from titles_new;

DROP TABLE mentorship_eligibility;

-- SELECT DISTINCT ON(t.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
-- INTO mentorship_eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_employees AS de
ON (e.emp_no = de.emp_no)
JOIN titles_new AS t
ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'))
ORDER BY e.emp_no, t.from_date DESC;

SELECT * from mentorship_eligibility;

SELECT * from mentorship_eligibility where emp_no = 10095; 

SELECT count(emp_no) from mentorship_eligibility;

SELECT * from titles_new where emp_no = 10095;
------------------------------------------------------------------