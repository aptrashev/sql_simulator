select 
    birth_date,
    courier_id,
    sex
from 
    couriers
where birth_date is null
order by courier_id 
