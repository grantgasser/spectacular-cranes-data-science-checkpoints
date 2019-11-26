# Checkpoint 4

## Project Theme Summary
Our theme is about looking at how the allegation categories have changed over time, using older data provided to us by the Invisible Institute. A step we decided to take recently is to see for a given allegation category, what is the most common new category name it has in CPDB? In CP2, we defined the "mapping" (`allegation_mapping_boolean`) using this most common idea. If this field is **false**, we assume the mapping is violated and that something fishy may be going on with this allegation. This is not always the case, but we have observed odd changes more often using this technique. One example of an allegation being changed to something completely different: "Choked" => "Telephone / Attorney / Relative Priv."

Here's another example to clarify this "mapping" idea: In the mapping table we saw that "Illegal Arrest / False Arrest" from the old data maps to "Illegal Arrest / False Arrest" in the new data 98.6% of the time, it is safe to say this is the "true" mapping. Thus, any allegation in the mapping table with an `old_category` of "Illegal Arrest / False Arrest" and `new_allegation_name` as "Illegal Arrest / False Arrest" would have a **true** in the `allegation_mapping_boolean` field. If the `new_allegation_name` was different, it would have **false** in the boolean field and we would say that it violates the mapping. For example, there are a few records where "Illegal Arrest / False Arrest" has changed to "Use of Profanity," a seemingly unrelated and much less severe category, which might indicate something fishy is going on.

To create this mapping, we joined `case_info_08282018` with CPDB tables such as `data_allegation`, `data_allegationcategory`, `data_officer`.

## CP4 Data
We use the mapping table joined back with the allegation data (see `cp4.sql`) to construct our graph. Note that the query only pulls allegations where `allegation_mapping_boolean` is **false** (the mapping is violated).

## Graph Structure
Each vertex is an officer. Two vertices have an edge if they were listed on the same allegation (remember, only allegations where the mapping was violated, which means the allegation category was changed in a potentially suspicious way). This is basically just the co-accusal analysis but this only looks at allegations where the category changed in the police database.
* Vertex: `(officer_id, officer_fname, officer_lname, complaint_percentile)`
* Edge: `(src, dst, crid, old_category, new_category)`

## Submission (If you have trouble loading the data or running the notebook)
* Then just view the analysis here: 
[Submission Notebook](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/2972359237889048/2026875101445323/3016676346692700/latest.html)

## Loading Data and Running Notebook (in Databricks)
* Make sure you have a cluster running before you load the data.
* Load `mapping_and_allegation_joined.csv` into Databricks (**Data** => **Add Data** => **Drag the file or upload** => **Create Table with UI**. Select the cluster you are running and ensure the table is named `mapping_and_allegation_joined`! ([Help](https://docs.databricks.com/data/tables.html)). 
* Make sure the box that says "First row is header" is checked. Also, change the data type of the `allegation_mapping_boolean` (last column) field to BOOLEAN.
* Please do the same thing with the `edges.csv` data. Load the data into Databricks. Name the table `edges` and check the box that says "First row is header." 
* Install GraphFrames: **Cluster** => **Libraries** => **Install New** => **Maven**. Copy/paste `graphframes:graphframes:0.7.0-spark2.4-s_2.11` into the "Coordinates" field. Then click **Install.**
![Libraries](https://github.com/grantgasser/spectacular-cranes-data-science-checkpoints/blob/master/checkpoint-4/libraries.png "Libraries")
* Install NetworkX (for visualization): **Cluster** => **Libraries** => **Install New** => **PyPi**. Copy/paste `networkx` into the "Package" field. Then click **Install**.
* Now visit [our notebook here](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/2972359237889048/2026875101445323/3016676346692700/latest.html) and click **Import** at the top. Copy the URL.
* Navigate to your Databricks account, click on **Workspace**. Then click on the drop down menu and select **Import** => **URL** and the paste the URL.

* Once this is all done, you should be able to run the notebook.

## NOTE
If you are running the notebook yourself, you may have different results. Please refer to our [submission notebook](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/2972359237889048/2026875101445323/3016676346692700/latest.html) in which our analysis is based on.

## Questions
1. Simple [PageRank Explanation](https://towardsdatascience.com/graphs-and-paths-pagerank-54f180a1aa0a). Use PageRank to identify the most "imporant/influential" vertices in the graph. These are officers that are most frequently connected to other offices where the associated allegations have their category changed. 
2. Use the Label Propagation Algorithm to cluster the officers co-accused on allegations where the category changed. The clusters will be identified with "labels." This will allow someone to see not only which officers are frequently co-accused, but which officers are frequently co-accused and then the allegation category later changes.

## Answers
See `findings.pdf`
