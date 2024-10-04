"""
Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

Return the result table in any order.
"""

select actor_id, director_id
from actordirector
group by actor_id, director_id
having count(timestamp) >=3