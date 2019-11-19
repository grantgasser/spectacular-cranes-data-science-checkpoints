-- CP3 Queries

-- Q2 Identify the top 10 officers (time permitting, investigators)
-- whose associated allegations (categories) changed most often.
select aa.officer_id, aa.officer_fname, aa.officer_lname, count(*) as num_allegation_category_changes from temp_arrests_and_allegations_total aa,
allegation_mapping_old_and_new as map_old_new
where map_old_new.crid_and_log_no = aa.crid
and map_old_new.allegation_mapping_boolean is false
group by aa.officer_id, aa.officer_fname, aa.officer_lname
order by num_allegation_category_changes desc 
limit 10

/*
RESULT:

crid  first   last  num_allegation_category_changes
16551	"Eric"	"Lee"	"461"
18639	"Daniel"	"Rosales"	"444"
20058	"Lourdes"	"Neris"	"428"
14700	"Mark"	"Malecki"	"418"
31844	"Leticia"	"Kaner"	"414"
6094	"Keith"	"Kalafut"	"414"
12147	"Michael"	"Tiardovich"	"401"
19520	"Diego"	"Flores"	"395"
2109	"Kevin"	"Prendkowski"	"390"
2153	"Andrew"	"Costello"	"390"
*/

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
