"""
Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

Return the result table in any order.
"""

with cte as
(select product_id
from Sales
where sale_date < "2019-01-01" or sale_date > "2019-03-31")

select distinct s.product_id, p.product_name
from Sales s
left join Product p on p.product_id = s.product_id
where s.product_id not in (select product_id from cte)