SELECT * FROM crime_scene_report WHERE type = 'murder' AND city = 'SQL City';

SELECT MAX(address_number) FROM person WHERE address_street_name = 'Northwestern Dr';

SELECT * FROM person WHERE address_street_name = 'Franklin Ave' AND name LIKE '%Annabel%' OR address_street_name = 'Northwestern Dr' 
AND address_number = 4919;
         
SELECT * FROM interview WHERE person_id = 14887 OR person_id= 16371;

SELECT * FROM get_fit_now_member WHERE membership_status = 'gold' AND id LIKE '48Z%';

SELECT * FROM get_fit_now_check_in WHERE check_in_date = 20180109 AND membership_id LIKE '48Z%'; 

SELECT * FROM drivers_license WHERE plate_number LIKE '%H42W%';  

SELECT * FROM person WHERE license_id = 423327 OR license_id = 664760;

SELECT * FROM interview WHERE person_id = 67318;

SELECT * FROM drivers_license WHERE car_make LIKE '%Tesla%' AND car_model = 'Model S' AND hair_color = 'red' AND gender = 'female'; 

SELECT * FROM person WHERE license_id = 918773 OR license_id = 291182 OR license_id = 202298;

SELECT * FROM facebook_event_checkin WHERE date LIKE '201712%' AND event_name LIKE '%Symphony%' AND person_id = 99716 
OR person_id = 90700 OR person_id = 78881;

SELECT * FROM income WHERE ssn = 987756388;

SELECT * FROM interview WHERE person_id = 99716;

SELECT name FROM person WHERE id = 99716;
