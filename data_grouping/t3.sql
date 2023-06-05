select DATE_PART('year',(age(current_date,birth_date))) as age, count(user_id) as users_count
from users
group by age
order by age
