select 
    user_id,
    order_id,
    time
from user_actions
where action = 'create_order' and time > '2022-09-06'
order by order_id

