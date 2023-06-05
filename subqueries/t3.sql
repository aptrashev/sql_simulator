SELECT product_id,
       name,
       price
FROM   products
WHERE  price > (SELECT min(price)
                FROM   products)
ORDER BY product_id desc
