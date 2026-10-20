-- Sprint 1 adjusted SQL code

CREATE TABLE `users` (
    `user_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `date_joined` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `study_spots` (
    `spot_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `location` VARCHAR(200) NOT NULL,
    `type` VARCHAR(20) NOT NULL CHECK (`type` IN ('Library', 'Cafe', 'Outdoor', 'Other'))
);

CREATE TABLE `reviews` (
    `review_id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT,
    `spot_id` INT,
    `description` TEXT,
    `rating` DECIMAL(3, 1) CHECK (`rating` >= 0.0 AND `rating` <= 10.0),
    `outlet_availability` DECIMAL(3, 1) CHECK (`outlet_availability` >= 0.0 AND `outlet_availability` <= 10.0),
    `noise_level` DECIMAL(3, 1) CHECK (`noise_level` >= 0.0 AND `noise_level` <= 10.0),
    `review_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`spot_id`) REFERENCES `study_spots`(`spot_id`)
);