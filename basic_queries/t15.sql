select
    product_id,
    name,
    price,
    round(price * 20/120, 2) as tax,
    round(price - price *20/120, 2) as price_before_tax
    
from products

order by price_before_tax desc, product_id
