SELECT count(distinct a.user_id) as users_count
FROM   user_actions as a
    LEFT JOIN users as b using(user_id)
