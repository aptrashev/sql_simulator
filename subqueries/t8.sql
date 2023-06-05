with sq as (
    SELECT round(avg(orders_count), 2) as orders_avg
    FROM(SELECT user_id, count(order_id) as orders_count FROM user_actions WHERE  action = 'create_order' GROUP BY user_id) as sq
)

select user_id, count(DISTINCT order_id) as orders_count, (select * from sq) as orders_avg, count(DISTINCT order_id) - (select * from sq) as orders_diff
from user_actions
group by user_id
order by user_id
limit 1000
