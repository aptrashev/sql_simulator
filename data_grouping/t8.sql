SELECT courier_id,
       count(order_id) as delivered_orders
FROM   courier_actions
WHERE  action = 'deliver_order'
   and time between '2022-08-01'
   and '2022-09-01'
GROUP BY courier_id
ORDER BY delivered_orders desc limit 3
