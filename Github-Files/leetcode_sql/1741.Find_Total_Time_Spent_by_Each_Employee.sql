"""
Write a solution to calculate the total time in minutes spent by each employee on each day at the office. Note that within one day, an employee can enter and leave more than once. The time spent in the office for a single entry is out_time - in_time.

Return the result table in any order.
"""

select event_day as day, emp_id, sum(out_time - in_time) as total_time
from Employees
group by emp_id, event_day 