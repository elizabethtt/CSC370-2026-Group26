# Relational Schema

USERS(
    user_id,
    full_name,
    reviews_made,
    account_created
)

Primary Key:
    user_id


STUDY_SPOTS(
    spot_id,
    spot_name,
    spot_address,
    overall_rating,
    spot_type,
    outlet_availability,
    noise_level
)

Primary Key:
    spot_id


REVIEWS(
    review_id,
    user_id,
    spot_id,
    review_text,
    spot_rating,
    review_date
)

Primary Key:
    review_id

Foreign Keys:
    user_id → USERS.user_id
    spot_id → STUDY_SPOTS.spot_id