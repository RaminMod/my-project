"""
Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

Note that you must write a single update statement, do not write any select statement for this problem.
"""
# Approach 1
update salary
set sex = case when sex = 'f' then 'm'
               when sex = 'm' then 'f' end