"""
Write a solution to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Stadium table:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
Output: 
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
Explanation: 
The four rows with ids 5, 6, 7, and 8 have consecutive ids and each of them has >= 100 people attended. Note that row 8 was included even though the visit_date was not the next day after row 7.
The rows with ids 2 and 3 are not included because we need at least three consecutive ids.
"""

# Approach 1
with cte as
(select *, id - row_number() over(order by id) as diff
from stadium
where people >= 100)

select id, visit_date, people
from cte
where diff in (select diff 
               from cte 
               group by diff 
               having count(id) >=3 )

# Approach 2
-- select distinct s1.*
-- from stadium s1 
-- join stadium s2 join stadium s3 on (s1.id = s2.id - 1 and s1.id = s3.id - 2) or 
--                                    (s1.id = s2.id + 1 and s1.id = s3.id - 1) or
--                                    (s1.id = s2.id + 1 and s1.id = s3.id + 2)
-- where s1.people >= 100 and s2.people >= 100 and s3.people >= 100
-- order by visit_date