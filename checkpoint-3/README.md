# Checkpoint 2

## Project Theme Summary
Our theme is about looking at how the allegation categories have changed over time from previous Chicago Police databases. For now, we are only looking at one old table: `case_info_08282018`. We compare old allegation data (not inclduded in CPDB) with the allegation data found in CPDB. A step we decided to take recently is to see for a given allegation category for a record in the old dataset, what is the most common new category name it has in CPDB? If we can define the "mapping" using this most common idea, then we have some idea about how the category names have changed over time. If we see a record where the mapping is violated (the new category name is not what is usually most common), then we may have some information here. This could reveal some foul play such as changing the allegation category to something less "severe" or something completely unrelated. 

For example, if we see that "Illegal Arrest / False Arrest" from the old data maps to "Illegal Arrest / False Arrest" in the new data 98.6% of the time, it is safe to say this is the "true" mapping. In this case, it is fairly obvious because the strings are exactly the same. But this is not always the case. There are a few examples where "Illegal Arrest / False Arrest" has changed to "Use of Profanity," a seemingly unrelated and much less severe category. 

To create this mapping, we joined `case_info_08282018` with CPDB tables such as `data_allegation`, `data_allegationcategory`, `data_officer`, etc and used Trifacta to find the mapping and store in two tables: `mapping_allegation_old_to_new` and `mapping_location_old_to_new`.

## Background
Our project requires old data that was provided to us by the Invisible Institute and Professor Rogers. **NOTE: you will need this data for the workbook and D3 visualization to work**. Here are instructions for loading the data and creating the new `case_info_08282018` table:

## Loading the data

### Import old data set (Instructions)
* The first thing you should do is download `cpdb_public_case_info_08282018_data_inserts.sql.zip` from the repository which contains the old allegation data. You can copy the file from your machine and store it in **Downloads**. You can make a copy of the one in you current folder or download it from the [github repo](https://github.com/grantgasser/spectacular-cranes-data-science-checkpoints/tree/master/checkpoint2).

**NOTE:** Be sure to store this in the **Downloads** folder (you want to avoid spaces in your file path). Make sure you   unzip the file after downloading (can usually do so by just clicking on the folder).

* Login into the database in the terminal:
Run `psql cpdb postgres`, then enter your password. You should now see `cpdb=#` in your terminal if the login was successful.

* Let's create the table and populate it! To do so, simply run:
`cpdb=# \i <YOUR_PATH_HERE_Downloads/cpdb_public_case_info_08282018_data_inserts.sql> `.
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

* Finally, in the terminal, you can run `cpdb=# select * from case_info_08282018;` to test if the data was properly loaded.

**HAVING TROUBLE** loading data? Contact sundar@northwestern.edu. You may also view the output png files provided to see the results.


## Opening the Notebook
See `WorkbookLoading.pdf` for more assistance. The workbook contains the visualizations to Questions 1-3. To load the Tableau workbook, `CP2_Workbook_Cranes.twb`, simply click on the file on your local machine. Tableau may prompt you to login to your postgres server. Assuming the `case_info` data is loaded, the visualizations should load.

## Clean Up
When you are finished viewing the visualizations, be sure to run `drop table case_info_08282018` to remove the table from CPDB.

## Questions



## Answers
See `findings.pdf`
