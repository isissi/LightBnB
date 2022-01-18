-- -- Show specific details about properties located in Vancouver including their average rating.

-- -- Select the id, title, cost_per_night, and an average_rating from the 
-- -- properties table for properties located in Vancouver.
-- -- Order the results from lowest cost_per_night to highest cost_per_night.
-- -- Limit the number of results to 10.
-- -- Only show listings that have a rating >= 4 stars.
-- Expected result (Again, your id numbers may differ, and you may have more than 
-- 4 rows if you added your own data where the city is equal to Vancouver):

--  id  |       title        | cost_per_night |   average_rating
-- -----+--------------------+----------------+--------------------
--  224 | Nature bite        |          10526 | 4.1000000000000000
--  197 | Build they         |          34822 | 4.1000000000000000
--   47 | Aside age          |          35421 | 4.2500000000000000
--  149 | Present television |          53062 | 4.2222222222222222
-- (4 rows)

SELECT properties.id, properties.title, properties.cost_per_night, avg(property_reviews.rating) as average_rating
FROM properties
JOIN property_reviews ON property_reviews.property_id = properties.id
WHERE properties.city LIKE '%Vancouver%'
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY properties.cost_per_night 
LIMIT 10;