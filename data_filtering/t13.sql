select
    courier_id
from couriers
where date_part('year',birth_date) between '1990' and '1995'
order by courier_id
