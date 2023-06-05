select min(time) as first_delivery, max(time) as last_delivery
from courier_actions
where action = 'deliver_order'
