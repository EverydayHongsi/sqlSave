select e.empno, e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno

select e.empno, e.ename, d.dname
from emp e INNER JOIN dept d
on e.deptno = d.deptno


-- non equi join 테이블의 어떤 컬럼도 조인할때 일치하지 않을 때, 사이값 은 일치할 수도 있다. 일치할 때 행을 합쳐버림.
-- 하지만 이렇게 하지 않게 설계하는게 맞아서 거의 안씀.

select ename, sal, s.grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

--3way join // 좋은 데이터베이스 설계는 아님.
-- 뒤에 선언된 테이블과는 조인될 수 없다. 즉 a b c 가 있으면 a,b // a,c 만 비교 가능함.
-- where 쓸거면( 오라클 문법 ) where만, on 쓸거면 (ansi) on만

select e.ename, d.dname, s.grade
from emp e INNER JOIN dept d
on e.deptno = d.deptno
INNER JOIN salgrade s
on e.sal between s.losal and s.hisal

-- self join 같은 테이블에도 데이터가 꼬여있을 수 있음. 행별로 참조가 일어날 수 있음.
-- ''로 하면 안됨.
-- outer join
-- 값이 없는 조인측에 (+)를 위치시킨다.
select e.ename, c.mgr "manager Name"
from emp e, emp c
where e.mgr = c.empno

-- 모든 사원명, 부서번호와 부서명을 조회 (그냥하면 join 조건에 없을 때 안나와버림 )
-- 아우터 조인은 추가로 조인할 수 있음.
-- 어디에 나와야지? (+) 다음에 나옴. 즉 (+)는 공간을 늘리는 역할.
select DISTINCT(e.deptno), d.deptno, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno

-- 매니저가 없는 사원도 우선 나오게 해야하므로, 뒤에 있는 테이블이 확장되어야함. 앞에것이 더 많으니까.(사원이 14명)

select e.ename, e.mgr , c.ename, c.empno
from emp e, emp c
where c.empno(+) = e.mgr

-- ansi outer join
-- left,right outer join 써진 방향을 다 나오게 할것이다.
select distinct(e.deptno), d.deptno
from emp e right outer join dept d
on e.deptno = d.deptno



--아우터 조인에서 and로 제한하냐, where로 제한하냐에 따라 결과가 다름.
--where은 제한하지만, and는 더 많이 허용함.