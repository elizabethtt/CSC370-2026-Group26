"this is the stater file for the 370 project kickoff"

CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    reviews_made INT DEFAULT 0,
    account_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE study_spots (
    spot_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    spot_name VARCHAR(100) NOT NULL,
    spot_address VARCHAR(200) NOT NULL,
    overall_rating DECIMAL(3, 1) CHECK (overall_rating >= 0.0 AND overall_rating <= 10.0),
    spot_type ONE OF ('Library', 'Cafe', 'Outdoor', 'Other') NOT NULL,
    outlet_availablity DECIMAL(3, 1) CHECK (outlet_availablity >= 0.0 AND outlet_availablity <= 10.0),
    noise_level DECIMAL(3, 1) CHECK (noise_level >= 0.0 AND noise_level <= 10.0),
);

CREATE TABLE reviews (
    review_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    spot_description TEXT,
    spot_rating DECIMAL(3, 1) CHECK (spot_rating >= 0.0 AND spot_rating <= 10.0),
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    outlet_availablity DECIMAL(3, 1) CHECK (outlet_availablity >= 0.0 AND outlet_availablity <= 10.0),
    noise_level DECIMAL(3, 1) CHECK (noise_level >= 0.0 AND noise_level <= 10.0),
);

