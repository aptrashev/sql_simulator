select
    order_id
from user_actions
where action = 'create_order' and date_part('month',time) = 8
order by order_id
