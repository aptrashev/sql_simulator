-- as well working
-- SELECT min(age((SELECT max(time)::date
--                 FROM   courier_actions), birth_date))::varchar as min_age
-- FROM   couriers
-- WHERE  sex = 'male'


-- криво
select 
    concat(date_part('year',min(age((select max(time)::date from courier_actions),birth_date)))::varchar,' years ',
    date_part('month',min(age((select max(time)::date from courier_actions),birth_date)))::varchar,' mons ',
    date_part('days',min(age((select max(time)::date from courier_actions),birth_date)))::varchar,' days') as min_age
from couriers
where sex = 'male'
