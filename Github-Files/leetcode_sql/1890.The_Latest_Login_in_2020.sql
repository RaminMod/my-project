"""
Write a solution to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020.

Return the result table in any order.
"""

# Approach 1
select user_id, max(time_stamp) as last_stamp
from Logins
where year(time_stamp) = '2020'
group by user_id

# Approach 2
-- select distinct user_id, first_value(time_stamp) over(partition by user_id  order by time_stamp desc) as last_stamp
-- from Logins
-- where year(time_stamp) = '2020'

# Approach 3
-- with cte as
-- (select *, dense_rank() over(partition by user_id order by time_stamp desc) as rnk
-- from Logins
-- where year(time_stamp) = '2020')

-- select user_id, time_stamp as last_stamp 
-- from cte
-- where rnk = 1