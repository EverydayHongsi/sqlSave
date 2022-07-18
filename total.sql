-- Function
-- Single row function
-- : 문자, 숫자, 날짜, 변환 등등

-- MULTIPLE ROW FUNCTION (\여러 값을 만나 값 하나를 돌려주는 함수)
select count(*), min(sal), max(sal) from emp;

-- group function
-- group by 절
-- 작은 그룹 단위로 묶은 후 multiple row function을 적용
select depno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2500;

-- select문
-- 4 select 컬럼명, 커럼명, * f(x), ||, 'STRING', ALIAS(as), DISTINCT(),SAL*12
-- 1 from 테이블명, 테이블명, ... n
-- 2 where condition => 연산자(비교/논리/between and, In, LIKE, IS NULL) => NOT 부정 가능
-- 3 group by 컬럼, 컬럼 .. n (여러개 가능)
-- 5 having condition => where condition에서 사용하는 연산모두 사용가능
-- 6 order by 컬럼명(컬럼명/alias/position(숫자로 가능)) <asc/desc>, 정렬도 컬럼명 여러개 가능.

   -- 먼저 찾고 조건보고 선택. 그다음 정렬
   -- 1,2번으로 우선 어디서 뭘 가져올지 전체적으로 선택함으로써 연산속도를 줄일 수 있음.
   -- 그룹바이, select( 그룹바이에 있는 걸 써야함 )
   -- 그룹바이 조건 걸어주기


-- where절은 전체 조건을 true로 만족하는 row 제한
-- having절은 조건을 true로 만족하는 group 제한

--문제 : 급여가 1000 이상인 사원을 대상으로 조사.
-- 부서 번호별 직책별 평균급여를 구하려고함
-- 단 평균 급여는 2000이상, 평균급여가 많은 순으로


select deptno, job, avg(sal)
from emp
where sal > 1000
group by deptno, job
having avg(sal) > 2000
order by avg(sal) desc

select * from emp
