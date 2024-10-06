"""
Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.
"""

# Approach 1
with cte as
(select d2.name as Department, 
        e1.name as Employee, 
        e1.salary, 
        dense_rank() over(partition by d2.id order by salary desc) as rnk
from Employee e1
left join Department d2 on e1.departmentId = d2.id)

select Department, Employee, salary
from cte
where rnk = 1

# Approach 2
-- with cte as
-- (select d.name as Department, e.name as Employee, e.salary, max(salary) over(partition by e.departmentId) as max_salary
-- from Employee e
-- left join Department d on e.departmentId = d.id)

-- select Department, Employee, Salary
-- from cte
-- where salary = max_salary
