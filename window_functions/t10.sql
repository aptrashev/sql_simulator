select 
    product_id,
    name,
    price,
    round(avg(price) over(),2) as avg_price,
    round(avg(price) filter(where price != (select max(price) from products)) over(),2) as avg_price_filtered

from products
order by price desc, product_id
