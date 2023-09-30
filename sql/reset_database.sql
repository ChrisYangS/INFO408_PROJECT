$procedure$;
CREATE OR REPLACE PROCEDURE reset_database() LANGUAGE plpgsql AS $$ BEGIN
    /*Truncate data in all tables*/
    TRUNCATE TABLE nz_region_parent CASCADE;
RAISE NOTICE 'nz_region_parent table is truncated successfully.';
TRUNCATE TABLE nz_region CASCADE;
RAISE NOTICE 'nz_region table is truncated successfully.';
TRUNCATE TABLE nz_calendar CASCADE;
RAISE NOTICE 'nz_calendar table is truncated successfully.';
TRUNCATE TABLE nz_host_detail CASCADE;
RAISE NOTICE 'nz_host_detail table is truncated successfully.';
TRUNCATE TABLE nz_listings CASCADE;
RAISE NOTICE 'nz_listings table is truncated successfully.';
TRUNCATE TABLE nz_reviews CASCADE;
RAISE NOTICE 'nz_reviews table is truncated successfully.';
TRUNCATE TABLE nz_listings_stay_stats CASCADE;
RAISE NOTICE 'nz_listings_stay_stats table is truncated successfully.';
TRUNCATE TABLE nz_listings_review_stats CASCADE;
RAISE NOTICE 'nz_listings_review_stats table is truncated successfully.';
TRUNCATE TABLE nz_host_stats CASCADE;
RAISE NOTICE 'nz_host_stats table is truncated successfully.';
END;
$$;