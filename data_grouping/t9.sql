SELECT courier_id,
       count(distinct order_id) as delivered_orders
FROM   courier_actions
WHERE  action = 'deliver_order'
   and date_part('month', time) = 9
   and date_part('year', time) = 2022
GROUP BY courier_id having count(distinct order_id) = 1
ORDER BY courier_id
