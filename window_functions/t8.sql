select date, orders_count, 
       round(AVG(orders_count) over 
        (order by date rows between 3 preceding and 1 preceding),2) as moving_avg
from  (SELECT creation_time :: date as date,
              count(order_id) as orders_count,
              sum(count(order_id)) OVER (ORDER BY creation_time :: date) as orders_cum_count
       FROM   orders
       WHERE  order_id not in (SELECT order_id
                               FROM   user_actions
                               WHERE  action = 'cancel_order')
       GROUP BY date) as t1
order by date
