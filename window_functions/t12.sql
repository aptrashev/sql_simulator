select
    courier_id,
    orders_count,
    rank() over(order by orders_count desc ,courier_id asc) as courier_rank
from (
select
    courier_id,
    count(order_id) filter(where action = 'deliver_order') as orders_count
    
from courier_actions
group by courier_id
order by orders_count desc 
limit 283
) as s
order by orders_count desc
