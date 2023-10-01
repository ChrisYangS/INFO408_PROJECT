/*
 This SQL script creates several tables for an Airbnb-like platform in New Zealand. 
 
 The tables created are:
 - nz_host_detail: contains information about the hosts, such as their name, location, and profile picture.
 - nz_host_stats: contains statistics about the hosts, such as their response time and acceptance rate.
 - nz_listings_review_stats: contains statistics about the reviews of the listings, such as the number of reviews and the review scores.
 - nz_listings_stay_stats: contains statistics about the stays of the listings, such as the price and the minimum and maximum number of nights.
 - nz_region_parent: contains information about the parent regions of the regions, such as the name of the parent region.
 - nz_region: contains information about the regions, such as their name and parent region.
 - nz_listings: contains information about the listings, such as their name, location, and amenities.
 - nz_reviews: contains information about the reviews of the listings, such as the date and the comments.
 - nz_calendar: contains information about the availability and price of the listings on specific dates.
 
 Each table has its own set of columns and constraints, such as primary keys and foreign keys, to ensure data integrity and consistency.
 
 The script also includes comments to drop the tables if they already exist, to avoid errors when running the script multiple times.
 */
-- nz_host_detail definition
-- Drop table
-- DROP TABLE nz_host_detail;
CREATE TABLE nz_host_detail (
    host_id int8 NOT NULL,
    host_url text NULL,
    host_name text NULL,
    host_since date NULL,
    host_location text NULL,
    host_about text NULL,
    host_thumbnail_url text NULL,
    host_picture_url text NULL,
    host_neighbourhood text NULL,
    CONSTRAINT nz_host_detail_pkey PRIMARY KEY (host_id),
    CONSTRAINT nz_host_un UNIQUE (host_id)
);
-- nz_host_stats definition
-- Drop table
-- DROP TABLE nz_host_stats;
CREATE TABLE nz_host_stats (
    host_id int8 NOT NULL,
    host_response_time text NULL,
    host_response_rate text NULL,
    host_acceptance_rate text NULL,
    host_is_superhost text NULL,
    host_listings_count int8 NULL,
    host_total_listings_count int8 NULL,
    host_verifications text NULL,
    host_has_profile_pic text NULL,
    host_identity_verified text NULL,
    CONSTRAINT nz_host_stats_pkey PRIMARY KEY (host_id),
    CONSTRAINT nz_host_stats_un UNIQUE (host_id)
);
CREATE INDEX index_host_stats_id ON nz_host_stats USING btree (host_id);
-- nz_listings_review_stats definition
-- Drop table
-- DROP TABLE nz_listings_review_stats;
CREATE TABLE nz_listings_review_stats (
    id int8 NOT NULL,
    number_of_reviews int8 NULL,
    last_scraped date NULL,
    first_review text NULL,
    last_review text NULL,
    review_scores_rating float8 NULL,
    review_scores_accuracy float8 NULL,
    review_scores_cleanliness float8 NULL,
    review_scores_checkin float8 NULL,
    review_scores_communication float8 NULL,
    review_scores_location float8 NULL,
    review_scores_value float8 NULL,
    reviews_per_month float8 NULL,
    CONSTRAINT nz_listings_review_stats_pkey PRIMARY KEY (id),
    CONSTRAINT review_stats_un UNIQUE (id)
);
-- nz_listings_stay_stats definition
-- Drop table
-- DROP TABLE nz_listings_stay_stats;
CREATE TABLE nz_listings_stay_stats (
    id int8 NOT NULL,
    last_searched date NULL,
    price text NULL,
    minimum_nights int8 NULL,
    maximum_nights int8 NULL,
    minimum_minimum_nights int8 NULL,
    maximum_minimum_nights int8 NULL,
    minimum_maximum_nights int8 NULL,
    maximum_maximum_nights int8 NULL,
    minimum_nights_avg_ntm float8 NULL,
    maximum_nights_avg_ntm float8 NULL,
    has_availability text NULL,
    last_scraped date NULL,
    CONSTRAINT nz_listings_stay_stats_pkey PRIMARY KEY (id),
    CONSTRAINT stay_stats_un UNIQUE (id)
);
-- nz_region_parent definition
-- Drop table
-- DROP TABLE nz_region_parent;
CREATE TABLE nz_region_parent (
    region_parent_id int8 NOT NULL,
    region_parent_name text NULL,
    CONSTRAINT nregion_parent_un UNIQUE (region_parent_id),
    CONSTRAINT nz_region_parent_pkey PRIMARY KEY (region_parent_id)
);
-- nz_region definition
-- Drop table
-- DROP TABLE nz_region;
CREATE TABLE nz_region (
    region_id int8 NOT NULL,
    region_name text NULL,
    region_parent_id int8 NULL,
    CONSTRAINT nz_region_pkey PRIMARY KEY (region_id),
    CONSTRAINT nz_region_un UNIQUE (region_id),
    CONSTRAINT fk_region_parent_id FOREIGN KEY (region_parent_id) REFERENCES nz_region_parent(region_parent_id)
);
CREATE INDEX index_region_id ON nz_region USING btree (region_id);
-- nz_listings definition
-- Drop table
-- DROP TABLE nz_listings;
CREATE TABLE nz_listings (
    id int8 NOT NULL,
    listing_url text NULL,
    scrape_id int8 NULL,
    "name" text NULL,
    description text NULL,
    neighborhood_overview text NULL,
    picture_url text NULL,
    host_id int8 NULL,
    neighbourhood text NULL,
    latitude float8 NULL,
    longitude float8 NULL,
    property_type text NULL,
    room_type text NULL,
    accommodates int8 NULL,
    bathrooms float8 NULL,
    bathrooms_text text NULL,
    bedrooms float8 NULL,
    beds float8 NULL,
    amenities text NULL,
    instant_bookable text NULL,
    region_id int8 NULL,
    CONSTRAINT listing_un UNIQUE (id),
    CONSTRAINT nz_listings_pkey PRIMARY KEY (id),
    CONSTRAINT fk_host_id FOREIGN KEY (host_id) REFERENCES nz_host_detail(host_id),
    CONSTRAINT fk_region_id FOREIGN KEY (region_id) REFERENCES nz_region(region_id)
);
-- nz_reviews definition
-- Drop table
-- DROP TABLE nz_reviews;
CREATE TABLE nz_reviews (
    listing_id int8 NULL,
    id int8 NOT NULL,
    "date" date NULL,
    reviewer_id int8 NULL,
    reviewer_name text NULL,
    "comments" text NULL,
    CONSTRAINT list_review_un UNIQUE (id),
    CONSTRAINT nz_reviews_pkey PRIMARY KEY (id),
    CONSTRAINT fk_review_id FOREIGN KEY (listing_id) REFERENCES nz_listings(id)
);
-- nz_calendar definition
-- Drop table
-- DROP TABLE nz_calendar;
CREATE TABLE nz_calendar (
    listing_id int8 NOT NULL,
    "date" date NOT NULL,
    available text NULL,
    price text NULL,
    adjusted_price text NULL,
    minimum_nights float8 NULL,
    maximum_nights float8 NULL,
    CONSTRAINT calendar_un UNIQUE (listing_id, date),
    CONSTRAINT nz_calendar_pkey PRIMARY KEY (listing_id, date),
    CONSTRAINT fk_calendar_id FOREIGN KEY (listing_id) REFERENCES nz_listings(id)
);