select 
    date,
    revenue,
    sum(revenue) over(order by date) as total_revenue,
    round((lag(revenue,0) over(order by date) * 100 / lag(revenue,1) over(order by date)) - 100,2) as revenue_change
    
from (
select
    date,
    sum(price) as revenue
from 
(
    select
        creation_time::date as date, unnest(product_ids) as product_id
    from orders
    where order_id not in (select order_id from user_actions where action = 'cancel_order')
) as l
join
(
    select product_id, price
    from products
) as r
using(product_id)
group by date
order by date
) as t1
