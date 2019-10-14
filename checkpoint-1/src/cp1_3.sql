-- Checkpoint 1, Question 3
-- Which investigators/administrators most often changed the category
-- of allegation (e.g. “Sexual assault” -> “Illegal Search and Seizure”)


-- see allegation category distribution from old data
select current_category, count(current_category) 
from case_info_08282018 group by current_category


-- category distribution from new cpdb data



