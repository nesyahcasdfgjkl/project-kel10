CREATE VIEW vw_performance_report AS
SELECT
    CONCAT(e.first_name , ' ', e.last_name) AS 'Name Employee',
	e.gender,
	e.salary,
	k.assigned_date,
	k.due_date,
	p.record_date,
	p.actual_value,
	p.comments
	FROM tbl_performance_report p
INNER JOIN tbl_employee_kpi k ON p.employee_kpi_id=k.id
INNER JOIN tbl_employees e ON k.employee_id = e.id;

SELECT* FROM vw_performance_report;
