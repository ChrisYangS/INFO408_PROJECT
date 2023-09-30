--DROP TABLE listings;
--DROP TABLE nz_region;

/*
 * LISTING TABLE
 */
--44849 records

SELECT count(1) FROM nz_listings;

SELECT * FROM nz_listings LIMIT 100;

CREATE INDEX index_list_id ON nz_listings(id);

ALTER TABLE nz_listings ADD PRIMARY KEY (id);

ALTER TABLE nz_listings ADD CONSTRAINT fk_region_id FOREIGN KEY(region_id) 
REFERENCES nz_region(region_id);

ALTER TABLE nz_listings ADD CONSTRAINT fk_host_id FOREIGN KEY(host_id) 
REFERENCES nz_host_detail(host_id);

ALTER TABLE nz_listings ADD CONSTRAINT listing_un UNIQUE (id);



/*
 * REGION TABLE
 */

SELECT count(1) FROM nz_region;

SELECT * FROM nz_region;

CREATE INDEX index_region_id ON nz_region(region_id);

ALTER TABLE nz_region ADD PRIMARY KEY (region_id);

ALTER TABLE nz_region ADD CONSTRAINT fk_region_parent_id FOREIGN KEY(region_parent_id) 
REFERENCES nz_region_parent(region_parent_id);

ALTER TABLE nz_region ADD CONSTRAINT nz_region_un UNIQUE (region_id);


/*
 * REGION PARENT TABLE
 */
SELECT * FROM nz_region_parent;

CREATE INDEX index_region_parent_id ON nz_region_parent(region_parent_id);

ALTER TABLE nz_region_parent ADD PRIMARY KEY (region_parent_id);

ALTER TABLE nz_region_parent ADD CONSTRAINT nregion_parent_un UNIQUE (region_parent_id);

/*
 * HOST DETAIL TABLE
 */

SELECT * FROM nz_host_detail;

CREATE INDEX index_host_id ON nz_host_detail(host_id);

ALTER TABLE nz_host_detail ADD PRIMARY KEY (host_id);

ALTER TABLE nz_host_detail ADD CONSTRAINT nz_host_un UNIQUE (host_id);



/*
 * REVIEW TABLE
 */

SELECT * FROM nz_reviews  LIMIT 1000;

SELECT count(1) FROM nz_reviews; 

ALTER TABLE nz_reviews ADD PRIMARY KEY (id);

ALTER TABLE nz_reviews ADD CONSTRAINT list_review_un UNIQUE (id);

ALTER TABLE nz_reviews ADD CONSTRAINT fk_review_id FOREIGN KEY(listing_id) 
REFERENCES nz_listings(id);

/*
 * CALENDAR TABLE
 */

SELECT * FROM nz_calendar LIMIT 1000;

ALTER TABLE nz_calendar ADD PRIMARY KEY (listing_id, date);

ALTER TABLE nz_calendar ADD CONSTRAINT calendar_un UNIQUE (listing_id, date);

ALTER TABLE nz_calendar  ADD CONSTRAINT fk_calendar_id FOREIGN KEY(listing_id) 
REFERENCES nz_listings(id);


/*
 * NZ LIST STAY STATS
 */

SELECT * FROM nz_listings_stay_stats;

ALTER TABLE nz_listings_stay_stats ADD PRIMARY KEY (id);

ALTER TABLE nz_listings_stay_stats ADD CONSTRAINT stay_stats_un UNIQUE (id);


/*
 * HOST STATS TABLE
 */
SELECT * FROM nz_host_stats ;

CREATE INDEX index_host_stats_id ON nz_host_stats(host_id);

ALTER TABLE nz_host_stats ADD PRIMARY KEY (host_id);

ALTER TABLE nz_host_stats ADD CONSTRAINT nz_host_stats_un UNIQUE (host_id);


/*
 * LISTING REVIEW STATS
 */

SELECT * FROM nz_listings_review_stats;

ALTER TABLE nz_listings_review_stats ADD PRIMARY KEY (id);

ALTER TABLE nz_listings_review_stats ADD CONSTRAINT review_stats_un UNIQUE (id);






/*Truncate data in all tables*/


TRUNCATE TABLE nz_region_parent CASCADE;

TRUNCATE TABLE nz_region CASCADE;

TRUNCATE TABLE nz_host_stats CASCADE;

TRUNCATE TABLE nz_host_detail CASCADE;

TRUNCATE TABLE nz_listings_stay_stats CASCADE;

TRUNCATE TABLE nz_listings_review_stats CASCADE;

TRUNCATE TABLE nz_listings;

TRUNCATE TABLE nz_reviews CASCADE;

TRUNCATE TABLE nz_calendar CASCADE;








