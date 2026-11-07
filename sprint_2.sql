-- code imported from sprint 1

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

-- compares study spots by review count and rating stats
SELECT
    ss.spot_id,
    ss.name AS study_spot,
    ss.type,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating), 2) AS average_rating,
    MIN(r.rating) AS lowest_rating,
    MAX(r.rating) AS highest_rating
FROM study_spots AS ss
LEFT JOIN reviews AS r ON r.spot_id = ss.spot_id
GROUP BY ss.spot_id, ss.name, ss.type
ORDER BY average_rating DESC, review_count DESC;

-- find spots whose average rating is above the overall average rating 
-- then calculates the average across all reviewed spots
SELECT
    ss.spot_id,
    ss.name AS study_spot,
    ss.type,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating), 2) AS average_rating
FROM study_spots AS ss
JOIN reviews AS r ON r.spot_id = ss.spot_id
WHERE r.rating IS NOT NULL
GROUP BY ss.spot_id, ss.name, ss.type
HAVING AVG(r.rating) > (
    SELECT AVG(r2.rating)
    FROM reviews AS r2
    WHERE r2.rating IS NOT NULL
)
ORDER BY average_rating DESC;

-- compare each study spots average rating with the average for its spot type
-- HAVING limits the results to spots rated above their types average
SELECT
    ss.spot_id,
    ss.name AS study_spot,
    ss.type,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating), 2) AS average_rating,
    ROUND((
        SELECT AVG(r2.rating)
        FROM study_spots AS ss2
        JOIN reviews AS r2 ON r2.spot_id = ss2.spot_id
        WHERE ss2.type = ss.type AND r2.rating IS NOT NULL
    ), 2) AS type_average_rating
FROM study_spots AS ss
JOIN reviews AS r ON r.spot_id = ss.spot_id
WHERE r.rating IS NOT NULL
GROUP BY ss.spot_id, ss.name, ss.type
HAVING AVG(r.rating) > (
    SELECT AVG(r2.rating)
    FROM study_spots AS ss2
    JOIN reviews AS r2 ON r2.spot_id = ss2.spot_id
    WHERE ss2.type = ss.type AND r2.rating IS NOT NULL
)
ORDER BY ss.type, average_rating DESC;
