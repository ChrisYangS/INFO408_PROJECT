CREATE OR REPLACE PROCEDURE yansh877.update_price_and_availability() LANGUAGE plpgsql AS $procedure$
DECLARE rows_affected INT;
BEGIN BEGIN -- Your original SQL code here
UPDATE nz_listings_stay_stats
SET price = s.price,
    has_availability = s.available,
    minimum_nights = s.minimum_nights,
    maximum_nights = s.maximum_nights
FROM (
        SELECT nc.listing_id,
            nc.date,
            nc.price,
            nc.available,
            nc.minimum_nights,
            nc.maximum_nights
        FROM nz_calendar nc
        WHERE nc.date = (
                SELECT MAX(date)
                FROM nz_calendar
                WHERE listing_id = nc.listing_id
            )
    ) s
WHERE nz_listings_stay_stats.id = s.listing_id;
-- Get the number of rows affected by the UPDATE statement
GET DIAGNOSTICS rows_affected = ROW_COUNT;
-- Print the number of rows affected
RAISE NOTICE 'Number of rows inserted: %',
rows_affected;
EXCEPTION
WHEN others THEN -- Handle the error here, you can raise a custom error message or log the error
RAISE NOTICE 'Error occurred: %',
SQLERRM;
END;
-- Print a message when the procedure is completed
RAISE NOTICE 'Stored procedure update_price_and_availability completed successfully.';
END;