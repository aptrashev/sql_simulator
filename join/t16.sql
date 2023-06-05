select COALESCE(sex,'unknown') as sex, round(avg(cancel_rate),3) as avg_cancel_rate
from 
    (
    SELECT user_id,
    round(count(order_id) filter(WHERE action = 'cancel_order') / count(distinct order_id)::decimal,
    2) as cancel_rate
    FROM   user_actions
    GROUP BY user_id
    ORDER BY user_id
    ) as l
    left join 
    (select user_id, sex from users) as r
    using(user_id)
group by sex
order by sex
