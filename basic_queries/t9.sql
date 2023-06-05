select concat('Заказ № ', order_id, ' создан ', creation_time::date) as order_info
from orders
limit 200
