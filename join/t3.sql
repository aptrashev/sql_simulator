select 
    a.user_id as user_id_left,
    b.user_id as user_id_right,
    a.order_id as order_id,
    a.time as time,
    a.action as action,
    b.sex as sex,
    b.birth_date as birth_date

from user_actions as a
    left join users as b 
    using(user_id)

order by user_id_left
