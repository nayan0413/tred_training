{{
    config(
        materialized = 'table',
        cluster_by = [
            "listing_id", "reviewer_name", "review_sentiment"
        ]
    )
}}


with cte_1 as 
(
    select
    *
    from
    {{source('airbnb','reviews')}}
)
select
listing_id,
date as review_date,
reviewer_name,
comments as review_text,
sentiment as review_sentiment
from 
cte_1