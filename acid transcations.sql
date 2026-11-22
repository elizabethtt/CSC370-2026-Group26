USE starter;

-- View tables
SELECT * FROM users;
SELECT * FROM study_spots;
SELECT * FROM reviews;

-- Trigger
CREATE TRIGGER after_review_insert
AFTER INSERT ON reviews
FOR EACH ROW
UPDATE users
SET reviews_made = reviews_made + 1
WHERE user_id = NEW.user_id;

-- Checking the number of reviews made by users
SELECT user_id, reviews_made
FROM users;
-- Checking existing reviews
SELECT * FROM reviews;


-- NULL HANDLING

-- Find study spots with missing ratings
SELECT *
FROM study_spots
WHERE overall_rating IS NULL;

-- Update the missing ratings using the primary key
UPDATE study_spots
SET overall_rating = 0.0
WHERE spot_id IN (4, 5)
AND overall_rating IS NULL;

-- Check if NULL ratings were updated
SELECT spot_id, spot_name, overall_rating
FROM study_spots
WHERE spot_id IN (4, 5);

-- Display missing ratings as 0
SELECT spot_id, spot_name,
    COALESCE(overall_rating, 0.0) AS displayed_rating
FROM study_spots;

-- ACID Transcations

-- Start a transaction
START TRANSACTION;

-- Update a study spot's rating 
UPDATE study_spots
SET overall_rating = 9.0
WHERE spot_id = 1;

-- Update its noise level
UPDATE study_spots
SET noise_level = 1.5
WHERE spot_id = 1;

COMMIT;




