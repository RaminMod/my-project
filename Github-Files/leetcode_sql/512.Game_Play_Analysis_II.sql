"""
Table: 
    Activity: player_id, device_id, event_date, games_played
(player_id, event_date) is the primary key of this table.

This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

Write an SQL query to report the device that is first logged in for each player

Return the result table in any order.
"""
with cte as
(select *, row_number() over(partition by even_date order by event_date) as rnk
from Activity )

select player_id, device_id
from cte
where rnk = 1