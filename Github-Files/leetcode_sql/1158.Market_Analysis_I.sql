"""
Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.

Return the result table in any order.
"""


# Approach 1
Select u.user_id as buyer_id, 
       join_date, 
       sum(case when year(o.order_date) = 2019 then 1 else 0 end) as orders_in_2019
From users u
Left join Orders o On u.user_id = o.buyer_id
Group by u.user_id

# Approach 2
-- with cte as
-- (select u.user_id, 
--        sum(case when year(o.order_date) = 2019 then 1 else 0 end) as orders_in_2019
-- from users u
-- left join orders o on u.user_id = o.buyer_id
-- group by u.user_id)

-- select c.user_id as buyer_id, u.join_date, c.orders_in_2019
-- from cte c
-- left join users u on c.user_id = u.user_id