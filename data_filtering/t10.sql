select
    user_id,
    birth_date
from users
where birth_date is not null and sex = 'male'
order by birth_date desc
limit 50
