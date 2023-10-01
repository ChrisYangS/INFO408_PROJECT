/*
 This procedure cancels a booking by updating the 'available' column of the 'nz_calendar' table to 't' for matching rows, and sets the 'has_availability' column to 't' for matching rows in 'nz_listings_stay_stats'. 
 
 Parameters:
 - listing_id: the ID of the listing to cancel the booking for
 - start_date: the start date of the booking to cancel
 - end_date: the end date of the booking to cancel
 
 Returns: None
 
 Example usage:
 CALL cancel_booking(123, '2022-01-01', '2022-01-05');
 */
CREATE OR REPLACE PROCEDURE cancel_booking(
        IN listing_id INTEGER,
        IN start_date DATE,
        IN end_date DATE
    ) LANGUAGE plpgsql AS $$
DECLARE updated_rows INTEGER;
BEGIN -- Updates the 'available' column of the 'nz_calendar' table to 't' for matching rows
UPDATE nz_calendar
SET available = 't'
WHERE nz_calendar.listing_id = cancel_booking.listing_id
    AND date BETWEEN start_date AND end_date;
-- Get the number of rows updated by the last UPDATE statement
GET DIAGNOSTICS updated_rows = ROW_COUNT;
-- Print out the number of rows updated from 'nz_calendar' table
RAISE NOTICE 'Updated % rows in nz_calendar',
updated_rows;
-- Check if today's date is between start and end date range
IF start_date <= CURRENT_DATE
AND end_date >= CURRENT_DATE THEN -- Sets the 'has_availability' column to 't' for matching rows in 'nz_listings_stay_stats'
UPDATE nz_listings_stay_stats
SET has_availability = 't'
WHERE id = cancel_booking.listing_id;
RAISE NOTICE 'Update nz_listings_stay_stats has_availability status';
END IF;
END;
$$;