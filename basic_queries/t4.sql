-- определите 5 самых дорогих товаров в таблице products, которые доставляет наш сервис.
-- Выведите их наименования и цену.
select name,price
from products
order by price desc
limit 5
