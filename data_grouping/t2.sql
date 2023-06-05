select sex, DATE_PART('year',max(age(current_date,birth_date))) as max_age
from users
group by sex
order by max_age
