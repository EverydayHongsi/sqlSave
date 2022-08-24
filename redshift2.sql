create temp table float_test (
  A REAL,
  B double precision
  );

  INSERT INTO FLOAT_TEST
  VALUES (123.4560001, 123.45600001);

  select * from float_test;


  create temp table space_Test (
    A varchar(10)
    );

insert into space_test values (' ');

select ' ' = '';
select count(1) from space_test where a='';
-- 공백을 빈 문자로 인식해버림. 원래는 다르지만.
-- 마스킹 : 중요 데이터를 사용자가 알아 볼 수 없도록 의미 없는 값이나 원복이 가능한 암호화 된 값으로 변경하는 절차. 데이터를 마스킹할 때 공백문자를 사용.

show timezone;



create schema example;

create table example.timezone_test (
  PK int,
  "date" DATE,
  "timestamp" timestamp,
  "timestampz" timestamptz
  );


/* 타임존을 서울로 변경하고 데이터를 입력 */
set timezone to 'ASIA/SEOUL'


show timezone

insert into example.timezone_test values
(1, '2022-07-22', '2022-07-22 00:00:00', '2022-07-22 00:00:00'),
(2, '2022-07-22 KST', '2022-07-22 00:00:00 KST', '2022-07-22 00:00:00 KST'),
(3, '2022-07-22 PST', '2022-07-22 00:00:00 PST', '2022-07-22 00:00:00 PST');

select * from example.timezone_test;