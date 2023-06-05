SELECT l.birth_date as users_birth_date,
       l.users_count as users_count,
       r.birth_date as couriers_birth_date,
       r.couriers_count as couriers_count
FROM   (SELECT birth_date,
               count(user_id) as users_count
        FROM   users
        WHERE  birth_date is not null
        GROUP BY birth_date) as l full join (SELECT birth_date,
                                            count(courier_id) as couriers_count
                                     FROM   couriers
                                     WHERE  birth_date is not null
                                     GROUP BY birth_date) as r using(birth_date)
ORDER BY users_birth_date, couriers_birth_date
