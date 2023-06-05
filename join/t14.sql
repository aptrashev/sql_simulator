select
    r.user_id as user_id,
    count(l.order_id) as orders_count,
    round(avg(r.avg_order_size),2) as avg_order_size,
    round(sum(order_price),2) as sum_order_value,
    round(avg(order_price),2) as avg_order_value,
    round(min(order_price),2) as min_order_value,
    round(max(order_price),2) as max_order_value
from (
    select 
        l.order_id as order_id,
        sum(r.price) as order_price 
    from
        (
        select order_id, unnest(product_ids) as product_id
        from orders 
        ) as l
        join 
        (
        select product_id, price
        from products
        ) as r
        using(product_id)
    group by l.order_id
    order by order_id

) as l
join 
(  
    SELECT user_id,order_id,round(avg(array_length(product_ids, 1)), 2) as avg_order_size
    FROM (
    SELECT user_id, order_id
    FROM   user_actions
    WHERE  order_id not in (SELECT order_id FROM   user_actions WHERE  action = 'cancel_order')) t
    LEFT JOIN orders using(order_id)
    GROUP BY user_id,order_id
    ORDER BY user_id 
) as r
using(order_id)
group by user_id
order by user_id
limit 1000
