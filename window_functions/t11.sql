select
    user_id,
    order_id,
    action,
    time,
    count(action) filter(where action = 'create_order') over(partition by user_id order by time) as created_orders,
    count(action) filter(where action = 'cancel_order') over(partition by user_id order by time) as canceled_orders,
    round(count(action) filter(where action = 'cancel_order') over(partition by user_id order by time) / count(order_id) over(partition by user_id order by time)::decimal,2) as cancel_rate

from user_actions
group by user_id, order_id, action, time

order by user_id, order_id, time
limit 1000
