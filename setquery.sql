-- UNION 유일한 값들만 나옴 (set)
select deptno from emp
UNION
select deptno from dept;

-- UNION ALL 다 보여줌.
select deptno from dept
UNION ALL
select deptno from emp

-- INTERSECT 교집합
select deptno from dept
INTERSECT
select deptno from emp

-- 복합쿼리 사용시 유의할 점
-- 두 select문의 컬럼 갯수, 데이터 유형이 일치하지 않을 경우

-- 컬럼 개수나 데이터 유형이 일치하지 않을 때 null을 넣는 것이 나음.
select deptno, hiredate from emp
union
select deptno, loc from dept;

-- 1) 변환 함수를 이용하여 해결 가능

select deptno, to_char(hiredate) from emp
union
select deptno, loc from dept;

--2) NULL 키워드를 사용해서 해결 가능.

select deptno, NULL, hiredate from emp
union
select deptno, loc, NULL from dept;


-- 3) null 을 넣으면서 타입도 일치시킬 수 있음

select deptno, to_char(NULL), hiredate from emp
union
select deptno, loc, to_date(NULL) from dept;


--4) 적절한 상수를 이용하여 해결 가능 (null이 안들어가게 하기위해)

select deptno, comm, hiredate from emp
union
select deptno, 0, NULL from dept;


select empno, sal, comm, ename from emp
union
select deptno, null,null, loc from dept
