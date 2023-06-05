with sq as (
    select user_id, count(order_id) as order_id
    from user_actions
    where action = 'create_order'
    group by user_id
)
select round(avg(order_id),2) as orders_avg
from sq
