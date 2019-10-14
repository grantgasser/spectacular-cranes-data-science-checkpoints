-- Checkpoint 1, Question 4
-- What data attributes are changed the most?
-- (e.g. category of the allegation, or officers involved, etc)

select count(CASE WHEN disciplined THEN 1 END) as Disciplined_count, Count(*) as total_count, category 
from data_allegation da, data_officerallegation doa, data_allegationcategory dac
where da.id = doa.allegation_id
and dac .id = doa.allegation_category_id group by category

