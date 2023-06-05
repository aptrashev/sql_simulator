SELECT COUNT(order_id) AS orders, COUNT(order_id) FILTER(WHERE array_length(product_ids,1) >= 5) AS large_orders,
ROUND(COUNT(order_id) FILTER(WHERE array_length(product_ids,1) >= 5) / COUNT(order_id)::decimal, 2) AS large_orders_share
FROM orders

