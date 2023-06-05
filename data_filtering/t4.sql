select 
    product_id,
    name,
    price as old_price,
    price * 0.80 as new_price
from products
where price * 0.80 >= 100
order by product_id 
