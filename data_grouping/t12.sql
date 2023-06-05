select
    case
        when date_part('year',(age(current_date, birth_date))) between 19 and 24 then '19-24'
        when date_part('year',(age(current_date, birth_date))) between 25 and 29 then '25-29' 
        when date_part('year',(age(current_date, birth_date))) between 30 and 35 then '30-35'
        when date_part('year',(age(current_date, birth_date))) between 36 and 41 then '36-41'
    end as group_age,
    count(user_id) as users_count
from users
where birth_date is not null
group by group_age
order by group_age
