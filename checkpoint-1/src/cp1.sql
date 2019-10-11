-- Checkpoint 1, Question 1
-- What categories of allegations are changed the most?


-- this will get us started
select * from data_allegation da, data_officerallegation doa,
data_allegationcategory dac
where dac.id = doa.allegation_category_id
and da.id = doa.allegation_id
--and crid like '%1055917%'
