## Script to combine old_category_data and new_category_data sets
## to prepare for D3.js

import pandas as pd

new = pd.read_csv('new_category_data.csv', header=0)
old = pd.read_csv('old_category_data.csv', header=0)

print(new['count'])
print(len(old['count']))

# append this many 0's
for i in range(len(old['count']) - len(new['count'])):
    pass
