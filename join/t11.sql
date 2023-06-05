SELECT user_id,
      round(avg(array_length(product_ids,1)),2) as avg_order_size
FROM   (SELECT user_id, 
              order_id
        FROM   user_actions
        WHERE  order_id not in (SELECT order_id
                                FROM   user_actions
                                WHERE  action = 'cancel_order')) t
    LEFT JOIN orders using(order_id)
group by user_id
ORDER BY user_id limit 1000
