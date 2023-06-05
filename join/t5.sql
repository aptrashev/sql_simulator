SELECT a.user_id as user_id_left,
       b.user_id as user_id_right,
       a.order_id as order_id,
       a.time as time,
       a.action as action,
       b.sex as sex,
       b.birth_date as birth_date
FROM   user_actions as a
    LEFT JOIN users as b using(user_id)
WHERE  b.user_id is not null
ORDER BY user_id_left
