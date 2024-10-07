"""
Each node in the tree can be one of three types:

"Leaf": if the node is a leaf node.
"Root": if the node is the root of the tree.
"Inner": If the node is neither a leaf node nor a root node.
Write a solution to report the type of each node in the tree.

Return the result table in any order.
"""

select id, 
       case when p_id is null then 'Root'
       when id not in (select p_id from tree where p_id is not null) then 'Leaf'
       else 'Inner' end as 'type' 
from Tree
