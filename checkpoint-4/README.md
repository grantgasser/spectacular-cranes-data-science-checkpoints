# Checkpoint 4

## Project Theme Summary
Our theme is about looking at how the allegation categories have changed over time from previous Chicago Police databases. A step we decided to take recently is to see for a given allegation category, what is the most common new category name it has in CPDB? In CP2, we defined the "mapping" (`allegation_mapping_boolean`) using this most common idea. If this field is **false**, we assume the mapping is violated and that something fishy may be going on with this allegation. This is not always the case, but we have observed odd changes more often using this technique such as some allegation categories changing in the following way: "Choked" => "Telephone / Attorney / Relative Priv." That's just one example of an allegation category that has nothing to do with the original.

To clarify this "mapping" idea, in the mapping table we saw that "Illegal Arrest / False Arrest" from the old data maps to "Illegal Arrest / False Arrest" in the new data 98.6% of the time, it is safe to say this is the "true" mapping. Thus, any allegation in the mapping table with an `old_category` of "Illegal Arrest / False Arrest" and `new_allegation_name` as "Illegal Arrest / False Arrest" would have a **true** in the `allegation_mapping_boolean` field. If the `new_allegation_name` was different, it would have **false** in the boolean field and we would say that it violates the mapping. For example, there are a few records where "Illegal Arrest / False Arrest" has changed to "Use of Profanity," a seemingly unrelated and much less severe category, which might indicate something fishy is going on.

To create this mapping, we joined `case_info_08282018` with CPDB tables such as `data_allegation`, `data_allegationcategory`, `data_officer`.

## CP4 Data
We use the mapping table joined back with the allegation data (see `cp4.sql`) to construct our graph.

## Graph Structure
Each vertex is an officer, and an edge means they were listed on the same allegation. Weight of the edge is how many times they were listed on the same allegation. (basically the co-accusal analysis with our theme’s flavor thrown in).
* Vertex: (officer_id, officer_fname, officer_lname, complaint_percentile)
* Edge: (src, dst, crid, old_category, new_category)


## Questions
1. 
2. 

## Answers
See `findings.pdf`
