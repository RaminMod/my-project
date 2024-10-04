"""
Reformat the table such that there is a department id column and a revenue column for each month.

Return the result table in any order.
"""

# Approach 1
select id, 
       max(case when month = 'Jan' then revenue else null end) as Jan_Revenue,
       max(case when month = 'Feb' then revenue else null end) as Feb_Revenue,
       max(case when month = 'Mar' then revenue else null end) as Mar_Revenue,
       max(case when month = 'Apr' then revenue else null end) as Apr_Revenue,
       max(case when month = 'May' then revenue else null end) as May_Revenue,
       max(case when month = 'Jun' then revenue else null end) as Jun_Revenue,
       max(case when month = 'Jul' then revenue else null end) as Jul_Revenue,
       max(case when month = 'Aug' then revenue else null end) as Aug_Revenue,
       max(case when month = 'Sep' then revenue else null end) as Sep_Revenue,
       max(case when month = 'Oct' then revenue else null end) as Oct_Revenue,
       max(case when month = 'Nov' then revenue else null end) as Nov_Revenue,
       max(case when month = 'Dec' then revenue else null end) as Dec_Revenue
from Department
group by id

# Approach 2
-- select id, 
--        max(if(month = 'Jan', revenue, null)) as Jan_Revenue,
--        max(if(month = 'Feb', revenue, null)) as Feb_Revenue,
--        max(if(month = 'Mar', revenue, null)) as Mar_Revenue,
--        max(if(month = 'Apr', revenue, null)) as Apr_Revenue,
--        max(if(month = 'May', revenue, null)) as May_Revenue,
--        max(if(month = 'Jun', revenue, null)) as Jun_Revenue,
--        max(if(month = 'Jul', revenue, null)) as Jul_Revenue,
--        max(if(month = 'Aug', revenue, null)) as Aug_Revenue,
--        max(if(month = 'Sep', revenue, null)) as Sep_Revenue,
--        max(if(month = 'Oct', revenue, null)) as Oct_Revenue,
--        max(if(month = 'Nov', revenue, null)) as Nov_Revenue,
--        max(if(month = 'Dec', revenue, null)) as Dec_Revenue
-- from Department
-- group by id

