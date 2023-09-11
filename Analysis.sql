/*
The following query was used to calculate the minimum, maximum, 
and average values for total steps, calories burned, and distance tracked grouped by ID.
*/
SELECT id
	, MIN(totalsteps) AS min_steps 
	, MAX(totalsteps) AS max_steps
	, ROUND(AVG(totalsteps),2) AS avg_steps
	, MIN(totaldistance) AS min_distance
	, MAX(totaldistance) AS max_distance
	, ROUND(AVG(totaldistance),2) AS avg_distance
	, MIN(calories) AS min_calories
	, MAX(calories) AS max_calories
	, ROUND(AVG(calories),2) AS avg_calories
FROM daily_activity
GROUP BY id
ORDER BY id

-- Number of records created on each day of the week
SELECT COUNT(id)
	 , dayoftheweek
FROM daily_activity
GROUP BY dayoftheweek
ORDER BY COUNT(id) DESC

-- Avg steps grouped by day of week
SELECT dayoftheweek
	 , ROUND(AVG(totalsteps),0) AS avg_steps
FROM daily_activity
GROUP BY dayoftheweek
ORDER BY avg_steps DESC
-- Avg number of steps taken by week
SELECT DISTINCT
    (SELECT ROUND(AVG(totalsteps),2)
    	FROM daily_activity
    	WHERE date BETWEEN '2016-04-12' AND '2016-04-19') AS week1_avgtotalsteps

    , (SELECT ROUND(AVG(totalsteps),2)
    	FROM daily_activity
    	WHERE date BETWEEN '2016-04-19' AND '2016-04-26') AS week2_avgtotalsteps

    , (SELECT ROUND(AVG(totalsteps),2)
    	FROM daily_activity
    	WHERE date BETWEEN '2016-04-26' AND '2016-05-03') AS week3_avgtotalsteps

    , (SELECT ROUND(AVG(totalsteps),2)
    	FROM daily_activity
    	WHERE date BETWEEN '2016-05-03' AND '2016-05-12') AS week4_avgtotalsteps
FROM daily_activity;
-- Avg number of steps taken by hour
SELECT hour
	, ROUND(AVG(steptotal),2) AS avg_steps_hr
FROM hourly_steps
GROUP BY hour
ORDER BY avg_steps_hr DESC
-- Avg calories burned by day of week
SELECT dayoftheweek
	 , ROUND(AVG(calories),0)
FROM daily_activity
GROUP BY dayoftheweek
-- Avg calories burned by week
SELECT DISTINCT
	(SELECT ROUND(AVG(calories),2)
		FROM daily_activity
		WHERE date BETWEEN '2016-04-12' AND '2016-04-19') AS week1_avgcal

	, (SELECT ROUND(AVG(calories),2)
		FROM daily_activity
		WHERE date BETWEEN '2016-04-19' AND '2016-04-26') AS week2_avgcal
	
	, (SELECT ROUND(AVG(calories),2)
		FROM daily_activity
		WHERE date BETWEEN '2016-04-26' AND '2016-05-03') AS week3_avgcal
	
	, (SELECT ROUND(AVG(calories),2)
		FROM daily_activity
		WHERE date BETWEEN '2016-05-03' AND '2016-05-12') AS week4_avgcal
FROM daily_activity
-- Avg calories burned by hour of day
SELECT hour
	 , ROUND(AVG(calories),2) AS avg_cals_hr
FROM hourly_calories
GROUP BY hour
ORDER BY avg_cals_hr DESC
-- Avg calories burned and steps taken by hour of day
SELECT hour
	 , ROUND(avg(calories),2) AS avg_cal
	 , ROUND(avg(steptotal),2) AS avg_step
FROM hourly_activity
GROUP BY hour
ORDER BY hour ASC
-- Avg calories burned and steps taken by day of week
SELECT dayoftheweek
	 , ROUND(avg(calories),2) AS avg_cal
	 , ROUND(avg(totalsteps),2) AS avg_step
FROM daily_activity
GROUP BY dayoftheweek

/* CDC Activity Level Categorization by ID
 Number of Steps	Classification
10,000 or more	Meets Recommendation
7,500 - 9,999	Moderately Active
5,000 - 7,499	Somewhat Active
5,000 or less	Sedentary */

SELECT id
	 , avg_daily_steps
	 , (CASE
		WHEN avg_daily_steps >= 10000 THEN 'Meets Recommendation'
	 	WHEN avg_daily_steps BETWEEN 7500 AND 9999 THEN 'Moderately Active'
	 	WHEN avg_daily_steps BETWEEN 5000 AND 7500 THEN 'Somewhat Active'
	 	WHEN avg_daily_steps <= 5000 THEN 'Sedentary'
		ELSE 'NA'
	END) AS classification
FROM 
	(SELECT id
	 	  , ROUND(AVG(totalsteps),0) AS avg_daily_steps
	FROM daily_activity
	GROUP BY id
	ORDER BY avg_daily_steps DESC) AS cdc_activity
-- Counting users in each CDC level
SELECT classification
	 , COUNT(classification)
FROM avg_steps_class
GROUP BY classification
-- Users tracking frequency over time, grouped by id
SELECT id
	 , COUNT (id) AS Total_ID
FROM daily_activity 
GROUP BY id 
ORDER BY total_id DESC
/* 
Created view showing users with the number of days they tracked during the month
*/
 SELECT id
 	  , count(id) AS total_id
FROM daily_activity
GROUP BY id
ORDER BY (count(id)) DESC

/*
Created user categories table called user_type_tracking
28 to 31 days: Consistent Users
20 to 27 days: Regular Users
15 to 19 days: On and Off Users
Less than 15 days: Sporadic User
*/
SELECT id
	 , total_id
	 , CASE
            WHEN total_id >= 28 AND total_id <= 31 THEN 'consistent user'
            WHEN total_id >= 20 AND total_id <= 27 THEN 'regular user'
            WHEN total_id >= 15 AND total_id <= 19 THEN 'on and off user'
            WHEN total_id < 15 THEN 'sporadic user'
            ELSE NULL
        END AS user_type
FROM tracker_use_freq;
-- Used user_type_tracking to count number of users in each category
SELECT user_type
	 , COUNT(user_type)
FROM user_type_tracking
GROUP BY user_type
-- Avg number of minutes tracked daily by user id
SELECT ID
	 , ROUND(AVG(veryactiveminutes + fairlyactiveminutes + lightlyactiveminutes + sedentaryminutes),2) AS avg_total_mins_tracked
FROM daily_activity
GROUP BY ID
ORDER BY avg_total_mins_tracked DESC
-- Created view from above query called avg_mins_tracked_id and ran query to calculate percent of day tracked
SELECT id
	 , avg_total_mins_tracked
	 , ROUND((avg_total_mins_tracked / 1440),2) * 100 AS percent_day_tracked
FROM avg_mins_tracked_id
/*Created query to catgorize users based on the average percent of the day they tracked
100%: Perfect Tracking
75 - 99%: Consistent Tracking
Less than 75%: Less Consistent Tracking
*/
SELECT id
	 , percent_day_tracked
	 , (CASE
			WHEN percent_day_tracked >= 100 THEN 'Perfect Tracking'
			WHEN percent_day_tracked BETWEEN 75 AND 99 THEN 'Consistent Tracking'
			WHEN percent_day_tracked <= 75 THEN 'Less Consistent Tracking'
			ELSE 'NA'
		END) AS classification
FROM percent_day_tracked
ORDER BY percent_day_tracked DESC
-- Query for count of users in each category
SELECT classification
	 , COUNT(classification)
FROM percent_track_class
GROUP BY classification
ORDER BY count DESC