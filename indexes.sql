-- Indexes for study spots
CREATE INDEX idx_spot_name
ON study_spots(name);

CREATE INDEX idx_spot_type
ON study_spots(type);


-- Indexes for reviews
CREATE INDEX idx_reviews_spot_date
ON reviews(spot_id, review_date);

CREATE INDEX idx_reviews_user_date
ON reviews(user_id, review_date);

CREATE INDEX idx_reviews_rating
ON reviews(rating);