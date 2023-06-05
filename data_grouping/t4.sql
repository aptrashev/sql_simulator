select DATE_PART('year',(age(current_date,birth_date))) as age,sex, count(user_id) as users_count
from users
group by age, sex
having dATE_PART('year',(age(current_date,birth_date))) is not null
order by age, sex
