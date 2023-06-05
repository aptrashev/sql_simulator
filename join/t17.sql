-- my solution
select order_id
from 
(
select
    order_id,
    l.time  - r.creation_time as diff

from
    (
    select order_id, action,time
    from courier_actions
    where action = 'deliver_order'
    ) as l
    join 
    (
    select order_id, creation_time
    from orders
    ) as r
    using(order_id)

) as s
order by diff desc
limit 10

-- also possiblea

-- SELECT order_id
-- FROM   orders
--     RIGHT JOIN (SELECT order_id,
--                       time as deliver_time
--                 FROM   courier_actions
--                 WHERE  action = 'deliver_order') as t using (order_id)
-- ORDER BY deliver_time - creation_time desc limit 10
