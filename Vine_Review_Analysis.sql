-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Review the vine table
SELECT * FROM vine_table;

-- Filter data to create table for all rows where total_votes count is equal to or greater than 20
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO total_votes_table
FROM vine_table
WHERE total_votes >= 20;

-- Review the total votes table
SELECT * FROM total_votes_table;

-- Filter data to create table for all rows where helpful_votes divided by total_votes is equal to or greater than 50%
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO helpful_votes_table
FROM total_votes_table
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

-- Review the helpful votes table
SELECT * FROM helpful_votes_table;

-- Filter data to create table for all rows where a review was written as part of the Vine program
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO vine_votes_table
FROM helpful_votes_table
WHERE vine = 'Y';

-- Review the vine votes table
SELECT * FROM vine_votes_table;

-- Filter data to create table for all rows where a review was not written as part of the Vine program
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO regular_votes_table
FROM helpful_votes_table
WHERE vine = 'N';

-- Review the regular votes table
SELECT * FROM regular_votes_table;

-- Count the total number of reviews
SELECT COUNT(star_rating) FROM helpful_votes_table;

-- Create table schema
CREATE TABLE total_vine_reviews (
	total_vine_reviews INT
);

CREATE TABLE five_star_vine_reviews (
	five_star_vine_reviews INT
);

CREATE TABLE total_regular_reviews (
	total_regular_reviews INT
);

CREATE TABLE five_star_regular_reviews (
	five_star_regular_reviews INT
);
-- insert data into table schema
INSERT INTO total_vine_reviews(total_vine_reviews)
SELECT COUNT(star_rating) FROM vine_votes_table;

INSERT INTO five_star_vine_reviews(five_star_vine_reviews)
SELECT COUNT(star_rating) FROM vine_votes_table WHERE star_rating = 5;

INSERT INTO total_regular_reviews(total_regular_reviews)
SELECT COUNT(star_rating) FROM regular_votes_table;

INSERT INTO five_star_regular_reviews(five_star_regular_reviews)
SELECT COUNT(star_rating) FROM regular_votes_table WHERE star_rating = 5;

-- join tables
SELECT total_vine_reviews, five_star_vine_reviews
INTO percentage_vine_reviews
FROM total_vine_reviews
CROSS JOIN five_star_vine_reviews;

SELECT * FROM percentage_vine_reviews;

SELECT total_regular_reviews, five_star_regular_reviews
INTO percentage_regular_reviews
FROM total_regular_reviews
CROSS JOIN five_star_regular_reviews;

SELECT * FROM percentage_regular_reviews;

-- Calculate percentage of 5-star reviews from the two types
SELECT total_vine_reviews, five_star_vine_reviews,
    CAST(five_star_vine_reviews AS FLOAT)/ CAST(total_vine_reviews AS FLOAT)*100 AS percent_five_star 
INTO vine_review_analysis
FROM percentage_vine_reviews;

SELECT * FROM vine_review_analysis;

SELECT total_regular_reviews, five_star_regular_reviews,
    CAST(five_star_regular_reviews AS FLOAT)/ CAST(total_regular_reviews AS FLOAT)*100 AS percent_five_star 
INTO regular_review_analysis
FROM percentage_regular_reviews;

SELECT * FROM regular_review_analysis;
