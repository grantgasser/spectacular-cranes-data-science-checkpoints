# Checkpoint 1

## Our Questions from the Proposal (altered a bit)
1. Can we acquire old allegation data from the Invisible Institute (Rajiv Sinclair) and add that data to our database as new table(s)?
2. What allegations have changed?
	* Time permitting: what categories of allegations are changed the most?
3. Can we compare the distribution of allegation categories from the old data set `case_info_08282018` to the new data set (using COUNT).
4. What data attributes are changed the most? (e.g. category of the allegation, or officers involved, etc)
5. How often do changes in allegations happen?

## Answers based on queries
1. Our theme is looking at how allegations have been changed over time (e.g. The type of allegation being changed to something less serious). This requires us to access data not currently available in CPDB. Professor Rogers and the Invisible Institute provided us with access to database files and we found `08_28_2018_case_info` to be the most useful for answering these questions.
2. File: **cp1_2.sql**. After creating a table called `case_info_08282018` to store the old allegation data, we joined it with other relevant tables in the DB. We joined it with the other allegation tables to give us a chance to see which allegations have changed. Unfortunately, the result showed that although the allegation category strings are different, they still mean the same thing. For example, if you look at **Question2.png**, you can see that although the atrribute **current_category** from the old data (`case_info_08282018`) changed, it still means something similar to **category** in the new dataset. For example, **Question2.png** shows towards the bottom that an allegation category of "SEARCH OF PREMISE WITHOUT WARRANT" is now represented as "Illegal Search." They essentially mean the same thing, and is certainly not evidence of investigators changing the allegation to make it seem less serious.
3. File: **cp1_3.sql**. After running this query, we found...
4. File: **cp1_4.sql**. After running this query, we found...
5. File: **cp1_5.sql**. After running this query, we found...

## Steps for execution

### Import old data set (Instructions)
Since our project theme involves identifying the change in allegation information as compared to the current version of the information, we needed data from old versions of case data. 
We were able to get the data from Prof. Rogers and below are the instructons to load data from .csv files into the cpdb database. We created table with below DDL script :

```
create table if not exists case_info_08282018
(
	log_no varchar,
	incident_fromdate varchar,
	incident_todate varchar,
	complaint_date varchar,
	closedatcopa_datetime varchar,
	current_status varchar,
	location_code varchar,
	street_no varchar,
	street_direction varchar,
	street_nme varchar,
	apt_no varchar,
	city varchar,
	state varchar,
	zip_cd varchar,
	occurance_beat integer,
	current_category_code varchar,
	current_category varchar,
	current_category_type varchar,
	police_shooting varchar,
	complainant_type varchar,
	investigating_agency varchar,
	id serial not null
		constraint case_info_08282018_pk
			primary key
);
alter table case_info_08282018 owner to postgres;
```

Since now we have the table lets load data into it from the csv file:


```
COPY case_info_08282018(log_no,
incident_fromdate,
incident_todate,
complaint_date,
closedatcopa_datetime,
current_status,
location_code,
street_no,
street_direction,
street_nme,
apt_no,
city,
state,
zip_cd,
occurance_beat,
current_category_code,
current_category,
current_category_type,
police_shooting,
complainant_type,
investigating_agency) 
FROM "/Users/sundar/Downloads/08_28_2018_case_info.csv" DELIMITER ',' CSV HEADER;
```
**NOTE** that your file path will be different on the last line ^

### Run the follow SQL files
* cp1_2.sql
* cp1_3.sql
* cp1_4.sql
* cp1_5.sql

* Or directly run these queries once the data is loaded using psql in the terminal, pgAdmin, DataGrip, etc.
