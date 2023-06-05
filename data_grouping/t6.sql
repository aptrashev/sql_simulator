select array_length(product_ids, 1) as order_size, count(order_id) as orders_count 
from orders
group by order_size
order by order_size
