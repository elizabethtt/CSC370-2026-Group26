# Relational Schema

USERS(
    user_id,
    name,
    email,
    password,
    date_joined
)

Primary Key:
    user_id


STUDY_SPOTS(
    spot_id,
    name,
    address,
    type
)

Primary Key:
    spot_id


REVIEWS(
    review_id,
    author,
    study_spot,
    date,
    rating,
    outlet_availability,
    noise_level,
    description
)

Primary Key:
    review_id

Foreign Keys:
    author → USERS.user_id
    study_spot → STUDY_SPOTS.spot_id
