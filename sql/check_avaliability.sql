/*
 This function checks the availability of a listing based on the provided listing_id and date range.
 It queries the nz_calendar table for availability and returns 1 if the listing is available for the entire date range and meets the minimum and maximum nights requirement, otherwise it returns 0.
 
 Parameters:
 - p_listing_id: the ID of the listing to check availability for
 - p_start_date: the start date of the date range to check availability for
 - p_end_date: the end date of the date range to check availability for
 
 Returns:
 - 1 if the listing is available for the entire date range and meets the minimum and maximum nights requirement
 - 0 otherwise
 */
CREATE OR REPLACE FUNCTION check_availability(
        p_listing_id NUMERIC,
        p_start_date DATE,
        p_end_date DATE
    ) RETURNS INT AS $$
DECLARE availability_record RECORD;
availability INT;
BEGIN -- Query nz_calendar table for availability based on the provided listing_id and date range
WITH sum_working AS (
    SELECT DISTINCT available,
        minimum_nights,
        maximum_nights
    FROM nz_calendar
    WHERE listing_id = p_listing_id::INT
        AND date BETWEEN p_start_date AND p_end_date
)
SELECT min(available) AS available,
    min(minimum_nights) AS minimum_nights,
    min(maximum_nights) AS maximum_nights INTO availability_record
FROM sum_working;
IF availability_record.available = 't'
AND (p_end_date::DATE - p_start_date::DATE) >= availability_record.minimum_nights
AND (p_end_date::DATE - p_start_date::DATE) <= availability_record.maximum_nights -- Fixed the closing parenthesis here
THEN RETURN 1;
ELSE RETURN 0;
END IF;
END;
$$ LANGUAGE plpgsql;