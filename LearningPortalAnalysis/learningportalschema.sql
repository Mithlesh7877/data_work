SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

SET global time_zone = '-5:00'; -- commented out in this version

SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
  
-- DROP SCHEMA IF EXISTS mavenmovies; -- commenting out for Maven Course to avoid concerning warning message

USE learningportal;

--
-- Creating an empty shell for the table 'website_sessions'. We will populate it later. 
--

CREATE TABLE website_sessions (
  website_session_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at TIMESTAMP NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  is_repeat_session SMALLINT UNSIGNED NOT NULL, 
  utm_source VARCHAR(12), 
  utm_campaign VARCHAR(20),
  utm_content VARCHAR(15), 
  device_type VARCHAR(15), 
  http_referer VARCHAR(30),
  PRIMARY KEY (website_session_id),
  KEY website_sessions_user_id (user_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


--
-- Creating an empty shell for the table 'website_pageviews'. We will populate it later. 
--

CREATE TABLE website_pageviews (
  website_pageview_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at TIMESTAMP NOT NULL,
  website_session_id BIGINT UNSIGNED NOT NULL,
  pageview_url VARCHAR(50) NOT NULL,
  PRIMARY KEY (website_pageview_id),
  KEY website_pageviews_website_session_id (website_session_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


--
-- Creating an empty shell for the table 'products'. We will populate it later. 
--

CREATE TABLE products (
  product_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at TIMESTAMP NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (product_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

--
-- Creating an empty shell for the table 'orders'. We will populate it later. 
--

CREATE TABLE orders (
  order_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at TIMESTAMP NOT NULL,
  website_session_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  primary_product_id SMALLINT UNSIGNED NOT NULL,
  items_purchased SMALLINT UNSIGNED NOT NULL,
  price_usd DECIMAL(6,2) NOT NULL,
  cogs_usd DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (order_id),
  KEY orders_website_session_id (website_session_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


--
-- Creating an empty shell for the table 'order_items'. We will populate it later. 
--

CREATE TABLE order_items (
  order_item_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at TIMESTAMP NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  product_id SMALLINT UNSIGNED NOT NULL,
  is_primary_item SMALLINT UNSIGNED NOT NULL,
  price_usd DECIMAL(6,2) NOT NULL,
  cogs_usd DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (order_item_id),
  KEY order_items_order_id (order_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


--
-- Creating an empty shell for the table 'order_item_refunds'. We will populate it later. 
--

CREATE TABLE order_item_refunds (
  order_item_refund_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at TIMESTAMP NOT NULL,
  order_item_id BIGINT UNSIGNED NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  refund_amount_usd DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (order_item_refund_id),
  KEY order_items_order_id (order_id),
  KEY order_items_order_item_id (order_item_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
