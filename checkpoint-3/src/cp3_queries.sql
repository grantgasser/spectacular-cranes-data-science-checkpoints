-- CP3 Queries

-- Q3 What percentage allegations had their category changed?
-- Of those, what are the top 3 most common statute descriptions?
select (select count(*) as num_false
from allegation_mapping_old_and_new
where allegation_mapping_boolean is false) / (select count(*) as total
from allegation_mapping_old_and_new)::float * 100

/* 
RESULT:

56356 / 175533 = 32%
*/

-- Q3 pt2
select statute_description, count(*) as cnt from allegation_mapping_old_and_new as map_old_new,
temp_arrests_and_allegations_total aa
where map_old_new.crid_and_log_no = aa.crid
and map_old_new.allegation_mapping_boolean is false
group by statute_description
order by cnt desc
limit 3

/* 
RESULT:

"PCS - POSSESSION - LESS THAN 15 GRMS - COCAINE"	"17802"
"DISORDERLY CONDUCT - BREACH OF PEACE"	"10026"
"CRIMINAL TRESPASS TO STATE LAND"	"9447"
*/
