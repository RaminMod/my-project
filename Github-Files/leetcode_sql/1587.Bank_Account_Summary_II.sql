"""
Write a solution to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account.

Return the result table in any order.
"""

select name, sum(amount) as balance
from Users u
left join Transactions t on u.account = t.account
group by name
having sum(amount) > 10000