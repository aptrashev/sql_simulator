select 
    date,
    (sum(revenue) / count(user_id)) as arpuu,
    (sum(revenue) / count(order_id)) as aov
    
from (
select
    date,
    user_id,
    order_id,
    sum(price) as revenue
from 
(
    select
        order_id, creation_time::date as date, unnest(product_ids) as product_id
    from orders
    where order_id not in (select order_id from user_actions where action = 'cancel_order')
) as l
join 
(
    select user_id, order_id
    from user_actions

    --where user_id in (select user_id from user_actions where action = 'cancel_order')
)as g
using(order_id)
join
(
    select product_id, price
    from products
) as r
using(product_id)
group by date, user_id, order_id
order by date
) as tt
group by date
