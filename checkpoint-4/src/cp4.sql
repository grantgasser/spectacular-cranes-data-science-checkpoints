-- THIS QUERY DOES NOT NEED TO BE RUN
-- JUST SHOWS HOW THE TABLE WAS CREATED BEFORE LOADING INTO DATABRICKS

-- join officer and allegation data, then join that with the mapping table
-- this gives 25283 rows
select officer.id as officer_id, officer.first_name as officer_fname,
officer.last_name officer_lname, officer.complaint_percentile,
alleg.crid, mapping_alleg.old_category, mapping_alleg.new_allegation_name,
mapping_alleg.allegation_mapping_boolean
from data_officer as officer
inner join data_officerallegation as officer_alleg on officer.id = officer_alleg.officer_id
inner join data_allegation as alleg on alleg.id = officer_alleg.allegation_id
inner join mapping_allegation_old_to_new as mapping_alleg on mapping_alleg.crid_and_log_no = alleg.crid
where mapping_alleg.allegation_mapping_boolean is false
