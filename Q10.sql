SELECT employee_id,first_name,department_id
	FROM employees
	WHERE (manager_id, department_id) =  (SELECT manager_id,department_id FROM
	employees
	WHERE employee_id=104)
	AND employee_id<>104;