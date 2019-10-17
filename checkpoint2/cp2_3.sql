-- Create a mapping for the codes
-- Try to visualize with Tableau
select category_code, current_category as old_category, allegation_name as new_category_name, category as new_category 
from data_allegationcategory, case_info_08282018
where category_code = current_category_code
