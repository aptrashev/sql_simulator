select date_trunc('month', time) as month, action, count(order_id) as orders_count
from user_actions
group by month,action
order by month, action
