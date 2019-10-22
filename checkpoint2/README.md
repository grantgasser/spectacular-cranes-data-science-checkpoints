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
See `WorkbookLoading.pdf` for more assistance. The workbook contains the visualizations to Questions 1-3. To load the Tableau workbook, `CP2_Workbook_Cranes.twb`, simply click on the file on your local machine. Tableau may prompt you to login to your postgres server. Assuming the `case_info` data is loaded, the visualizations should come up.

## Running the D3 Visualization
FILES: `index.html`, `old_and_new_category_data.csv`. To run the `index.html` file on a local server, cd into the `/src` directory from the terminal. Assuming you have python installed on your machine (if not, just see the attached photos), you can now run:
`python -m http.server`. You should see something like this:
```
(base) Grants-MacBook-Pro:d3 grantgasser$ python -m http.server
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
127.0.0.1 - - [21/Oct/2019 21:17:46] "GET / HTTP/1.1" 200 -
127.0.0.1 - - [21/Oct/2019 21:17:46] "GET /old_and_new_category_data.csv HTTP/1.1" 200 -
```

Open a new tab in your browser and type in `localhost:8000` as the url to see the interactive visualization.


## Questions
1. Is there a significant difference in the distribution of allegation categories in the new data (CPDB) compared to the old data? Visualization of allegation data distribution by category and compare with different versions of allegation tables - i.e. find allegation category distribution from previous version and compare with the current version of cpdb database (density charts)
2. How are the allegation categories of the new data (CPDB) distributed geographically (can we create points on a map to show the distribution?)
3. Similar to question 2, how are allegation categories distributed among beat id's? Can we compare the both the distribution of the old data and the new data? (maybe bubble density chart)
  - a) Category Distribution percentage by Beat ID : This chart gives the visual concentric layers of category of allegations which also shows the relative strength of different categories - the girth of the circular segment represents the promoninece of the respective allegation categories
  - b) Category percentage by Beat ID : With this visualisation we wanted to represent the relative size of allegation counts by the individual beat units of chicago police department
4. How have the allegation categories changed from the old data to the new (CPDB)? Are there more or less categories? What is the distribution for the categories, old and new? (pie chart or donut chart)


## Answers
1. See `Question1`, `Distribution (Old DB)`, `Distribution (CPDB)` dashboard and sheets in the workbook. You may also look at the attached pictures: `% Distribution (Old data).png` and `% Distribution (CPDB).png`  The first thing to note is the change in the allegation category names from the old data to the new data (CPDB). In the old data, there were many more categories and commonly used ones were "MISCELLANOUS", "ARESTEE-DURING ARREST", and "UNECESSARY PHYSICAL CONTACT 0N-DUTY." Not only is there a significant difference because of the category names, but one can also see there is also a difference where category names seem to be the same. For example, "Excessive Force" in the old data is only 5% whereas "Use of Force" in the new data is 35%. This could be due to name conventions changing, which is the main challenge of our theme.
2. See `Question2` sheet in the workbook or see `Q2_heatmap.png`. Here we can see where allegations occurred and normalized categories for those allegations.
3. See `Question3` and `Question3A` sheets in the workbook or `Q3.png` and `Q3A.png`. For each category, marked by color, you can see the distribution of allegation categories for CPDB where the size of the bubble indicates the % of allegations in a category in that particular beat. For example, beat 132 has a larger 'Operations/Personnel Violations' red bubble than others at 8.5% indicating that a larger percentage of those violations are committed in beat 132.
4. See `/src/d3/index.html` or the two "Screen Shots" of the donut charts to see what the interactive vizualization might look like. Here, with "Old Category Dist" selected, you can see many more categories and a much more skewed distribution. When "New Category Dist" is selected, you can see less categories and a somewhat more even distribution where for example, the purple part is "Use of Force", which confirms what we have seen in previous visualizations such as the one for Question 1.
