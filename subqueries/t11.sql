select 
    product_id,
    name,
    price,
    case
        when price > (select round(avg(price),2) from products) + 50 then price * 0.85
        when price < (select round(avg(price),2) from products) - 50 then price * 0.90
        else price
    end as new_price
from products
order by price desc, product_id
