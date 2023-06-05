select
    date_trunc('month',date)::date as start_month,
    start_date,
    date - start_date as day_number,
    count(DISTINCT user_id)::float / max(count(DISTINCT user_id)) over() as retention
    
from
(
select 
    user_id, min(time::date) over (partition by user_id) as start_date,
    time::date as date
from user_actions
) t1
where start_date = '2022-08-25'
group by start_date,date
