select user_id 
from user_actions
where action = 'create_order'
group by user_id
having max(time) < '2022-09-08'
order by user_id

