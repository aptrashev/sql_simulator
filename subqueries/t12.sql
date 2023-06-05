SELECT order_id,
       creation_time,
       product_ids,
       unnest(product_ids) as product_id
FROM   orders limit 100
