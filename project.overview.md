# Study Spot Rating System

## Introduction

This project is a study spot rating system that allows users to view and submit ratings for local study spots.The system stores information about users, study spots, and reviews.


## Requirements
-	The system stores users with a unique user ID, full name, number of reviews made, and account creation date.
-	The system stores study spots with a unique spot ID, name, address/location, overall rating, type, outlet availability, and noise level.
-	Each study spot must have a valid type such as Library, Cafe, Outdoor, or Other.
-	Users can write reviews for study spots.
-	Each review is associated with one user and one study spot.
-	Each review stores a unique review ID, review text, rating, and review date.
-	Study spots can have multiple reviews.
-	Users can write multiple reviews.
-	Ratings use a scale from 0.0 to 10.0.
-	Outlet availability uses a scale from 0.0 to 10.0.
-	Noise level uses a scale from 0.0 to 10.0.
-	Each user must have a unique user_id.
-	Each study spot must have a unique spot_id.
-	Each review must have a unique review_id.
-	Every review must reference an existing user.
-	Every review must reference an existing study spot.
-	User full names are required.
-	Study spot names, addresses, and types are required.
-	New users start with 0 reviews made by default.
-	Account creation dates are automatically recorded when a user is created.
-	Review dates are automatically recorded when a review is created.

## Sprint KickOff Goals
- Define the system requirements
- Create the ERD
- Define the relational schema
- Implement the schema in MySql
- Normalize the database through BCNF