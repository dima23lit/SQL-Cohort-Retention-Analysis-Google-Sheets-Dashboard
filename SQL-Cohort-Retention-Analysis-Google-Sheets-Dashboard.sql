with parsed_users as (

    select
        u.user_id,
        u.signup_datetime, 
        u.promo_signup_flag,
        case
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2  
        	then to_date((split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD') 
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1
        	then to_date(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2  
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2  
        	then to_date(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1), 'YYYY-MM-DD')
            
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1  
        	then to_date(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1  
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	end as signup_ts
   
--        length(split_part(REGEXP_REPLACE((split_part(trim(u.signup_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) as clean_date

    from cohort_users_raw u
),
events_parsed as (
select
        e.user_id,
        e.event_type,
        e.event_datetime,
        case
        	when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2  
        	then to_date((split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD') 
        	when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1
        	then to_date(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2  
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 1 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 2  
        	then to_date(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1), 'YYYY-MM-DD')
            when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 4 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1  
        	then to_date(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	when length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2)) = 2 
        	and length(split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)) = 1  
        	then to_date(('20' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',3)) || '-' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',2) || '-' || ('0' || split_part(REGEXP_REPLACE((split_part(trim(e.event_datetime), ' ', 1)), '[./ ]', '-', 'g'), '-',1)), 'YYYY-MM-DD')
        	end as event_ts

    from cohort_events_raw e
),
user_activity as (
select u.user_id, 
       u.promo_signup_flag,
       u.signup_ts,
       date_trunc('month', u.signup_ts)::date as cohort_month,
       e.event_type,
       e.event_ts,
       date_trunc('month', e.event_ts)::date as activity_month,
       EXTRACT(MONTH FROM age(date_trunc('month', e.event_ts),
                       date_trunc('month', u.signup_ts))) as month_offset
from parsed_users u 
join events_parsed e on u.user_id = e.user_id

where u.signup_ts is not null  and e.event_ts is not null and e.event_type is not null  and e.event_type <> 'test_event'
)


select promo_signup_flag,
       cohort_month,
       month_offset,
       count(distinct user_id) as users_total

from user_activity 

where activity_month between '2025-01-01' and '2025-06-01'

group by promo_signup_flag,
         cohort_month, 
         month_offset
         
order by promo_signup_flag,
         cohort_month, 
         month_offset