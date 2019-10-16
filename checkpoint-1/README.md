# Checkpoint 1
Our theme requires access to older allegation data not contained in the CPDB database. Here we provide a script to load one csv file (zipped up in `cpdb_public_case_info_08282018_data_inserts.sql.zip`) that was provided to us.

## Loading the data
**HAVING TROUBLE** loading data? Contact sundar@northwestern.edu. You may also view the output png files provided to see the results of the queries.

### Import old data set (Instructions)
* The first thing you should do is download `cpdb_public_case_info_08282018_data_inserts.sql.zip` from the repository which contains the old allegation data. **NOTE:** Be sure to store this in the **Downloads** folder (you want to avoid spaces in your file path). Make sure you unzip the file after downloading (can usually do so by just clicking on the folder).

* Login into the database in the terminal:
Run `psql cpdb postgres`, then enter your password. You should now see `cpdb=#` in your terminal.

After logging into the database, either in your terminal, in pgAdmin, or another tool such as DataGrip, run this query to create the new table where we will store the old allegation data in a table called `case_info_08282018`. 
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

* Now we have an empty table! Let's populate it with the data provided in the csv stored in: `cpdb_public_case_info_08282018_data_inserts.sql`. To do so, simply run: 
`cpdb=# \i <PATH_TO_THE_FILE_SHOULD_LOOK_LIKE_THIS_Downloads/cpdb_public_case_info_08282018_data_inserts.sql `.


**NOTE** that your file path will be different on the last line ^

### Run the follow SQL files
* cp1_2.sql
* cp1_3.sql
* cp1_4.sql

* Or directly run these queries once the data is loaded using psql in the terminal, pgAdmin, DataGrip, etc.


* **NOTE:** We encountered a bit of a curveball in question #2, which required us to adjust our questions and expectations. Apparently, the names of the allegation categories have changed over the years, despite having similar meaning. This makes it really difficult to tell when allegations were changed to something completely different (possibly less severe) or when the category was just renamed. See #2 for more details.

## Our Questions from the Proposal (altered a bit)
1. Can we acquire old allegation data from the Invisible Institute (Rajiv Sinclair) and add that data to our database as new table(s)?
2. What allegations have changed?
	* Time permitting: what categories of allegations are changed the most?
3. Can we compare the distribution of allegation categories from the old data set `case_info_08282018` to the new data set (using COUNT and GROUP BY)?
4. Using the data generated in Question 3, can we use the discipline data to see how many allegations were disciplined, grouped by category?

## Answers based on queries
1. Our theme is looking at how allegations have been changed over time (e.g. The type of allegation being changed to something less serious). This requires us to access data not currently available in CPDB. Professor Rogers and the Invisible Institute provided us with access to database files and we found `08_28_2018_case_info` to be the most useful for answering these questions.
2. File: **cp1_2.sql**. After creating a table called `case_info_08282018` to store the old allegation data, we joined it with other relevant tables in the DB. We joined it with the other allegation tables to give us a chance to see which allegations have changed. Unfortunately, the result showed that although the allegation category strings are different, they still mean the same thing. For example, if you look at **Question2.png**, you can see that although the atrribute **current_category** from the old data (`case_info_08282018`) changed, it still means something similar to **category** in the new dataset. For example, **Question2.png** shows towards the bottom that an allegation category of "SEARCH OF PREMISE WITHOUT WARRANT" is now represented as "Illegal Search." They essentially mean the same thing, and is certainly not evidence of investigators changing the allegation to make it seem less serious.
3. File: **cp1_3.sql**. Here we compare the distributions of categories in the old data, `case_info_08282018`, and the new data in CPDB. The output can be seen in **Question3_old_data.png** and **Question3_new_data.png**. Further analysis can be done when normalizing the data. This may show how the distribution of allegation categories has changed over time.
4. File: **cp1_4.sql**. See **Question4.png** for output, showing how many allegations were disciplined in each category. Interestingly, **Drug / Alcohol Abuse** had a discipline rate of >50%, which is much higher than most categories. On the other hand, **Illegal Search** was hardly ever disciplined, having a dismal discipline rate of .3%, implying that either many allegations of illegal search are unfounded, hard to prove, or just simply not discplined for no good reason. It is likely a combination of both. Further analysis may benefit from normalization (time-permitting). 
