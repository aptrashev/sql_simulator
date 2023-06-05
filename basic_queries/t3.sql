select courier_id, order_id, action,time
from courier_actions
order by courier_id, action, time desc
limit 1000
