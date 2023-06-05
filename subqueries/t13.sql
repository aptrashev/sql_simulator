with a as (
    select product_id, price
    from products
    order by price desc
    limit 5
),
b as (
    select  order_id, product_ids, unnest(product_ids) as product_id
    from orders
)
select DISTINCT order_id, product_ids
from b
where product_id in (select product_id from a) 
order by order_id

