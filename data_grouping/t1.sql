select sex, count(sex) as couriers_count
from couriers
group by sex
order by couriers_count
