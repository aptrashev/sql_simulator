SELECT user_id,
       order_id,
       product_ids
FROM   user_actions
    LEFT JOIN orders using(order_id)
ORDER BY user_id, order_id limit 1000
