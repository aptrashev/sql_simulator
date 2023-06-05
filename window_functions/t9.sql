select 
    courier_id,
    delivered_orders,
    round(avg(delivered_orders) over(),2) as avg_delivered_orders,
    (delivered_orders > avg(delivered_orders) over())::int as is_above_avg
    --case
    --    when delivered_orders > avg_delivered_orders then 1
from (
select
    courier_id,
    count(order_id) as delivered_orders
from courier_actions
where date_part('year',time) = 2022 and date_part('month',time) = 9 and action = 'deliver_order' 
group by courier_id
) as s
order by courier_id


-- using case
-- select
--     courier_id,
--     delivered_orders,
--     round(avg(delivered_orders) over(),2) as avg_delivered_orders,
-- --    (delivered_orders > avg(delivered_orders) over())::int as is_above_avg
--     case
--         when delivered_orders > avg(delivered_orders) over() then '1'
--         else '0'
--     end as is_above_avg
-- from (
-- select
--     courier_id,
--     count(order_id) as delivered_orders
-- from courier_actions
-- where date_part('year',time) = 2022 and date_part('month',time) = 9 and action = 'deliver_order'
-- group by courier_id
-- ) as s
-- order by courier_id
