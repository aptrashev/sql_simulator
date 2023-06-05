select product_id, name, price as old_price, price * 1.05 as new_price
from products
order by new_price desc, product_id
