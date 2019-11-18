-- TEMP TABLE: Combine Arrests and Allegation Data
-- 1st
select
    do_alleg.officer_id,
    d_alleg.id,
    d_alleg.crid,
    d_alleg.location
into temp_arrests_and_allegations
from data_allegation d_alleg
inner join data_officerallegation do_alleg on d_alleg.id = do_alleg.allegation_id

--2nd
select
    do_arrest.arrest_id,
    do_arrest.id as officer_id2,
    do_arrest.first_name as officer_fname,
    do_arrest.last_name as officer_lname,
    do_arrest.cb_number,
    d_arrest.first_name as arestee_fname,
    d_arrest.last_name as arestee_lname,
    statute,
    statute_description
into temp_arrests_and_allegations_2
from data_officerarrest do_arrest
inner join data_arrest d_arrest on d_arrest.id = do_arrest.arrest_id

--3rd
select *
into temp_arrests_and_allegations_total
from temp_arrests_and_allegations aa
inner join temp_arrests_and_allegations_2 bb on aa.officer_id = bb.officer_id2
order by aa.crid

-- temp_arrests_and_allegations_total is the new temp table to be joined with mapping! 
