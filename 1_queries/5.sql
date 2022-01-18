-- Show all reservations for a user.

-- Select the reservation id, property title, reservation start_date, property cost_per_night 
-- and the average rating of the property. You'll need data from both the reservations and 
-- properties tables.
-- The reservations will be for a single user, so just use 1 for the user_id.
-- Order the results from the earliest start_date to the most recent start_date.
-- Limit the results to 10.
-- Below is the expected result for our user with the id of 1 in our dataset. 
-- (It's the user with the email address tristanjacobs@gmail.com in our database). 
-- Remember that your results may differ if you added your own reservations that are 
-- associated with a different user whose id is 1):

--     id   |      title      | cost_per_night | start_date |   average_rating   
-- ---------+-----------------+----------------+------------+--------------------
--  1017016 | Apple barn      |          79787 | 2014-05-17 | 4.1666666666666667
--  1010127 | Piano principle |          16669 | 2014-08-17 | 3.7777777777777778
--  1012625 | Bow forest      |          13562 | 2015-07-30 | 4.2727272727272727

SELECT reservations.id, properties.title, properties.cost_per_night, reservations.start_date, avg(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;