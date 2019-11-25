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

## Questions
1. 
2. 

## Answers
See `findings.pdf`
