-- Starter file for the CSC 370 project kickoff

CREATE TABLE `users`(
    `user_id` INT PRIMARY KEY AUTO_INCREMENT,
    `full_name` VARCHAR(50) NOT NULL,
    `reviews_made` INT DEFAULT 0,
    `account_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `study_spots`(
    `spot_id` INT PRIMARY KEY AUTO_INCREMENT,
    `spot_name` VARCHAR(100) NOT NULL,
    `spot_address` VARCHAR(200) NOT NULL,
    `overall_rating` DECIMAL(3, 1) CHECK (`overall_rating` >= 0.0 AND `overall_rating` <= 10.0),
    `spot_type` VARCHAR(20) NOT NULL CHECK (`spot_type` IN ('Library', 'Cafe', 'Outdoor', 'Other')),
    `outlet_availability` DECIMAL(3, 1) CHECK (`outlet_availability` >= 0.0 AND `outlet_availability` <= 10.0),
    `noise_level` DECIMAL(3, 1) CHECK (`noise_level` >= 0.0 AND `noise_level` <= 10.0)
);

CREATE TABLE `reviews`(
    `review_id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT,
    `spot_id` INT,
    `review_text` TEXT,
    `spot_rating` DECIMAL(3, 1) CHECK (`spot_rating` >= 0.0 AND `spot_rating` <= 10.0),
    `review_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`spot_id`) REFERENCES `study_spots`(`spot_id`)
);

INSERT INTO `users` (`user_id`, `full_name`, `reviews_made`) VALUES
(1, 'Alice Chen', 2),
(2, 'Marcus Lee', 2),
(3, 'Priya Patel', 1);

INSERT INTO `study_spots` (
    `spot_id`, `spot_name`, `spot_address`, `overall_rating`, `spot_type`,
    `outlet_availability`, `noise_level`
) VALUES
(1, 'North Campus Library', '100 College Way', 8.5, 'Library', 9.5, 2.0),
(2, 'Maple Street Cafe', '25 Maple Street', 8.0, 'Cafe', 7.0, 5.5),
(3, 'Riverside Garden', '8 River Road', 9.5, 'Outdoor', 4.0, 1.5);

INSERT INTO `reviews` (`review_id`, `user_id`, `spot_id`, `review_text`, `spot_rating`) VALUES
(1, 1, 1, 'Quiet tables and plenty of outlets.', 9.0),
(2, 2, 1, 'Great focus space, especially upstairs.', 8.0),
(3, 1, 2, 'Good coffee and comfortable seating.', 8.5),
(4, 2, 2, 'A little busy, but the tables are spacious.', 7.5),
(5, 3, 3, 'Peaceful place to study outdoors.', 9.5);