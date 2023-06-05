select 
    l.order_id as order_id,
--    l.product_id as product_id,
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
limit 1000
