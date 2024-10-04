"""
Write a solution to report the distance traveled by each user.

Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.
"""

# Approach 1
select distinct u.name,
    case when r.distance is not null then sum(distance) over(partition by r.user_id order by r.user_id) else 0 end as travelled_distance
from users u
left join rides r on u.id = r.user_id
order by travelled_distance desc, u.name

# Approach 2
-- select name, 
--        coalesce(sum(distance), 0) as travelled_distance
-- from Users u 
-- left join Rides r on u.id = r.user_id
-- group by u.id
-- order by travelled_distance desc, name asc