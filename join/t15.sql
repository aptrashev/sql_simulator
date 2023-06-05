SELECT name,
       count(product_id) as times_purchased
FROM   (SELECT *
        FROM   (SELECT DISTINCT order_id,
                                unnest(product_ids) as product_id
                FROM   orders) as l join (SELECT product_id,
                                         name
                                  FROM   products) as r using(product_id) join (SELECT order_id,
                                                             time
                                                      FROM   courier_actions
                                                      WHERE  date_part('month', time) = 9
                                                         and date_part('year', time) = 2022
                                                         and action = 'deliver_order') as b using(order_id)) as g
GROUP BY name
ORDER BY times_purchased desc limit 10
