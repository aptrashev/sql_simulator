SELECT
    user_id,
    avg(extract(epoch from time)/3600) -- over(partition by user_id) 
    
                             
FROM   user_actions
WHERE  action = 'create_order' and order_id not in (SELECT user_id FROM   user_actions WHERE  action = 'cancel_order')   
                           --and order_id not in (select user_id from user_actions where  action = 'cancel_order')
group by user_id
ORDER BY user_id
limit 1000

