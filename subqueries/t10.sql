SELECT courier_id,
       birth_date,
       sex
FROM   couriers
WHERE  courier_id in (SELECT courier_id
                      FROM   courier_actions
                      WHERE  date_part('month', time) = 9
                         and date_part('year', time) = 2022
                         and action = 'deliver_order'
                      GROUP BY courier_id having count(distinct order_id) >= 30)
ORDER BY courier_id
