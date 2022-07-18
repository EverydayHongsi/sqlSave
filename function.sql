
-- emp 테이블에서 ename 값을 앞에 두개 문자만 남기고 *로 변환하여 출력
select concat(substr(ename,0,2), rpad('*', length(ename)-2,'*')) from emp;

-- 월단위로 반올림을 할 수 있음.
select round(hiredate,'month') from emp;

-- 케이스 덴은 문자열만 되는 듯.
select comm,
case when comm >= 0 then to_char(comm)
else '대기발령'
END as loc
from emp

select ename, case when comm > sal then 'GOOD' else 'BAD' END as result
from emp

-- 날짜 비교
select ename, to_date(hiredate) from emp
where to_date(hiredate) < to_date('01-JAN-1981')

-- 문자열 비교
select ename, substr(ename,0,1), sal from emp
where substr(ename,0,1) >= 'H' and substr(ename,0,1) <= 'U'

--union all을 제외하고 set 연산자는 sort가 발생하므로 느려짐 발생가능.

