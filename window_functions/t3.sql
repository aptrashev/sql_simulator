select
    product_id,
    name,
    price,
    round(max(price) over(order by price desc),2) as max_price,
    round(min(price) over(order by price desc),2) as min_price
from products
order by price desc, product_id
