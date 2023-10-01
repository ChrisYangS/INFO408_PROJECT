/*
 This stored procedure updates the price and availability of listings in the nz_listings_stay_stats table based on the current date's information in the nz_calendar table. The procedure first selects the necessary information from the nz_calendar table for the current date, and then updates the corresponding rows in the nz_listings_stay_stats table. The number of rows affected by the update is printed as a notice. If an error occurs during the update, the error message is printed as a notice. A final notice is printed when the procedure is completed successfully.
 */
CREATE OR REPLACE PROCEDURE update_price_and_availability() LANGUAGE plpgsql AS $$
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
        WHERE nc.date = CURRENT_DATE
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
$$;