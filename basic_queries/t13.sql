select product_id, name, price as old_price, round(price * 1.05,1)as new_price
from products
order by new_price desc, product_id
