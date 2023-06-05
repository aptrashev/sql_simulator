select user_id, round(count(order_id) filter(where action='cancel_order') / count(DISTINCT order_id)::decimal,2)  as cancel_rate
from user_actions
group by user_id
order by user_id
