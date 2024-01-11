SELECT * FROM murder_mystry_sql.investigation_result;
/*TASK:- Run a query to retrieve the crime scene report for the murder that occurred on Jan.15, 2018, in SQL City. 
Gather all available details from the report.*/
SELECT * FROM murder_mystry_sql.crime_scene_report
where date = '20180115' and city = "SQL City" and type="murder";

/* TASK:- Check the personal details of witnesses involved in the case. Retrieve their names, addresses, 
and any other relevant information.*/
                                  /*First witness*/
SELECT * FROM murder_mystry_sql.person
where address_street_name ="Northwestern Dr" 
order by address_number desc
limit 1;
							   /*Second witness*/
SELECT * FROM murder_mystry_sql.person
where name like "%Annabel%" and address_street_name ="Franklin Ave" 

/*TASK:- Access the recorded interviews of witnesses conducted after the murder. Gather insights into their statements and potential clues.*/
SELECT * FROM murder_mystry_sql.interview
where person_id in (14887,16371)

/*TASK:- Investigate the gym database using details obtained from the crime scene report and witness interviews. Look for any gym-related information that might be relevant.*/
SELECT * FROM murder_mystry_sql.get_fit_now_member
where membership_status ="gold"
and id like "48Z%"

/*TASK:- Examine the car details associated with the crime scene. Retrieve information about the vehicles present during the incident.*/
SELECT * FROM murder_mystry_sql.drivers_license
where plate_number like "%H42W%"

/*Task: Identify and collect personal details mentioned in the previous query. This includes names, addresses, and any additional details.*/
USE murder_mystry_sql
SELECT * FROM  murder_mystry_sql.person
INNER JOIN driver_licence ON person.ID = driver_licence.ID;

SELECT * FROM murder_mystry_sql.person
where name = "Jeremy Bowers";
                      -- FINAL query -- 
SELECT p.name, p.id, plate_number from  murder_mystry_sql.person p
left join murder_mystry_sql.drivers_license d on d.id = p.license_id
where p.id in (67318, 28819)
and d.plate_number like "%H42W%";

/*TASK:- Analyze the collected data, including crime scene reports, witness interviews, gym records, and car details. Draw conclusions or hypotheses based on the information available.*/
SELECT  * FROM  murder_mystry_sql.interview where person_id="67318";

USE murder_mystry_sql;
Select p.id, p.name, d.hair_color, d.height, d.gender, i.annual_income, d.car_make, d.car_model from person p
left join drivers_license d on d.id= p.license_id
left join income i on i.ssn=p.ssn
left join facebook_event_checkin f on p.id=f.person_id
where d.hair_color='red' and height between 65 and 67
and d.gender = 'female' and d.car_make = "Tesla" and car_model = "Model S"
and f.event_name = "SQL Symphony Concert" and date between "20171201" and "20171231"
order by i.annual_income desc;









