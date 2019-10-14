-- Checkpoint 1, Question 2
-- Which allegations have changed?
-- Time permitting: What categories of allegations are changed the most?


select current_category as old_category_desc, current_category_type as old_category, category as current_category from data_allegation da, case_info_08282018 ca, data_officerallegation doa, data_allegationcategory dac
where da.crid = ca.log_no
and doa.allegation_id = da.id
and dac.id = doa.allegation_category_id
and dac.category != ca.current_category
