use learningportal;

select 
primary_product_id,
count(order_id) as orders,
count(price_usd) as revenue,
sum(price_usd-cogs_usd) as margin ,
avg(price_usd) as aov 
from orders where order_id between 1000 and 2000 group by 1 order by 2 desc;

-- Business assignment - 1. get monhtly trend for number of sales total revenue and margin  for business
select 
year(created_at) as yr, month(created_at) as mth, count(distinct  order_id) as noofsales,
sum(price_usd) as total_revenue,
sum(price_usd-cogs_usd)
from orders
where created_at < '2012-04-04'
group by 
1,2;


-- -------------------------------------------------------------------------------------

-- User analysis
-- Business assignment - 1. Find repeat session customer 

create temporary table session_w_repeat
select new_sessions.user_id,
new_sessions.website_session_id as new_session_id,
website_sessions.website_session_id as repeat_session_id
from (
select user_id,
website_session_id from website_sessions where
 created_at < '2012-06-05' and created_at>='2012-03-02' and 
 is_repeat_session = 0) as new_sessions left join website_sessions 
 on website_sessions.user_id = new_sessions.user_id 
 and website_sessions.is_repeat_session = 1
 and website_sessions.website_session_id > new_sessions.website_session_id
 and website_sessions.created_at < '2012-06-05' and website_sessions.created_at>='2012-03-02';

select repeat_sessions,
count(distinct user_id) as Users
from (
select user_id,
count(distinct new_session_id) as new_sessions,
count(distinct repeat_session_id) as repeat_sessions from session_w_repeat
group by 1 order by 2 desc ) as user_level group by 1;

