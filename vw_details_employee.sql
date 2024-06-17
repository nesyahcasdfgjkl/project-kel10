CREATE VIEW vw_details_employee AS
SELECT
	e.id,
    e.first_name,
    e.last_name,
    e.gender,
    e.email,
    e.phone,
    e.hire_date,
    e.salary,
    e.manager,
    e.job,
    d.name
FROM tbl_employees e
INNER JOIN tbl_departments d ON e.department = d.id;

select * from vw_details_employee
where first_name = 'John';