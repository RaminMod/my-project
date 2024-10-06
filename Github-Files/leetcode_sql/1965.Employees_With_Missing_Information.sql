"""
Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:

The employee's name is missing, or
The employee's salary is missing.
Return the result table ordered by employee_id in ascending order.
"""

select e.employee_id
from Employees e
left join Salaries s on e.employee_id = s.employee_id
where salary is null
union all
select s.employee_id
from Salaries s
left join Employees e on e.employee_id = s.employee_id
where name is null
order by employee_id