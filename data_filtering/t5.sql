select 
    product_id,
    name
from products
where split_part(name, ' ',1) = 'чай' or LENGTH(name) = 5
order by product_id
