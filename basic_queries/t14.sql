select
    product_id,
    price as old_price,
    name,
    case
    when name = 'икра' then price
    when price > 100 then price * 1.05
    else price
    end as new_price
from products
order by new_price desc, product_id
    
