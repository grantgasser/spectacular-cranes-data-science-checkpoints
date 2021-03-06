# Checkpoint 2

## Project Theme Summary
Our theme is about looking at how the allegation categories have changed over time from previous Chicago Police databases. For now, we are only looking at one old table: `case_info_08282018`. We compare old allegation data (not inclduded in CPDB) with the allegation data found in CPDB. A step we decided to take recently is to see for a given allegation category for a record in the old dataset, what is the most common new category name it has in CPDB? If we can define the "mapping" using this most common idea, then we have some idea about how the category names have changed over time. If we see a record where the mapping is violated (the new category name is not what is usually most common), then we may have some information here. This could reveal some foul play such as changing the allegation category to something less "severe" or something completely unrelated.

For example, if we see that "Illegal Arrest / False Arrest" from the old data maps to "Illegal Arrest / False Arrest" in the new data 98.6% of the time, it is safe to say this is the "true" mapping. In this case, it is fairly obvious because the strings are exactly the same. But this is not always the case. There are a few examples where "Illegal Arrest / False Arrest" has changed to "Use of Profanity," a seemingly unrelated and much less severe category.

To create this mapping, we joined `case_info_08282018` with CPDB tables such as `data_allegation`, `data_allegationcategory`, `data_officer`, etc and used Trifacta to find the mapping and store in two tables: `mapping_allegation_old_to_new.csv` and `mapping_location_old_to_new`.

We have excel files from the Trifacta workflow that are used in Tableau: `mapping_location_old_to_new.xlsx` and `mapping_allegation_old_to_new.xlsx`

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

## Loading XL files into Workbook
We have two excel files, `mapping_allegation_old_to_new.xlsx` and `mapping_location_old_to_new.xlsx` that need to be loaded as data sources for the workbook.

* First, at the top left, click on `Data` -> `New Data Source` -> `Microsoft Excel` and then select the two excel files.
* These are used in Question2 and Question3.

## Running the D3 Visualization
- In Terminal, navigate to `src/d3/`
- Start a webserver with either `node` or `Python3`
  - Python: `python -m http.server` (installed with Python3 by default)
  - Node: `http-server` ([install](https://www.npmjs.com/package/http-server))
- Open a tab in your browser and navigate to localhost:[PORT] (usually 8000 or 8080, depending on the webserver used)

## Clean Up
When you are finished viewing the visualizations, be sure to run `drop table case_info_08282018` to remove the table from CPDB.

## Questions
1. Is there a significant difference in the distribution of allegation categories in the new data (CPDB) compared to the old data? Visualization of allegation data distribution by category and compare with both versions of allegation tables (density charts)
2. Create a mapping: For each old category name, what is the most common new category name? This will help us establish a mapping from old category names to new category names. (E.g. "Neglect of Duty" records in the old data changed to "Neglect of Duty" in the new data 97.8% of the time. That means its safe to say that (Neglect of Duty => Neglect of Duty) is the mapping. If we see a record with "Neglect of Duty" in the old data but something different than "Neglect of Duty" in the new data, that might imply the category was changed to something significantly different, which may imply some foul play). We determined the "true" mapping based on which mapping was most common. This can act as a lookup table for the Invisible Inst. or ourselves when we need to know which allegation category a record should correspond to. The goal of this visualization is to allow the user to easily see the mapping. We do the same thing for Location, not just Allegation.
3. Looking at instances where the "true" mapping is violated, try to identify records where allegation category names are commonly changed to a category that is less either "severe" or completely unrelated. This may offer some insight as to whether there are some common techniques used to mitigate the effects of an allegation (i.e. foul play). Like question 2, we also do this for Location and not just Allegation.
4. How have the allegation categories changed from the old data to the new (CPDB)? Are there more or less categories? What is the distribution for the categories, old and new? (pie chart or donut chart)


## Quick Answers
See the Findings.pdf
