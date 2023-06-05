select 
    l.order_id as order_id,
    l.product_id as product_id,
    r.price 
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
order by order_id, product_id
limit 1000
