-- Checkpoint 1, Question 3
-- Which investigators/administrators most often changed the category
-- of allegation (e.g. “Sexual assault” -> “Illegal Search and Seizure”)


-- this will get us started:
select investigator_id, current_rank from data_allegation da, data_investigatorallegation dia
where da.id = dia.allegation_id
