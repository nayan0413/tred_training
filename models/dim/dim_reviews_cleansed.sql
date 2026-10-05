{{
    config(
        materialized = 'table',
        partition_by = {
            "field" : "listing_id",
            "data_type" : "int64",
            "range" : {
                "start" : 3000,
                "end" : 60000000,
                "interval" : 1000000
            }
        }
    )
}}


with cte as 
(
    select
    *
    from 
    {{ref('src_reviews')}}
    where listing_id is not null
)
select
listing_id,
review_date,
reviewer_name,
review_text,
review_sentiment
from 
cte