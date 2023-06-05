SELECT user_id,
       order_id,
       action,
       time
FROM   user_actions
WHERE  date_part('month', time) = 8
   and date_part('dow', time) = 3
   and date_part('hour', time) >= 12
   and date_part('hour', time) < 16
   and action = 'cancel_order'
ORDER BY time desc
