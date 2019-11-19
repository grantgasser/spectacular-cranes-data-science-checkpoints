-- CP3 Queries

-- Q1 For each officer, count the number of allegation changes, showing the old and new category name
select d.id, d.first_name, d.last_name ,am.old_category, am.new_allegation_name new_cat,
count(am.old_category) old_cat
from data_allegation da, allegation_mapping_old_and_new am, data_officerallegation doa, data_officer d
where am.crid_and_log_no = da.crid
and doa.allegation_id = da.id
and doa.officer_id = d.id
and am.allegation_mapping_boolean is false
group by d.id, d.first_name, d.last_name, d.first_name, d.id, am.new_allegation_name, am.old_category
order by d.id, old_cat desc

-- Q2 Identify the top 10 officers (time permitting, investigators)
-- whose associated allegations (categories) changed most often.
select aa.officer_id, aa.officer_fname, aa.officer_lname, count(distinct aa.crid ) as num_allegation_category_changes 
from temp_arrests_and_allegations_total aa, allegation_mapping_old_and_new as map_old_new
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

-- Q3 Identify the top 10 investigators
-- whose associated allegations (categories) changed most often.
select map_old_new.new_investigator_id, di.first_name, di.last_name, count(distinct aa.crid) as num_allegation_category_changes 
from temp_arrests_and_allegations_total aa, allegation_mapping_old_and_new as map_old_new, data_investigator di
where map_old_new.crid_and_log_no = aa.crid
and map_old_new.new_investigator_id = di.id
and map_old_new.allegation_mapping_boolean is false
group by map_old_new.new_investigator_id, di.first_name, di.last_name
order by num_allegation_category_changes desc 
limit 10

/*
RESULT:
id first last num_allegation_category_changes
3182	"Maria"	"Olvera"	"689"
3281	"George"	"Roberts"	"540"
3228	"Bruce"	"Dean"	"535"
3283	"Lorenzo"	"Davis"	"425"
3260	"Patrick"	"Querfurth"	"392"
3289	"Andrea"	"Stoutenborough"	"325"
3303	"Paula"	"Tillman"	"321"
3274	"Alexis"	"Serio"	"306"
3163	"Sherry"	"Daun"	"303"
3301	"Joseph"	"Fakuade"	"287"
*/

-- Q4 What percentage allegations had their category changed?
-- Of those, what are the top 3 most common statute descriptions?
select (select count(*) as num_false
from allegation_mapping_old_and_new
where allegation_mapping_boolean is false) / (select count(*) as total
from allegation_mapping_old_and_new)::float * 100

/* 
RESULT:

56356 / 175533 = 32%
*/

-- Q4 pt2
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
