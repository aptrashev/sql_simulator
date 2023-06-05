select 
    a.user_id as user_id_left,
    b.user_id as user_id_right,
    a.order_id as order_id,
    a.time as time,
    a.action as action,
    b.sex as sex,
    b.birth_date as birth_date
    
from user_actions as a 
    join users as b
    on a.user_id = b.user_id

order by a.user_id
