select 
    date,
    daily_revenue,
    case
    when round(lag(daily_revenue,0) over(order by date) - lag(daily_revenue,1) over(order by date),1) is null then 0
    else round(lag(daily_revenue,0) over(order by date) - lag(daily_revenue,1) over(order by date),1)
    end revenue_growth_abs,
    case 
    when round((lag(daily_revenue,0) over(order by date)) * 100 / (lag(daily_revenue,1) over(order by date)) - 100,1) is null then 0
    else round((lag(daily_revenue,0) over(order by date)) * 100 / (lag(daily_revenue,1) over(order by date)) - 100,1)
    end as revenue_growth_percentage
--    round(lag(daily_revenue,0) over(order by date) - lag(daily_revenue,1) over(order by date),2) as revenue_growth_abs,
--    round((lag(daily_revenue,0) over(order by date)) * 100 / (lag(daily_revenue,1) over(order by date)) - 100,2) as revenue_growth_percentage
from (
select 
    date,
    sum(price) as daily_revenue
    
from(
(
    select order_id, creation_time::date as date, unnest(product_ids) as product_id
    from orders
    where order_id not in (select order_id from user_actions where action = 'cancel_order')
) as l
join
(
    select product_id, price
    from products
) as r
using(product_id)
) as sq
group by date
) as sq2
