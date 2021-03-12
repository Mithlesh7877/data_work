-- Traffic Analysis
use learningportal;
-- select count(pageview_url) from website_pageviews where pageview_url ="/the-original-mr-fuzzy" ;
-- update website_pageviews set pageview_url = "/about" where pageview_url = "/the-original-mr-fuzzy";
-- safe mode error occured 
-- select distinct utm_source,utm_campaign from website_sessions;
-- null refers to not driven by paid campaign or forgot to put tracker 
-- steps to analyse 
-- 1.use the utm parameter in the databse to indetify paid sessions 
-- 2. from session data link to order data to understand revenue driven by paid campaign
-- ----------------------------------------------------------------------------------------------------------------------------
select utm_content,
count(distinct ws.website_session_id) as sessions,
count(distinct os.order_id) as orders,
count(distinct os.order_id)/count(distinct ws.website_session_id) as Convertion_rate
from website_sessions as ws
left join orders as os
on os.website_session_id=ws.website_session_id
 where ws.website_session_id between 1000 and 2000
group by  1-- utm_content
order by count(distinct ws.website_session_id) desc; -- can use alias also 
-- that is sessions or 1 and 2 indicating column 
-- ---with above code we get to know the conversion rate of different capmpaign sources 

-- Business assignment - 1.Find where bulk of website sessions are
-- coming from breaking it into utm source,campaign and referring domain upto XYZ date 

select utm_source,utm_campaign,http_referer,count(website_session_id) as sessions from website_sessions where created_at < "2012-04-12 " 
group by utm_source,utm_campaign,http_referer;

-- 2.get the conversion rate for best one in the above finding, upto xyd and if get 4% crt then will decide to spend more on campaign

select 
count(distinct ws.website_session_id) as session ,
count(distinct os.order_id) as orders,
count(distinct os.order_id)/count(distinct ws.website_session_id) as Convertion_rate
from 
website_sessions as ws left join orders as os 
on os.website_session_id=ws.website_session_id
 where ws.created_at < '2012-04-14'
and utm_source = 'gsearch' and utm_campaign = 'nonbrand';
-- --------------------------------------------------------------------------------------------------------------------
-- Bid Optimization - understnad the value of various segement of paid 
-- traffic so that you can optimize your market budget 

-- analysis based on date 
select month(created_at) as months,
week(created_at) as weeks,
min(date(created_at)) as start_date,
count(distinct website_session_id) as sessions
from website_sessions where website_session_id between 1000 and 4000
group by 1,2;
 
-- Business Assignment - 1. to pull gsearch nonbrand campaign
-- trended session volume by week to see if bid change has affected volume drop

select 
-- month(created_at) as mth,
-- week(created_at) as wk, 
min(date(created_at)) as week_start,
count(distinct website_session_id) as sessions
from website_sessions
where created_at < "2012-05-10" and utm_source = 'gsearch' and utm_campaign = 'nonbrand' 
group by month(created_at),week(created_at);
 

-- 2. accesing site from mobile does not seems to be good so business needs
-- conversion rate from sessions to order by device type 


select ws.device_type,
count(distinct ws.website_session_id) as sessions ,
count(distinct os.order_id) as orders,
count(distinct os.order_id)/count(distinct ws.website_session_id) as Convertion_rate
from 
website_sessions as ws left join orders as os 
on os.website_session_id=ws.website_session_id
 where ws.created_at < "2012-05-11"
 and utm_source = 'gsearch'
 and utm_campaign = 'nonbrand'
group by device_type;

-- 3.after increasing bid on desktop campaign
--  show the result on convertion ratio based on weekly trend 


select ws.device_type,
month(ws.created_at) as mth,
week(ws.created_at) as wks,
min(date(ws.created_at)) as start_week,
count(distinct ws.website_session_id) as sessions ,
count(distinct os.order_id) as orders,
count(distinct os.order_id)/count(distinct ws.website_session_id) as Convertion_rate
from 
website_sessions as ws left join orders as os 
on os.website_session_id=ws.website_session_id
 where ws.created_at < "2012-06-09"
 and ws.created_at > "2012-04-15"
 and device_type = 'desktop'
 and utm_source = 'gsearch'
 and utm_campaign = 'nonbrand'
 group by mth,wks;

-- session data for each device type

select 
month(ws.created_at) as mth,
week(ws.created_at) as wks,
count(distinct case when device_type='desktop' then website_session_id else
 null end) as desktop_sessions,
 count(distinct case when device_type='mobile' then website_session_id else
 null end) as mobile_sessions,
min(date(ws.created_at)) as start_week,
count(distinct ws.website_session_id) as sessions 
 from  
website_sessions as ws 
 where ws.created_at < "2012-06-09"
 and ws.created_at > "2012-04-15"
 and utm_source = 'gsearch'
 and utm_campaign = 'nonbrand'
 group by 1,2;
