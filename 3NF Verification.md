# 3NF Verification

The purpose of this analysis is to evaluate our updated relational schema and determine whether its relations satisfy Third Normal Form (3NF).

We know a relation satisfies 3NF if, for every non-trivial functional dependency X → A, at least one of the following conditions holds:

1. X is a superkey.
2. A is a prime attribute (an attribute belonging to at least one candidate key).

We evaluate the functional dependencies, attribute closures, candidate keys, and prime attributes for each relation.

## Functional Dependency Analysis

### 1. USERS

**Relation:**

`USERS(user_id, name, email, password, date_joined)`

- Primary key: `{user_id}`
- Key-derived functional dependency: `user_id → name, email, password, date_joined`
- Attribute closure: `{user_id}⁺ = {user_id, name, email, password, date_joined}`
- Prime attribute: `user_id` (assuming this is the only candidate key)

**3NF Evaluation:**

The identified functional dependency satisfies 3NF because `user_id` is a superkey and determines all attributes in the relation.

No additional 3NF-violating dependencies have been identified in the current analysis.

### 2. STUDY_SPOTS

**Relation:**

`STUDY_SPOTS(spot_id, name, location, type)`

- Primary key: `{spot_id}`
- Key-derived functional dependency: `spot_id → name, location, type`
- Attribute closure: `{spot_id}⁺ = {spot_id, name, location, type}`
- Prime attribute: `spot_id` (assuming this is the only candidate key)

**3NF Evaluation:**

The identified functional dependency satisfies 3NF because `spot_id` is a superkey and determines every attribute in the relation.

No additional 3NF-violating dependencies have been identified in the current analysis.

### 3. REVIEWS

**Relation:**

`REVIEWS(review_id, user_id, spot_id, review_date, rating, outlet_availability, noise_level, description)`

- Primary key: `{review_id}`
- Foreign keys:
  - `user_id` references `USERS(user_id)`
  - `spot_id` references `STUDY_SPOTS(spot_id)`
- Key-derived functional dependency: `review_id → user_id, spot_id, review_date, rating, outlet_availability, noise_level, description`
- Attribute closure: `{review_id}⁺ = {review_id, user_id, spot_id, review_date, rating, outlet_availability, noise_level, description}`
- Prime attribute: `review_id` (assuming this is the only candidate key)

**3NF Evaluation:**

The identified functional dependency satisfies 3NF because `review_id` is a superkey and determines all attributes in the relation.

The foreign keys connect REVIEWS to USERS and STUDY_SPOTS but do not, by themselves, create a 3NF violation.

No additional 3NF-violating dependencies have been identified in the current analysis.

## Summary

| Relation | Primary Key | Identified Key-Derived FDs Satisfy 3NF |
|---|---|---|
| USERS | user_id | Yes |
| STUDY_SPOTS | spot_id | Yes |
| REVIEWS | review_id | Yes |

## Conclusion

Based on the identified key-derived functional dependencies, all three updated relations are consistent with Third Normal Form (3NF).

Each identified dependency has a superkey on its left-hand side and therefore satisfies the 3NF condition.


# Minimal Basis Analysis

## Purpose

The purpose of this analysis is to calculate a minimal basis for the functional dependencies identified in our updated relational schema.

## 1. USERS

Relation: `USERS(user_id, name, email, password, date_joined)`

Original identified FD:

`user_id → name, email, password, date_joined`

Splitting the right-hand side gives:

- `user_id → name`
- `user_id → email`
- `user_id → password`
- `user_id → date_joined`

Each FD has a singleton right-hand side. None is redundant relative to the others, and each left-hand side contains only one attribute.

**Minimal basis for the identified dependencies:**

`{user_id → name, user_id → email, user_id → password, user_id → date_joined}`

## 2. STUDY_SPOTS

Relation: `STUDY_SPOTS(spot_id, name, location, type)`

Original identified FD:

`spot_id → name, location, type`

Splitting the right-hand side gives:

- `spot_id → name`
- `spot_id → location`
- `spot_id → type`

None is redundant relative to the others, and each left-hand side contains only one attribute.

**Minimal basis for the identified dependencies:**

`{spot_id → name, spot_id → location, spot_id → type}`

## 3. REVIEWS

Relation: `REVIEWS(review_id, user_id, spot_id, review_date, rating, outlet_availability, noise_level, description)`

Original identified FD:

`review_id → user_id, spot_id, review_date, rating, outlet_availability, noise_level, description`

Splitting the right-hand side gives:

- `review_id → user_id`
- `review_id → spot_id`
- `review_id → review_date`
- `review_id → rating`
- `review_id → outlet_availability`
- `review_id → noise_level`
- `review_id → description`

None is redundant relative to the others, and each left-hand side contains only one attribute.

**Minimal basis for the identified dependencies:**

`{review_id → user_id, review_id → spot_id, review_id → review_date, review_id → rating, review_id → outlet_availability, review_id → noise_level, review_id → description}`

## Conclusion

We split all currently identified key-derived functional dependencies into dependencies with singleton right-hand sides.

For these identified dependency sets, no dependency is redundant, and no determinant contains an unnecessary attribute.

Therefore, the resulting sets are minimal bases for the currently identified functional dependencies.

