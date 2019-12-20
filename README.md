# Spectacular Cranes - Data Science Seminar Checkpoints
Here we host the questions and answers for the checkpoints completed as part of Northwestern's Data Science Seminar Course in collaboration with the [Invsible Institute](https://invisible.institute/police-data).

## Team Members
* [Grant Gasser](https://www.linkedin.com/in/grantgasser/)
* [Sundaram Thevar](https://www.linkedin.com/in/sundaram30/)
* [Kartik Kesavabhotla](https://www.mccormick.northwestern.edu/artificial-intelligence/overview/meet-our-students/2019-20/kartik-kesavabhotla.html)

## Background
[Motivation](https://invisible.institute/police-data/)

## Our Project Theme
Our theme is about looking at how the allegation categories have changed over time, using older data provided to us by the Invisible Institute. A step we decided to take recently is to see for a given allegation category, what is the most common new category name it has in CPDB? In CP2, we defined the "mapping" (allegation_mapping_boolean) using this most common idea. If this field is false, we assume the mapping is violated and that something fishy may be going on with this allegation. This is not always the case, but we have observed odd changes more often using this technique. One example of an allegation being changed to something completely different: "Choked" => "Telephone / Attorney / Relative Priv."

Here's another example to clarify this "mapping" idea: In the mapping table we saw that "Illegal Arrest / False Arrest" from the old data maps to "Illegal Arrest / False Arrest" in the new data 98.6% of the time, it is safe to say this is the "true" mapping. Thus, any allegation in the mapping table with an old_category of "Illegal Arrest / False Arrest" and new_allegation_name as "Illegal Arrest / False Arrest" would have a true in the allegation_mapping_boolean field. If the new_allegation_name was different, it would have false in the boolean field and we would say that it violates the mapping. For example, there are a few records where "Illegal Arrest / False Arrest" has changed to "Use of Profanity," a seemingly unrelated and much less severe category, which might indicate something fishy is going on.

To create this mapping, we `joined case_info_08282018` with CPDB tables such as `data_allegation`, `data_allegationcategory`, `data_officer`.

## Conclusion
We learned a lot in this project. Not only did we learn new tools and analytical methods, but we learned a lot about the Chicago Police and the CPDP project. A large percentage of allegations have their category strings changed (in our estimation, about ⅓). Most of the changes are benign, but there is a subset of allegations that change to a category that is completely different. There are others that changed to something much less severe. Why is this? Are some of these clerical errors? Is this a technique the Department uses to mask the severity of certain allegations? 
We noticed that “Miscellaneous” is used a catch-all term. There are some very serious allegations that are being defined as “Miscellaneous.” The term is vague and non-descriptive and also masks the severity of certain allegations. Another common cover is “Seat Belts.” This category is used in CPDB often when the previous allegation category is completely unrelated. 
In closing, we believe we have just scratched the surface and we hope that our work is a baseline for further investigation. Hopefully those with more knowledge about the project can read our analysis and either make confirmations, or come up with new questions that can be answered using our data and analysis.

## Future Work
In each checkpoint, we mention ways to expand on the questions we asked for the analysis. Overall, the most promising future analysis would be integrating the [Severity Analysis](https://docs.google.com/spreadsheets/d/1b408GPeKjiK3ZcqWACDNK19JMKTOBbPHGPO25HNHM6s/edit#gid=0) with our mapping data. As opposed to doing sentiment analysis, we could truly see if allegations were changed to a category that is less severe. This would allow the Invisible Institute to have an even smaller subset of allegations where the categories changed, ones in which the severity of the allegation was altered. 
