CREATE VIEW vw_feedback AS
SELECT 
    f.id,
    e1.id AS employee_id,
    e2.id AS manager_id,
    f.feedback_date,
    f.feedback_text,
    f.rating
FROM 
    tbl_feedback f
INNER JOIN 
    tbl_employees e1 ON f.employee_id = e1.id
INNER JOIN 
    tbl_employees e2 ON f.manager_id = e2.id;