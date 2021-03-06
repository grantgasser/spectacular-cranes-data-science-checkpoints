# Checkpoint 3 - Data Integration

## Project Theme Summary
Our theme is about looking at how the allegation categories have changed over time from previous Chicago Police databases. For now, we are only looking at one old table: `case_info_08282018`. We compare old allegation data (not inclduded in CPDB) with the allegation data found in CPDB. A step we decided to take recently is to see for a given allegation category for a record in the old dataset, what is the most common new category name it has in CPDB? In CP2, we defined the "mapping" using this most common idea. If we see a record where the mapping is violated (the new category name is not what is usually most common), then we may have some information here. This could reveal some foul play such as changing the allegation category to something less "severe" or something completely unrelated. 

For example, if we see that "Illegal Arrest / False Arrest" from the old data maps to "Illegal Arrest / False Arrest" in the new data 98.6% of the time, it is safe to say this is the "true" mapping. In this case, it is fairly obvious because the strings are exactly the same. But this is not always the case. There are a few examples where "Illegal Arrest / False Arrest" has changed to "Use of Profanity," a seemingly unrelated and much less severe category. 

To create this mapping, we joined `case_info_08282018` with CPDB tables such as `data_allegation`, `data_allegationcategory`, `data_officer`, etc and used Trifacta to find the mapping and store in two tables: `allegation_mapping_old_and_new`.

## Disclaimer
After returning to these queries, we noticed that when integrating the arrests data with our `mapping` table, it only returned allegations from 2001. If further analysis is to be following these queries and questions, this must be fixed.

## Loading the required data

### Import old data set (Instructions)
* Now we want to create the `allegation_mapping_old_and_new` table.
* The first thing you should do is download `LoadDataSQLScript.sql.zip` from the repository which contains mapping of allegation data. You can copy the file from your machine and store it in **Downloads**. You can make a copy of the one in you current folder or download it from the [github repo](https://github.com/grantgasser/spectacular-cranes-data-science-checkpoints/blob/master/checkpoint-3/src/LoadDataSQLScript.sql.zip).

**NOTE:** Be sure to store this in the **Downloads** folder (you want to avoid spaces in your file path). Make sure you   unzip the file after downloading (can usually do so by just clicking on the folder).

* Login into the database in the terminal:
Run `psql cpdb postgres`, then enter your password. You should now see `cpdb=#` in your terminal if the login was successful.

* Let's create the table and populate it! To do so, simply run:
`cpdb=# \i <YOUR_PATH_HERE_Downloads/LoadDataSQLScript.sql> `.
  - An easy way to get the path of the file is to locate it in Finder and simply drag the file to the terminal.

* In the terminal, you should see something like this:
```
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
```
to suggest the table was created and the data is loading.

* Finally, in the terminal, you can run `cpdb=# select * from allegation_mapping_old_and_new;` to test if the data was properly loaded.

**HAVING TROUBLE** loading data? Contact sundar@northwestern.edu. You may also view the output png files provided to see the results.

## Create Temporary Arrest/Allegation Table 
We have some join queries that integrate the arrest and allegation data (stored in `temp_arrests_and_allegations_total`) to be further joined with (in the queries) our mapping table (`allegation_mapping_old_and_new`) using `crid`. 

Please run the three queries in `create_temp.sql` one by one. **Note:** the second query may take a while to run, but it should be less than 1-2 minutes.


## Clean Up
Run ```drop table allegation_mapping_old_and_new;
drop table temp_arrests_and_allegations_total; 
drop table temp_arrests_and_allegations_2;
drop table temp_arrests_and_allegations;``` 
to remove the tables from CPDB.


## Questions
1. For each officer, count the number of allegation changes, showing the old and new category name.
2. Identify the top 10 officers whose associated allegations (categories) change most often.
3. Similar to #2, can we identify the top 10 investigators of allegations where the categories of those allegations changed the most? 
4. What percentage allegations had their category changed? Of those, what are the top 3 most common statute descriptions (we might be able to identify some common cover charges)? 

## Answers
See `findings.pdf`
