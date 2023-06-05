select courier_id, coalesce(date_part('year', birth_date)::varchar,'unknown') as birth_year
from couriers
order by birth_year desc, courier_id
