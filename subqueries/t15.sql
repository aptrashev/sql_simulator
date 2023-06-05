with avg_a as(
    select round(avg(date_part('year',age((select max(time) from user_actions)::date,birth_date)))) as avg_y 
    from users
)

select user_id, coalesce(date_part('year',age((select max(time)::date from user_actions),birth_date)), (select avg_y from avg_a)) as age
from users
order by 1 
