select product_id, name, price
from products
where price >= (select avg(price) from products) + 20
order by product_id desc
