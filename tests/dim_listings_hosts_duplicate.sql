select
count(*)
from 
{{ref('dim_listings_with_hosts')}}
group by host_id
having count(*) > 1
limit 10