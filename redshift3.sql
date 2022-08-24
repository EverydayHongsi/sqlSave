select database, schema, "table", diststyle, skew_rows
from pg catalog.svv_table_info
where table = "seoul_public_bicycle_usage"

show search_path;

set search_path to 'tickit';

select "column", type, encoding, distkey, sortkey
from pg_table_def
where tablename = 'users';


select slice, col, num_values as rows, minvalue, maxvalue
from svv_diskusage
where name  = 'users' and col = 0 and slice > 0
order by slice, col;


-- 키분산
create table userskey distkey(state)
as
select * from users;


select * from userskey;



select slice, col, num_values as rows, minvalue, maxvalue
from svv_diskusage
where name  = 'userskey' and col = 0 and slice > 0
order by slice, col;


--균등분산
create table userseven diststyle even
as
select * from users;


select slice, col, num_values as rows, minvalue, maxvalue
from svv_diskusage
where name  = 'userseven' and col = 0 and slice > 0
order by slice, col;


-- 전체분산
create table usersall diststyle all
as
select * from users;


select slice, col, num_values as rows, minvalue, maxvalue
from svv_diskusage
where name  = 'usersall' and col = 0 and slice > 0
order by slice, col;




UNLOAD('
  select date, hour, rental_place_num, usage_count
	from data.seoul_public_bicycle_usage
	where date = ''2017-01-01''
')
To 's3://s3-example-redshift-7777/seoul-public-bicycle-usage-7777/20170101/'
IAM_ROLE 'arn:aws:iam::704839907101:role/exampleRedShiftRole'
DELIMITER AS '\007' NULL AS '\005'
ALLOWOVERWRITE GZIP ESCAPE ADDQUOTES;



COPY data.seoul_public_bicycle_usage ( date, hour, rental_place_num, usage_count )
  From 's3://s3-example-redshift-7777/seoul-public-bicycle-usage-7777/20170101/'
IAM_ROLE 'arn:aws:iam::704839907101:role/exampleRedShiftRole'
FORMAT DELIMITER AS '\007' NULL AS '\005'
GZIP CSV FILLRECORD EMPTYASNULL ACCEPTINVCHARS;


  select date, hour, rental_place_num, usage_count
	from data.seoul_public_bicycle_usage
	where date = '2017-01-01'