/*
 This stored procedure updates the stay statistics of New Zealand listings based on the latest scraped data from the nz_calendar table. It updates the last_scraped, minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights, maximum_maximum_nights, minimum_nights_avg_ntm, and maximum_nights_avg_ntm columns of the nz_listings_stay_stats table. The procedure first selects the latest scraped data from the nz_calendar table and calculates the minimum and maximum values of minimum_nights and maximum_nights for each listing. It then calculates the average of minimum_nights and maximum_nights for each listing. Finally, it updates the stay statistics of each listing in the nz_listings_stay_stats table with the calculated values. The number of rows affected by the update statement is printed as a message after the procedure is completed. If an error occurs during the execution of the procedure, the error message is printed as a notice.
 */
$procedure$;
CREATE OR REPLACE PROCEDURE update_stay_stats() LANGUAGE plpgsql AS $procedure$
DECLARE rows_affected INT;
BEGIN BEGIN -- Your original SQL code here
UPDATE nz_listings_stay_stats
SET last_scraped = s.last_scraped,
    minimum_minimum_nights = s.minimum_minimum_nights,
    maximum_minimum_nights = s.maximum_minimum_nights,
    minimum_maximum_nights = s.minimum_maximum_nights,
    maximum_maximum_nights = s.maximum_maximum_nights,
    minimum_nights_avg_ntm = s.minimum_nights_avg_ntm,
    maximum_nights_avg_ntm = s.maximum_nights_avg_ntm
FROM (
        SELECT nc.listing_id,
            MAX(nc.date) AS last_scraped,
            MIN(nc.minimum_nights) AS minimum_minimum_nights,
            MAX(nc.minimum_nights) AS maximum_minimum_nights,
            MIN(nc.maximum_nights) AS minimum_maximum_nights,
            MAX(nc.maximum_nights) AS maximum_maximum_nights,
            AVG(nc.minimum_nights) AS minimum_nights_avg_ntm,
            AVG(nc.maximum_nights) AS maximum_nights_avg_ntm
        FROM nz_calendar nc
        GROUP BY nc.listing_id
    ) s
WHERE nz_listings_stay_stats.id = s.listing_id;
-- Get the number of rows affected by the UPDATE statement
GET DIAGNOSTICS rows_affected = ROW_COUNT;
-- Print the number of rows affected
RAISE NOTICE 'Number of rows inserted: %',
rows_affected;
EXCEPTION
WHEN others THEN -- Handle the error here
RAISE NOTICE 'Error occurred: %',
SQLERRM;
END;
-- Print a message when the procedure is completed
RAISE NOTICE 'Stored procedure update_stay_stats completed successfully.';
END;