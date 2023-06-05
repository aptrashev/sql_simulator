select courier_id, date_part('year', birth_date) as birth_year
from couriers
order by birth_year desc, courier_id
