INSERT INTO users ( name, email, password)
VALUES ('Antoine Ewing', 'antoine77@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'), 
('Nathanial Floyd', 'floyd_1215@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'), 
('Shania Harrington', 'shania_harrington@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'), 
('Carissa Davila', 'carissa_d@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces,
number_of_bathrooms,number_of_bedrooms, country, street, city, province, post_code, active)
VALUES (1, 'Downtown condo', 'description',  'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 300, 1, 1, 1, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', '28142', true), 
(2, 'Central District Loft', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 315, 1, 1, 2, 'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '83680', false), 
(2, 'Gorgeous 1 Bedroom Loft', 'description', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg', 218, 1, 1, 0, 'Canada', '1650 Hejto Center', 'Genwezuj', 'Newfoundland And Labrador', ' 44583', true), 
(3, 'Cozy Basement Apartment', 'description', 'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg', 288, 1, 2, 1, 'Canada', '513 Powov Grove', 'Jaebvap', 'Ontario', '38051', true), 
(4, 'Downtown Beautiful Home', 'description', 'https://images.pexels.com/photos/1756826/pexels-photo-1756826.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1756826/pexels-photo-1756826.jpeg', 850, 2, 3, 4, 'Canada', '340 Dokto Park ', 'Upfufa', 'Nova Scotia ', '29045', true); 


INSERT INTO reservations (start_date, end_date, property_id, guest_id) 
VALUES ('2018-04-11', '2018-04-23', 2, 4), 
('2018-06-06', '2018-06-16', 4, 1), 
('2021-01-10', '2021-02-02', 2, 3), 
('2020-10-25', '2020-11-05', 1, 2);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (4, 2, 1, 4, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.'), 
(1, 4, 2, 3, 'Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.'), 
(3, 2, 3, 3, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'), 
(2, 1, 4, 5, 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?');