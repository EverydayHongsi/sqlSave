/* 스키마 생성 */
CREATE SCHEMA data;

/* 서울특별시 공공자전거 대여소 정보 테이블 생성 */
CREATE TABLE data.seoul_public_bicycle_rental_place_info (
  idx BIGINT,
  district VARCHAR(30),
  rental_place_id VARCHAR(30),
  rental_place_num VARCHAR(30),
  rental_place_name VARCHAR(300),
  bicycle_cnt BIGINT,
  latitude NUMERIC(10, 6),
  longitude NUMERIC(10, 6)
) DISTSTYLE KEY
DISTKEY (rental_place_num)
SORTKEY (idx);

/* 서울특별시 공공자전거 이용정보(시간대별) 테이블 생성 */
CREATE TABLE data.seoul_public_bicycle_usage (
  date VARCHAR(10),
  hour VARCHAR(2),
  rental_place_num VARCHAR(30),
  rental_place_name VARCHAR(300),
  rental_category_code VARCHAR(20),
  gender VARCHAR(2),
  age_code VARCHAR(6),
  usage_count INT,
  monentum NUMERIC(10, 2),
  carbon_emmision NUMERIC(10, 2),
  travel_distance_meter BIGINT,
  travel_time_min BIGINT
) DISTSTYLE KEY
DISTKEY (rental_place_num)
SORTKEY (date);

/* data upload */
COPY data.seoul_public_bicycle_rental_place_info
FROM 's3://s3-example-redshift-7777/seoul-public-bicycle-rental-place-info-7777/'

CREDENTIALS 'aws_access_key_id=AKIA2IG53O4OQZXV6OT6;aws_secret_access_key=dy3mSxn91kmfqfgqdGQhceI2jfsNxd/j8n+6xKsF'
FORMAT
DELIMITER ','
NULL AS ''
IGNOREHEADER 1
REMOVEQUOTES;

/* data upload */
COPY data.seoul_public_bicycle_usage
FROM 's3://s3-example-redshift-7777/seoul-public-bicycle-usage-7777/'
CREDENTIALS 'aws_access_key_id=AKIA2IG53O4OQZXV6OT6;aws_secret_access_key=dy3mSxn91kmfqfgqdGQhceI2jfsNxd/j8n+6xKsF'
FORMAT
DELIMITER ','
NULL AS ''
IGNOREHEADER 1
REMOVEQUOTES;