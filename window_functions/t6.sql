SELECT user_id,
       order_id,
       time,
       row_number() OVER(PARTITION BY user_id
                         ORDER BY time) as order_number,
       lag(time) OVER(PARTITION BY user_id) as time_lag,
       age(time, lag(time) OVER(PARTITION BY user_id)) as time_diff
FROM   user_actions
WHERE order_id not in (SELECT order_id
                     FROM   user_actions
                     WHERE  action = 'cancel_order') --and order_id not in (select user_id from user_actions where  action = 'cancel_order')
GROUP BY user_id, order_id, time
ORDER BY user_id, order_number limit 1000
