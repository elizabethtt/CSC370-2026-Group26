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
    `user_id` INT FOREIGN KEY REFERENCES `users`(`user_id`),
    `spot_id` INT FOREIGN KEY REFERENCES `study_spots`(`spot_id`),
    `review_text` TEXT,
    `spot_rating` DECIMAL(3, 1) CHECK (`spot_rating` >= 0.0 AND `spot_rating` <= 10.0),
    `review_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);