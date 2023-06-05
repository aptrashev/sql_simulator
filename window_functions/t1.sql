select
    product_id,
    name,
    price,
    row_number() over(order by price desc) as product_number,
    rank() over(order by price desc) as product_rank,
    dense_rank() over(order by price desc ) as product_dense_rank
from products
order by price desc
