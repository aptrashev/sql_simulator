-- with sq as (
-- select order_id
-- from user_actions
-- where action = 'cancel_order '
--)
SELECT DISTINCT l.user_id as user_id,
                r.order_id as order_id,
                r.product_ids as product_ids
FROM   user_actions as l
    LEFT JOIN orders as r using(order_id)
WHERE  order_id not in (SELECT order_id
                        FROM   user_actions
                        WHERE  action = 'cancel_order')
ORDER BY user_id, order_id limit 1000

-- this better
-- SELECT user_id,
--       order_id,
--       product_ids
-- FROM   (SELECT user_id,
--               order_id
--         FROM   user_actions
--         WHERE  order_id not in (SELECT order_id
--                                 FROM   user_actions
--                                 WHERE  action = 'cancel_order')) t
--     LEFT JOIN orders using(order_id)
-- ORDER BY user_id, order_id limit 1000

