select min(age(birth_date))::varchar as min_age
from couriers
where sex = 'male'
