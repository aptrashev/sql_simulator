select
    product_id,
    name,
    price,
    round(max(price) over(),2) as max_price,
    round(price / max(price) over(),2) as share_of_max
from products
order by price desc, product_id
