select array_length(product_ids, 1) as order_size, count(order_id) as orders_count 
from orders
group by order_size
having count(order_id) > 5000
order by order_size
