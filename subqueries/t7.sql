with sq as (
    select  order_id
    from user_actions
    where action = 'cancel_order'
)

select order_id
from user_actions
where order_id not in (select * from sq)
order by  order_id
limit 1000
