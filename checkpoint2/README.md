# Checkpoint 2

### GitHub repo link
https://github.com/grantgasser/spectacular-cranes-data-science-checkpoints/tree/master/checkpoint2

## Project Theme Synopsis
Our theme is about looking at how the allegation categories of previous Chicago Police databases has changed. We compare old allegation data (not inclduded in CPDB) with the allegation data found in CPDB.

## Background
Our project requires old data that was provided to us by the Invisible Institute and Professor Rogers. **NOTE: you will need this data for the workbook and D3 visualization to work**. Here are instructions for loading the data and creating the new `case_info_08282018` table:

## Loading the data
**HAVING TROUBLE** loading data? Contact sundar@northwestern.edu. You may also view the output png files provided to see the results.

### Import old data set (Instructions)
* The first thing you should do is download `cpdb_public_case_info_08282018_data_inserts.sql.zip` from the repository which contains the old allegation data. You can copy the file from your machine and store it in **Downloads**. Alternatively, you can navigate to the [GitHub repo](https://github.com/grantgasser/spectacular-cranes-data-science-checkpoints/tree/master/checkpoint2) and click on the file. At the top right, there is the option to download the file. 

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


## Opening the Notebook
FILE: `something.twb`

## Running the D3 Visualization
FILES: `index.html`, `data.tsv`


## Questions
* Is there a significant difference in the distribution of allegation categories in the new data (CPDB) compared to the old data? Visualization of allegation data distribution by category and compare with different versions of allegation tables - i.e. find allegation category distribution from previous version and compare with the current version of cpdb database (density charts)
* Visual Chart (heatmap) that plots the incidence of allegation categories normalized by the # of reports associated with that area. (location-based)
* Find and show visual of Category Distribution as below
    #a) Category Distribution percentage by Beat ID
    #b) Category percentage by Beat ID
* Interactive Chart (FIGURE OUT LATER)


## Answers
* The first thing to note is the change in the allegation category names from the old data to the new data (CPDB). In the old data, there were many more categories and commonly used ones were "MISCELLANOUS", "ARESTEE-DURING ARREST", and "UNECESSARY PHYSICAL CONTACT 0N-DUTY."

## File Descriptions:
