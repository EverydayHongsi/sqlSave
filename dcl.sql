-- 트랜잭션 : 데이터가 최종전달 된 다음 양쪽 테이블의 데이터를 커밋하는 것.
--일관성, 동시성을 만족시킴

-- select를 제외하고 테이블에 영향을 미치는 구문을 하면 트랜잭션이 자동시작
--



-- 무결성: 조건을 만족할 때만 통과시킴
-- primary key : 반드시 필수
-- not null
-- check
-- unique : 중복안됨
-- foreign key : primary key 를 참조하도록 되어있음


create table dept1
(deptno number(2) primary key,
dname varchar2(20) unique,
loc varchar(20));

desc dept1

create table emp1
(empno number(4) constraint emp1_empno_pk primary key,
ename varchar(20) constraint emp1_ename_nn not null,
sal number(7,2),
deptno number(2),
constraint emp1_sal_ck check (sal between 500 and 5000),
constraint emp1_deptno_fk foreign key (deptno) references dept1 (deptno));

desc emp1

insert into dept1
values (1, '영업', '서울')

select * from dept1
select * from emp1

insert into dept1
values (2, '회계', '부산')

insert into emp1
values (1111, 'HONG', 3000, 2);
