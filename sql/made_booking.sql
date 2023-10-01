/*
 This stored procedure named 'made_booking' updates the 'available' column of the 'nz_calendar' table to 'f' for matching rows where the listing_id, start_date and end_date parameters match. It also updates the 'has_availability' column to 'f' for matching rows in 'nz_listings_stay_stats' if today's date is between start and end date range. The procedure takes three parameters: listing_id (integer), start_date (date) and end_date (date). It returns the number of rows updated from 'nz_calendar' table. 
 */
CREATE OR REPLACE PROCEDURE made_booking(
        IN listing_id INTEGER,
        IN start_date DATE,
        IN end_date DATE
    ) LANGUAGE plpgsql AS $$
DECLARE updated_rows INTEGER;
BEGIN -- Updates the 'available' column of the 'nz_calendar' table to 'f' for matching rows
UPDATE nz_calendar
SET available = 'f'
WHERE nz_calendar.listing_id = made_booking.listing_id
    AND date BETWEEN start_date AND end_date;
-- Get the number of rows updated by the last UPDATE statement
GET DIAGNOSTICS updated_rows = ROW_COUNT;
-- Print out the number of rows updated from 'nz_calendar' table
RAISE NOTICE 'Updated % rows in nz_calendar',
updated_rows;
-- Check if today's date is between start and end date range
IF start_date <= CURRENT_DATE
AND end_date >= CURRENT_DATE THEN -- Sets the 'has_availability' column to 'f' for matching rows in 'nz_listings_stay_stats'
UPDATE nz_listings_stay_stats
SET has_availability = 'f'
WHERE id = made_booking.listing_id;
RAISE NOTICE 'Update nz_listings_stay_stats has_availability status';
END IF;
END;
$$;