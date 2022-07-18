select * from emp
where sal > (select sal from emp where ename='JONES');

select ename, sal
from emp
where sal in (select sal from emp where deptno =10);

select empno, ename, sal
from emp
where sal in ( 
select round(avg(sal)) from emp 
group by deptno )

-- 부서번호별로 가장 많은 급여를 받는 사원의 정보를 조회하세요
select empno, ename, sal, deptno
from emp
where sal in ( 
select round(max(sal)) from emp 
group by deptno 
)

select empno, ename, sal
from emp
where empno in ( 
select mgr from emp )


--실습 : 반대로 다른 직원의 상관이 아닌 
--(부하직원이 없는 ) 직원들의 사번 , 이름, 매니저 번호를 조회하세요

select empno, ename, sal
from emp
where empno not in ( 
select mgr from emp where mgr is not null)


-- 결과에 null 이 있으면 항상 결과가 없다고 나온다.
-- not in 쓸때는 null이 없는지 확인해야함.


-- in은 in 만 쓰고, any 는 비교연산자와 함께 씀

select sal
from emp
where job = 'SALESMAN'

select ename, sal
from emp
where sal > any (
            select sal from emp where job = 'SALESMAN' )
            
-- any에 3개면 3번 반복해서 비교한다.

-- 실습 : 부서 번호가 10,20,30번인 직원들의 부서번호별 평균 급여 하나보다
        --작거나 같은 급여를 받는 직원의 급여, 이름, 사번
        


select sal, ename, empno
from emp
where sal <= any(
select avg(sal)
from emp
group by deptno
)


select ename, sal
from emp
where sal > all (

select sal
from emp
where job = 'SALESMAN'
)

-- 20번 부서의 최소 sal 보다 더큰 각 부서별 최소 sal을 구하세요

select min(sal)
from emp
where deptno = 20
group by deptno

select min(sal)
from emp
where sal > (
select min(sal)
from emp
where deptno = 20
group by deptno
)
group by deptno


-- emp 테이블에서 직책별 평균 급여가 가장 적은직책과
-- 그 평균급여를 조회하시오

select job, avg(sal)
from emp
group by job
having avg(sal) = (
select min(avg(sal))
from emp
group by job
)
