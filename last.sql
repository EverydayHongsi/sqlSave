create table copy_emp2
(empno number(4),
ename varchar(20),
job char(20),
sal number(7, 2),
hiredate date);

-- 고정 크기의 자료형은 메모리의 낭비가 있지만, 찾아가기는 쉽다. ( 8칸짜리로 나눠져있을 테니 )
-- var는 변하는 것.

desc copy_emp2


create table BIGDATA1
(d1 long, d2 long raw);
-- a table may contain only one column of type LONG

create table bigdata2
(d1 clob, d2 blob, d3 bfile);

create table emps
as
select * from emp;

select * from emps;


-- 빈거 열만 맞춰서 생성
create table copy_emp3
as
(select * from emp where ename = '')

desc copy_emp3

-- 문제 : copy_emp3 에 emp 데이블 데이터 삽입
insert into copy_emp3
select * from emp

-- 열 추가
alter table emps
add hp varchar(10)
select * from emps


-- alter table emps
alter table emps
rename column hp to mp

-- 타입수정
alter table emps
modify hp varchar(15);

-- 삭제
alter table emps
drop column mp;

desc emps


--읽기 전용
alter table emps read only;

insert into emps (empno)
values(9999);

--읽기 전용이어도 됨. 타입변경도됨.
alter table emps
add mp varchar(10);

select * from emps

alter table emps read write;

-- 읽기 전용이어도 테이블 자체의 삭제는 가능하다.
-- 수정은 안되지만.
drop table emps;

desc emps

-- 휴지통 보기
show recyclebin
flashback table emps
to before drop
-- 되돌리기

-- 주석달기
comment on table copy_emp2
is 'employee table'

desc copy_emp2
select * from copy_emp2

-- 주석 모아논 테이블
desc user_tab_comments

rename copy_emp3
to emps;

desc emps

