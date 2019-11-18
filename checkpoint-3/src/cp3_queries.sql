-- CP3 Queries

-- Q3 What percentage allegations had their category changed?
-- Of those, what are the top 3 most common statute descriptions?
select (select count(*) as num_false
from allegation_mapping_old_and_new
where allegation_mapping_boolean is false) / (select count(*) as total
from allegation_mapping_old_and_new)::float * 100

-- 56356 / 175533 = 32%
