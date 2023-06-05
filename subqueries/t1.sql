SELECT round(avg(orders_count), 2) as orders_avg
FROM   (SELECT user_id,
               count(order_id) as orders_count
        FROM   user_actions
        WHERE  action = 'create_order'
        GROUP BY user_id) as t1
