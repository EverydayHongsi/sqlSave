-- 새행 삽입 : 삽입할 컴럼 수, 컬럼 데이터가 일치(기본)


desc dept

insert into dept
values ( 50, 'a', 'b');

select * from dept


insert into emp (empno, hiredate)
values (9090, sysdate);


select * from emp where empno = 9090


select SYSDATE from dummy
union
select current_date from dummy


alter session set nls_date_format = 'DD-MON-RR';
alter session set nls_date_format = 'rr/mm/dd';

-- 새행 삽입 : 삽입할 컬럼 수, 컬럼 자료형 일치 (기본)
INSERT INTO DEPT
VALUES (50, 'A', 'B');

SELECT * FROM DEPT;

-- NULL 값을 가진 행 삽입
-- 암시적
INSERT INTO DEPT (DEPTNO, DNAME)
VALUES (60, 'C');

SELECT * FROM DEPT;

-- 명시적
INSERT INTO DEPT
VALUES (70, 'D', NULL);

SELECT * FROM DEPT;

-- 특수값 삽입 : 함수 사용 가능
INSERT INTO EMP (EMPNO, HIREDATE)
VALUES (9090, SYSDATE);

SELECT * FROM EMP WHERE EMPNO = 9090;

SELECT SYSDATE FROM DUMMY
UNION
SELECT CURRENT_DATE FROM DUMMY;

select sessiontimezone, current_date from DUMMY;

-- 다른 테이블에서 행 복사해서 삽입
INSERT INTO DEPT (DEPTNO)
SELECT GRADE FROM SALGRADE
WHERE GRADE = 1;

SELECT * FROM DEPT;

-- UPDATE 구문
SELECT * FROM DEPT;

UPDATE DEPT
SET DNAME = 'G'
WHERE DEPTNO = 60;

SELECT * FROM DEPT;

-- CEMP 테이블에 7900 사원의 직책과 급여를 동시에 변경
-- 7788 사원의 직책과 급여로 변경
CREATE TABLE CEMP
AS
SELECT * FROM EMP;

SELECT * FROM CEMP;

UPDATE CEMP
SET JOB = (SELECT JOB
           FROM CEMP
           WHERE EMPNO = 7788),
    SAL = (SELECT SAL
           FROM CEMP
           WHERE EMPNO = 7788)
WHERE EMPNO = 7900;

SELECT * FROM CEMP;

-- 실습 : CEMP테이블에서 사번이 7934번인 사원의 동일한 직책을 가진 사원들의 SAL값을
-- 사번이 7876인 사원의 MGR 값으로 변경하시오
UPDATE CEMP
SET SAL = (SELECT MGR
           FROM CEMP
           WHERE EMPNO = 7876)
WHERE JOB = (SELECT JOB
             FROM CEMP
             WHERE EMPNO = 7934);

CREATE TABLE COPY_EMP
AS
SELECT * FROM EMP;

SELECT * FROM COPY_EMP;

-- EMP 테이블 기반으로 사원번호가 7934인 사원의 직책과 동일한 사원의 부서번호를
-- 현재 7902사원의 부서번호로 모두 변경한다.
UPDATE COPY_EMP
SET DEPTNO = (SELECT DEPTNO
              FROM EMP
              WHERE EMPNO = 7902)
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE EMPNO = 7934);

SELECT * FROM COPY_EMP;

-- 실습
-- EMP 테이블을 기반으로 사원번호가 7934인 사원의 매니저와 동일한 부서번호를 가지고 있는
-- 모든 사원의 부서번호를 현재(COPY_EMP) 7902 사원의 부서 번호로 모두 변경한다.
UPDATE COPY_EMP
SET DEPTNO = (SELECT DEPTNO
              FROM EMP
              WHERE EMPNO = 7902)
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                               FROM EMP
                               WHERE EMPNO = 7934));

-- DELETE 구문
SELECT * FROM DEPT;

DELETE FROM DEPT
WHERE DEPTNO = 50;

SELECT * FROM DEPT;

DELETE DEPT
WHERE DEPTNO IN (60, 70);

DELETE FROM COPY_EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH');
