-- Channel portfolio management 
-- analysis portfolio means - bidding efficient and use 
-- data to maximize effectiveness of marketing
-- channel- email,social network,search 
use learningportal;
select  utm_content,
count(distinct website_sessions.website_session_id) as sessions,
 count(distinct orders.order_id) as orders 
 from website_sessions left join orders
 on website_sessions.website_session_id=orders.website_session_id
where website_sessions.website_session_id between 1000 and 
2000 group by 1 order by 2 desc;

-- Business assignment 1. after gsearch launch bsearch on weekly trend  to see new lainc perf 
select 
Yearweek(created_at) as yrwk,
-- wkstart,
count(distinct website_session_id) as web_session,
count(distinct case when utm_source='gsearch' then  website_session_id else null end) as  gsearch,
count(distinct case when utm_source='bsearch' then  website_session_id else null end) as  bsearch
from website_sessions
where created_at > '2012-03-22'
and created_at<'2012-06-29'
and utm_campaign = 'nonbrand'
group by 1;
 
 -- channel portfolio trend 
 -- analysis for direct search where source is null 
 

