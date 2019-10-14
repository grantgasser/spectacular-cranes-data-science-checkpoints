-- Checkpoint 1, Question 4
-- How do changes in the allegation type affect officer behavior?
-- (e.g. If an officer’s allegations are being changed to a less severe
-- type of allegation, are they more likely to continue receiving more
-- complaints because they believe they can get away with it.)


-- this will get us started:
select d.id as officer_id, first_name, last_name,
officer_id, allegation_category_id, complaint_percentile,
category, allegation_name
from data_officer d, data_officerallegation doa, data_allegation da,
data_allegationcategory dac
where d.id = doa.officer_id
and da.id = doa.allegation_id
and dac.id = doa.allegation_category_id
