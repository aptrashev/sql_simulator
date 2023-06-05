SELECT count(distinct a.user_id) as users_count
FROM   user_actions as a join users as b
        ON a.user_id = b.user_id
