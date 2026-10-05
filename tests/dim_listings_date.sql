select 
* 
from 
{{ref('dim_listings_with_hosts')}}
where created_at > updated_at
limit 10