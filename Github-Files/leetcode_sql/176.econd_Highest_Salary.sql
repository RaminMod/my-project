"""
Medium

Companies: 
Amazon, Infosys

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
The result format is in the following example.

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
"""

# Write your MySQL query statement below
# Approach 1
-- select max(salary) as SecondHighestSalary
-- from employee
-- where salary not in (select max(salary) from Employee)

# Approach 2
-- SELECT (SELECT DISTINCT salary 
--         FROM Employee 
--         ORDER BY salary DESC 
--         LIMIT 1 
--         OFFSET 1) AS SecondHighestSalary;

# Approach 3
with cte as
(select *, dense_rank() over (order by salary desc) as r
from employee)

select ifnull((select salary from cte where r = 2 limit 1), null) as SecondHighestSalary