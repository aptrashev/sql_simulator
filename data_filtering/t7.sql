select
    product_id,
    name,
    price,
    '25%' as discount,
    price * 0.75 as new_price
from products
where name like '%чай%' and name != 'чайный гриб' and price > 60 
order by product_id
