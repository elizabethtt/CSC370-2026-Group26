-- Dataset for testing SQL code

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'Alice Chen', 'alice@example.com', 'hashed_pw_1'),
(2, 'Marcus Lee', 'marcus@example.com', 'hashed_pw_2'),
(3, 'Priya Patel', 'priya@example.com', 'hashed_pw_3'),
(4, 'Liam Smith', 'liam@example.com', 'hashed_pw_4'),
(5, 'Sophia Taylor', 'sophia@example.com', 'hashed_pw_5'),
(6, 'Noah Brown', 'noah@example.com', 'hashed_pw_6'),
(7, 'Emma Wilson', 'emma@example.com', 'hashed_pw_7');

INSERT INTO `study_spots` (`spot_id`, `name`, `location`, `type`) VALUES
(1, 'North Campus Library', '100 College Way', 'Library'),
(2, 'Maple Street Cafe', '25 Maple Street', 'Cafe'),
(3, 'Riverside Garden', '8 River Road', 'Outdoor'),
(4, 'Downtown Public Library', '120 Main Street', 'Library'),
(5, 'The Study Lounge Cafe', '458 University Ave', 'Cafe'),
(6, 'Botanical Gardens Gazebo', '300 Park Road', 'Outdoor'),
(7, 'Engineering Building Atrium', '250 Tech Loop', 'Other'),
(8, 'Corner Perk Coffee', '89 High Street', 'Cafe');

INSERT INTO `reviews` (`review_id`, `user_id`, `spot_id`, `description`, `rating`,
                       `outlet_availability`, `noise_level`) VALUES
(1, 1, 1, 'Quiet tables and plenty of outlets.', 9.0, 9.5, 2.0),
(2, 2, 1, 'Great focus space, especially upstairs.', 8.0, 9.5, 2.0),
(3, 1, 2, 'Good coffee and comfortable seating.', 8.5, 7.0, 5.5),
(4, 2, 2, 'A little busy, but the tables are spacious.', 7.5, 7.0, 5.5),
(5, 3, 3, 'Peaceful place to study outdoors.', 9.5, 4.0, 1.5),
(6, 4, 4, 'Very spacious and quiet upper floors.', 9.0, 8.5, 3.0),
(7, 5, 4, 'Great study desks, but fills up fast.', 8.0, 9.0, 4.0),
(8, 6, 5, 'Good coffee, decent WiFi, a bit loud.', 7.0, 6.0, 7.5),
(9, 7, 5, 'Cozy corners and friendly staff.', 8.5, 7.5, 5.0),
(10, 4, 6, 'Beautiful scenery, hard to find power outlets outside.', 8.5, 2.0, 1.0),
(11, 5, 6, 'So peaceful outdoors when the weather is nice.', 9.0, 1.0, 2.0),
(12, 6, 7, 'Lots of whiteboards and group tables available.', 9.5, 10.0, 5.0),
(13, 7, 7, 'Open late during midterms and finals.', 8.5, 9.0, 6.0),
(14, 4, 8, 'Amazing espresso and fast internet connection.', 9.0, 8.0, 6.5),
(15, 5, 8, 'A bit cramped on weekday afternoons.', 6.5, 5.0, 8.0);