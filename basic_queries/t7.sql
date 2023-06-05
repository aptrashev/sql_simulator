select name, upper(split_part(name,' ',1)) as first_word, price
from products
order by name
