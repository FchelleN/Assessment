
SELECT
b.customer_country , 
b.time_category , 
b.age_bracket ,
b.channel , 
b.gender , 
b.product_type ,
b.client_name,
b.sent_at_date , 
COUNT(b.message_id) as count_of_messages_sent ,
SUM(b.converted) as converted , 
SUM(b.clicked) as clicked ,
SUM(b.clicked) / COUNT(message_id) as clicked_through_rate ,
SUM(b.converted) / COUNT(message_id) as converted_through_rate
FROM
(
SELECT
a.message_id ,
a.customer_country ,
a.sent_at ,
a.age_bracket ,
a.channel ,
a.gender ,
a.clicked ,
a.converted ,
a.product_type , 
a.client_name ,
CAST(a.sent_at AS date) as sent_at_date ,
CONVERT(TIME, a.sent_at) AS extracted_time , 
FORMAT(CONVERT(time, a.sent_at), 'hh:mm tt') AS extracted_time2 ,
CONVERT(varchar(16), CONVERT(time, a.sent_at), 100) AS extracted_time3 , 
CASE
           WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '01:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '02:00:00' THEN '1am - 2am'
           WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '02:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '03:00:00' THEN '2am - 3am'
           WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '03:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '04:00:00' THEN '3am - 4am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '04:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '05:00:00' THEN '4am - 5am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '05:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '06:00:00' THEN '5am - 6am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '06:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '07:00:00' THEN '6am - 7am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '07:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '08:00:00' THEN '7am - 8am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '08:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '09:00:00' THEN '8am - 9am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '09:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '10:00:00' THEN '9am - 10am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '10:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '11:00:00' THEN '10am - 11am'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '11:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '12:00:00' THEN '11am - 12pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '12:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '13:00:00' THEN '12pm - 1pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '13:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '14:00:00' THEN '1pm - 2pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '14:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '15:00:00' THEN '2pm - 3pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '15:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '16:00:00' THEN '3pm - 4pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '16:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '17:00:00' THEN '4pm - 5pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '17:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '18:00:00' THEN '5pm - 6pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '18:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '19:00:00' THEN '6pm - 7pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '19:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '20:00:00' THEN '7pm - 8pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '20:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '21:00:00' THEN '8pm - 9pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '21:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '22:00:00' THEN '9pm - 10pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '22:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '23:00:00' THEN '10pm - 11pm'
		   WHEN CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) >= '23:00:00' AND CONVERT(time, CONVERT(varchar(16), CONVERT(time, a.sent_at), 100)) < '24:00:00' THEN '11pm - 12am'
           ELSE 'Other'
       END AS time_category
FROM communications a
) b
GROUP BY b.customer_country , 
b.time_category ,
b.age_bracket ,
b.channel ,
b.gender ,
b.client_name ,
b.sent_at_date , 
b.product_type
ORDER BY COUNT(b.message_id) DESC
