select name,price, price::varchar as price_char
from products
order by name
