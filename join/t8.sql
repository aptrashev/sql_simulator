SELECT l.user_id as user_id,
       r.name as name
FROM   (SELECT user_id
        FROM   users limit 100) as l cross join (SELECT name
                                         FROM   products) as r
ORDER BY user_id, name
