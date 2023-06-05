select name, length(name) as name_length, price
from products
order by name_length desc
limit 1
