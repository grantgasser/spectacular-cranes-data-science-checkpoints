-- Checkpoint 1, Question 3
-- Can we compare the distribution of allegation categories 
-- from the old data set case_info_08282018 to the new data set (using COUNT and GROUP BY)?


-- TIME PERMITTING: normalize these numbers, allows a better comparison

-- see allegation category distribution from old data
select current_category, count(current_category) 
from case_info_08282018 group by current_category


-- category distribution from new cpdb data
select category, count(category) from data_allegation da, 
data_officerallegation doa, data_allegationcategory dac
where doa.allegation_id = da.id
and dac.id = doa.allegation_category_id
group by category


