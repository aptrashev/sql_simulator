SELECT age(max(birth_date), min(birth_date)) as age_diff
FROM   users
WHERE  sex = 'male'
