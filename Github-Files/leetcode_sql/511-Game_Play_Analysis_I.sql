"""
Write a solution to find the first login date for each player.

Return the result table in any order.

The result format is in the following example.
"""
select player_id, min(event_date) as first_login
from Activity
group by player_id