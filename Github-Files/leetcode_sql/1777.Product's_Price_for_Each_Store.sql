"""
Write and SQL query to find  the price of each product in each store.

Return the result table in any order
"""

# Approach 1
select product_id,
       max(case when store = 'store1' then price else null end) as store1,
       max(case when store = 'store2' then price else null end) as store2,
       max(case when store = 'store3' then price else null end) as store3  
from products
group by product_id


# Approach 2
-- select product_id,
--        max(if(store = 'store1', price, null)) as store1,
--        max(if(store = 'store2', price, null)) as store2,
--        max(if(store = 'store3', price, null)) as store3
-- from products
-- group by product_id