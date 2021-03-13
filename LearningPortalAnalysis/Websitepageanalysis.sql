-- Page view Analysis
use learningportal;
-- top page 
select pageview_url,count(distinct website_pageview_id) as pvs
 from website_pageviews where website_pageview_id<1000
 group by pageview_url order by pvs desc;
create temporary table first_pageview
select website_session_id,
min(website_pageview_id) as min_pv_id
from website_pageviews
where website_pageview_id < 1000
group by website_session_id;

select 
-- fp.website_session_id,
wp.pageview_url as landing_page,
count(distinct wp.website_session_id) as session_hitting
 from first_pageview as fp 
left join website_pageviews as wp
on fp.min_pv_id=wp.website_pageview_id
group by 1;
-- home page is the most frequently landing page 
 
-- Business Assignment 1. find pageview by volume 
select 
pageview_url as landing_page,
count(distinct website_pageview_id) as pvs
 from  website_pageviews 
 group by 1 order by 2 desc;

-- 2.landing page rank
-- steps 1.find first page view for each session  2. find the url customer saw 
create temporary table entryp
select 
website_session_id,
min(website_pageview_id) as pvs
 from website_pageviews
 where created_at < '2012-06-12'
 group by 1;

select wp.pageview_url as landingpage,
count(distinct entryp.website_session_id) as session_hitting from entryp left join website_pageviews as wp
on entryp.pvs = wp.website_pageview_id
group by 1;


-- ---------------------------------------------------------------------------------------------
-- Building conversion funnel analysis and testing
-- Conversion funnel - understanding and optimizing
--  each step of user exp 	on their 
--  journey towards purchase of product 

-- step: create temporary table for multi step funnel and mark succes 
